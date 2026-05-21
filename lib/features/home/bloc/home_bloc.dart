import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/core/network/error_handler.dart';
import 'package:tactical_app/core/storage/secure_storage_service.dart';
import 'package:tactical_app/features/auth/repositories/auth_repository.dart';
import 'package:tactical_app/features/home/repositories/riot_pvp_repository.dart';
import 'package:tactical_app/features/home/repositories/riot_version_repository.dart';
import 'package:tactical_app/features/home/bloc/home_event.dart';
import 'package:tactical_app/features/home/bloc/home_state.dart';

/// BLoC responsible for pre-fetching/loading key static assets on the Home Screen.
@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RiotVersionRepository _versionRepository;
  final RiotPvpRepository _pvpRepository;
  final AuthRepository _authRepository;
  final SecureStorageService _storageService;

  HomeBloc(
    this._versionRepository,
    this._pvpRepository,
    this._authRepository,
    this._storageService,
  ) : super(const HomeInitial()) {
    on<FetchHomeAssets>(_onFetchHomeAssets);
    on<FetchProfileAssets>(_onFetchProfileAssets);
    on<FetchStorefrontForDashboard>(_onFetchStorefrontForDashboard);
  }

  Future<void> _onFetchHomeAssets(
    FetchHomeAssets event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());
    try {
      // Use standard active bundle ID for RGX 11z Pro as initial pre-fetch parameter
      const sampleBundleId = '35815cab-429d-79e4-43f5-e0af8fdac22b';

      // Perform static asset requests concurrently
      final results = await Future.wait([
        _versionRepository.getWeaponSkins(),
        _versionRepository.getBuddies(),
        _versionRepository.getPlayerCards(),
        _versionRepository.getPlayerTitles(),
        _versionRepository.getSprays(),
        _versionRepository.getBundle(sampleBundleId),
        _storageService.read(AppConfig.regionKey),
      ]);

      emit(
        HomeLoaded(
          skins: results[0] as List<RiotWeaponSkinModel>,
          buddies: results[1] as List<RiotBuddyModel>,
          cards: results[2] as List<RiotPlayerCardModel>,
          titles: results[3] as List<RiotPlayerTitleModel>,
          sprays: results[4] as List<RiotSprayModel>,
          bundle: results[5] as RiotBundleModel,
          region: results[6] as String?,
        ),
      );
      add(const FetchStorefrontForDashboard());
    } on AppException catch (e) {
      emit(HomeError(e.message));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onFetchProfileAssets(
    FetchProfileAssets event,
    Emitter<HomeState> emit,
  ) async {
    final currentState = state;
    if (currentState is! HomeLoaded) return;

    // Emit loading state for profile
    emit(currentState.copyWith(isProfileLoading: true));

    try {
      // Retrieve stored credentials for PvP and profile calls
      final userId = await _storageService.read(AppConfig.userIdKey);
      final accessToken = await _storageService.read(AppConfig.accessTokenKey);

      if (userId == null || userId.isEmpty) {
        emit(const HomeError('User ID not found. Please log in again.'));
        return;
      }
      if (accessToken == null || accessToken.isEmpty) {
        emit(const HomeError('Access token not found. Please log in again.'));
        return;
      }

      final results = await Future.wait([
        _authRepository.fetchAndSaveUserInfo(accessToken),
        _pvpRepository.getWallet(userId),
        _pvpRepository.getAccountXp(userId),
        _storageService.read(AppConfig.regionKey),
      ]);

      emit(
        currentState.copyWith(
          isProfileLoading: false,
          userInfo: results[0] as RiotUserInfoModel,
          wallet: results[1] as RiotWalletModel,
          accountXp: results[2] as RiotAccountXpModel,
          region: results[3] as String?,
        ),
      );
    } on AppException catch (e) {
      emit(HomeError(e.message));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onFetchStorefrontForDashboard(
    FetchStorefrontForDashboard event,
    Emitter<HomeState> emit,
  ) async {
    final currentState = state;
    if (currentState is! HomeLoaded) return;

    // Emit loading state for storefront
    emit(currentState.copyWith(isStorefrontLoading: true));

    try {
      // Retrieve user ID for storefront call
      final userId = await _storageService.read(AppConfig.userIdKey);

      if (userId == null || userId.isEmpty) {
        emit(currentState.copyWith(isStorefrontLoading: false));
        return;
      }

      // Fetch storefront data
      final storefront = await _pvpRepository.getStorefront(userId);

      emit(
        currentState.copyWith(
          isStorefrontLoading: false,
          storefront: storefront,
        ),
      );
    } on AppException {
      emit(currentState.copyWith(isStorefrontLoading: false));
    } catch (e) {
      emit(currentState.copyWith(isStorefrontLoading: false));
    }
  }
}
