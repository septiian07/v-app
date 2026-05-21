import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/core/network/datasources/version/riot_version_rest_client.dart';
import 'package:tactical_app/core/network/error_handler.dart';
import 'package:tactical_app/core/storage/secure_storage_service.dart';
import 'package:tactical_app/features/home/repositories/riot_version_repository.dart';

/// Concrete implementation of [RiotVersionRepository].
///
/// Fetches from [RiotVersionRestClient] and caches the version string and game assets in [SecureStorageService].
@LazySingleton(as: RiotVersionRepository)
class RiotVersionRepositoryImpl implements RiotVersionRepository {
  final RiotVersionRestClient _restClient;
  final SecureStorageService _storageService;

  RiotVersionRepositoryImpl(this._restClient, this._storageService);

  /// Helper to get the saved active language locale or fallback to 'en-US'.
  Future<String> _getLanguage() async {
    final locale = await _storageService.read(AppConfig.localeKey);
    return locale ?? 'en-US';
  }

  @override
  Future<RiotClientVersionModel> getAndSaveVersion() async {
    try {
      final response = await _restClient.getVersion();
      final versionModel = response.data;

      // Save client version string for subsequent API requests or reuse
      await _storageService.write(
        AppConfig.clientVersionKey,
        versionModel.version,
      );

      return versionModel;
    } on DioException catch (e) {
      throw AppException(
        message: ErrorHandler.handleDioError(e),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<String?> getSavedVersionString() async {
    return await _storageService.read(AppConfig.clientVersionKey);
  }

  @override
  Future<List<RiotWeaponSkinModel>> getWeaponSkins() async {
    try {
      const cacheKey = 'valorant_weapons_skins';

      // Check local storage first
      final cachedJson = await _storageService.read(cacheKey);
      if (cachedJson != null && cachedJson.isNotEmpty) {
        final List<dynamic> decoded = json.decode(cachedJson);
        return decoded
            .map((item) => RiotWeaponSkinModel.fromJson(item))
            .toList();
      }

      // If empty, fetch from remote API
      final language = await _getLanguage();
      final response = await _restClient.getWeaponSkins(language);
      final data = response.data ?? <RiotWeaponSkinModel>[];

      // Persist results to local storage
      final jsonString = json.encode(
        data.map((item) => item.toJson()).toList(),
      );
      await _storageService.write(cacheKey, jsonString);

      return data;
    } on DioException catch (e) {
      throw AppException(
        message: ErrorHandler.handleDioError(e),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<List<RiotBuddyModel>> getBuddies() async {
    try {
      const cacheKey = 'valorant_buddies';

      // Check local storage first
      final cachedJson = await _storageService.read(cacheKey);
      if (cachedJson != null && cachedJson.isNotEmpty) {
        final List<dynamic> decoded = json.decode(cachedJson);
        return decoded.map((item) => RiotBuddyModel.fromJson(item)).toList();
      }

      // If empty, fetch from remote API
      final language = await _getLanguage();
      final response = await _restClient.getBuddies(language);
      final data = response.data ?? <RiotBuddyModel>[];

      // Persist results to local storage
      final jsonString = json.encode(
        data.map((item) => item.toJson()).toList(),
      );
      await _storageService.write(cacheKey, jsonString);

      return data;
    } on DioException catch (e) {
      throw AppException(
        message: ErrorHandler.handleDioError(e),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<List<RiotPlayerCardModel>> getPlayerCards() async {
    try {
      const cacheKey = 'valorant_playercards';

      // Check local storage first
      final cachedJson = await _storageService.read(cacheKey);
      if (cachedJson != null && cachedJson.isNotEmpty) {
        final List<dynamic> decoded = json.decode(cachedJson);
        return decoded
            .map((item) => RiotPlayerCardModel.fromJson(item))
            .toList();
      }

      // If empty, fetch from remote API
      final language = await _getLanguage();
      final response = await _restClient.getPlayerCards(language);
      final data = response.data ?? <RiotPlayerCardModel>[];

      // Persist results to local storage
      final jsonString = json.encode(
        data.map((item) => item.toJson()).toList(),
      );
      await _storageService.write(cacheKey, jsonString);

      return data;
    } on DioException catch (e) {
      throw AppException(
        message: ErrorHandler.handleDioError(e),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<List<RiotPlayerTitleModel>> getPlayerTitles() async {
    try {
      const cacheKey = 'valorant_playertitles';

      // Check local storage first
      final cachedJson = await _storageService.read(cacheKey);
      if (cachedJson != null && cachedJson.isNotEmpty) {
        final List<dynamic> decoded = json.decode(cachedJson);
        return decoded
            .map((item) => RiotPlayerTitleModel.fromJson(item))
            .toList();
      }

      // If empty, fetch from remote API
      final language = await _getLanguage();
      final response = await _restClient.getPlayerTitles(language);
      final data = response.data ?? <RiotPlayerTitleModel>[];

      // Persist results to local storage
      final jsonString = json.encode(
        data.map((item) => item.toJson()).toList(),
      );
      await _storageService.write(cacheKey, jsonString);

      return data;
    } on DioException catch (e) {
      throw AppException(
        message: ErrorHandler.handleDioError(e),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<List<RiotSprayModel>> getSprays() async {
    try {
      const cacheKey = 'valorant_sprays';

      // Check local storage first
      final cachedJson = await _storageService.read(cacheKey);
      if (cachedJson != null && cachedJson.isNotEmpty) {
        final List<dynamic> decoded = json.decode(cachedJson);
        return decoded
            .map((item) => RiotSprayModel.fromJson(item))
            .toList();
      }

      // If empty, fetch from remote API
      final language = await _getLanguage();
      final response = await _restClient.getSprays(language);
      final data = response.data ?? <RiotSprayModel>[];

      // Persist results to local storage
      final jsonString = json.encode(
        data.map((item) => item.toJson()).toList(),
      );
      await _storageService.write(cacheKey, jsonString);

      return data;
    } on DioException catch (e) {
      throw AppException(
        message: ErrorHandler.handleDioError(e),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<RiotBundleModel> getBundle(String bundleId) async {
    try {
      final cacheKey = 'valorant_bundle_$bundleId';

      // Check local storage first
      final cachedJson = await _storageService.read(cacheKey);
      if (cachedJson != null && cachedJson.isNotEmpty) {
        final decoded = json.decode(cachedJson);
        return RiotBundleModel.fromJson(decoded);
      }

      // If empty, fetch from remote API
      final language = await _getLanguage();
      final response = await _restClient.getBundle(bundleId, language);
      final data = response.data ?? const RiotBundleModel();

      // Persist results to local storage
      final jsonString = json.encode(data.toJson());
      await _storageService.write(cacheKey, jsonString);

      return data;
    } on DioException catch (e) {
      throw AppException(
        message: ErrorHandler.handleDioError(e),
        statusCode: e.response?.statusCode,
      );
    }
  }
}
