import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/storage/secure_storage_service.dart';
import 'package:tactical_app/features/home/repositories/riot_version_repository.dart';
import 'package:tactical_app/features/splash/bloc/splash_event.dart';
import 'package:tactical_app/features/splash/bloc/splash_state.dart';

/// BLoC managing startup initialization logic, version API caching, and route selection.
@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SecureStorageService _storageService;
  final RiotVersionRepository _versionRepository;

  SplashBloc(this._storageService, this._versionRepository)
    : super(const SplashInitial()) {
    on<InitializeApp>(_onInitializeApp);
  }

  Future<void> _onInitializeApp(
    InitializeApp event,
    Emitter<SplashState> emit,
  ) async {
    emit(const SplashLoading());

    Future<void> fetchVersion() async {
      try {
        await _versionRepository.getAndSaveVersion();
      } catch (_) {
        // Soft-fail: proceed
      }
    }

    // Parallel bootstrap operations:
    // 1. Maintain splash visibility for visual elegance (1s)
    // 2. Pre-fetch and cache the latest Riot version in Secure Storage
    // 3. Read cached authentication tokens
    // 4. Read cached operative region
    final results = await Future.wait<dynamic>([
      Future.delayed(const Duration(milliseconds: 1000)),
      fetchVersion(),
      _storageService.read(AppConfig.accessTokenKey),
      _storageService.read(AppConfig.regionKey),
    ]);

    final String? token = results[2] as String?;
    final String? region = results[3] as String?;

    if (region == null || region.isEmpty) {
      emit(const SplashNavigateToRegionSelection());
    } else if (token != null && token.isNotEmpty) {
      emit(const SplashNavigateToHome());
    } else {
      emit(const SplashNavigateToLogin());
    }
  }
}
