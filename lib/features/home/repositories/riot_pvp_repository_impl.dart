import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/core/network/datasources/pvp/riot_pvp_rest_client.dart';
import 'package:tactical_app/core/network/error_handler.dart';
import 'package:tactical_app/core/network/utils/shop_parser.dart';
import 'package:tactical_app/core/storage/secure_storage_service.dart';
import 'package:tactical_app/features/home/repositories/riot_pvp_repository.dart';
import 'package:tactical_app/features/home/repositories/riot_version_repository.dart';

/// Concrete implementation of [RiotPvpRepository].
///
/// Automatically retrieves active region and manages Riot PvP network operations.
/// HTTP response caching (5 min TTL) is handled transparently by [DioCacheInterceptor].
@LazySingleton(as: RiotPvpRepository)
class RiotPvpRepositoryImpl implements RiotPvpRepository {
  final Dio _dio;
  final SecureStorageService _storageService;
  final RiotVersionRepository _versionRepository;

  RiotPvpRepositoryImpl(
    this._dio,
    this._storageService,
    this._versionRepository,
  );

  /// Helper to fetch cached region and throw error if not found.
  Future<String> _getRegion() async {
    final region = await _storageService.read(AppConfig.regionKey);
    if (region == null || region.isEmpty) {
      throw const AppException(
        message:
            'Deployment region configuration not found. Please select region.',
      );
    }
    return region;
  }

  /// Instantiates a dynamic [RiotPvpRestClient] targeting the player's active region.
  RiotPvpRestClient _getClient(String region) {
    return RiotPvpRestClient(_dio, baseUrl: AppConfig.pvpBaseUrl(region));
  }

  @override
  Future<ParsedStorefrontModel> getStorefront(String userId) async {
    try {
      final region = await _getRegion();
      final storefrontRaw = await _getClient(region).getStorefront(userId, {});

      // Fetch cached/locally resolved static assets in parallel
      final assets = await Future.wait([
        _versionRepository.getWeaponSkins(),
        _versionRepository.getBuddies(),
        _versionRepository.getPlayerCards(),
        _versionRepository.getPlayerTitles(),
        _versionRepository.getSprays(),
      ]);

      // Parse and structure into clean ParsedStorefrontModel
      return await ShopParser.parseShop(
        storefront: storefrontRaw,
        skins: assets[0] as List<RiotWeaponSkinModel>,
        buddies: assets[1] as List<RiotBuddyModel>,
        cards: assets[2] as List<RiotPlayerCardModel>,
        titles: assets[3] as List<RiotPlayerTitleModel>,
        sprays: assets[4] as List<RiotSprayModel>,
        fetchBundle: (bundleId) => _versionRepository.getBundle(bundleId),
      );
    } on DioException catch (e) {
      throw AppException(
        message: ErrorHandler.handleDioError(e),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<RiotWalletModel> getWallet(String userId) async {
    try {
      final region = await _getRegion();
      return await _getClient(region).getWallet(userId);
    } on DioException catch (e) {
      throw AppException(
        message: ErrorHandler.handleDioError(e),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<RiotAccountXpModel> getAccountXp(String userId) async {
    try {
      final region = await _getRegion();
      return await _getClient(region).getAccountXp(userId);
    } on DioException catch (e) {
      throw AppException(
        message: ErrorHandler.handleDioError(e),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<RiotOffersModel> getOffers() async {
    try {
      final region = await _getRegion();
      return await _getClient(region).getOffers();
    } on DioException catch (e) {
      throw AppException(
        message: ErrorHandler.handleDioError(e),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<List<RiotPlayerNameModel>> getPlayerNames(
    List<String> playerIds,
  ) async {
    try {
      final region = await _getRegion();
      return await _getClient(region).getPlayerNames(playerIds);
    } on DioException catch (e) {
      throw AppException(
        message: ErrorHandler.handleDioError(e),
        statusCode: e.response?.statusCode,
      );
    }
  }
}
