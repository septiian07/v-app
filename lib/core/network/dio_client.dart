import 'package:chuck_interceptor/chuck_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/config/app_headers.dart';
import 'package:tactical_app/core/storage/secure_storage_service.dart';
import 'package:tactical_app/core/network/interceptors/auth_interceptor.dart';
import 'package:tactical_app/core/network/interceptors/language_interceptor.dart';

/// Singleton Dio HTTP client configured with:
/// - Base URL & timeouts from [AppConfig].
/// - Bearer-token injection via [SecureStorageService].
/// - Expired-credential detection via [AuthInterceptor].
/// - Language header injection via [LanguageInterceptor].
/// - [Chuck] interceptor for in-app HTTP inspection.
///
/// This class serves as a **Dio factory** — it configures and exposes
/// the [Dio] instance for use by Retrofit `@RestApi()` clients.
/// All HTTP calls are handled by generated Retrofit code; no manual
/// convenience methods are needed.
@lazySingleton
class DioClient {
  late final Dio _dio;
  final SecureStorageService _storageService;
  final Chuck _chuck;

  DioClient(this._storageService, this._chuck) {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(milliseconds: AppConfig.connectTimeout),
        receiveTimeout: const Duration(milliseconds: AppConfig.receiveTimeout),
        sendTimeout: const Duration(milliseconds: AppConfig.sendTimeout),
        headers: {
          AppHeaders.headerContentType: AppHeaders.contentTypeJson,
          AppHeaders.headerAccept: AppHeaders.acceptJson,
        },
      ),
    );

    // ── Interceptors ──────────────────────────────────────────────────────
    _dio.interceptors.addAll([
      LanguageInterceptor(_storageService),
      _authInterceptor(),
      AuthInterceptor(_chuck),
      if (!kReleaseMode) _chuck.dioInterceptor,
      if (!kReleaseMode) _loggingInterceptor(),
    ]);
  }

  /// Exposes the underlying [Dio] instance for Retrofit client injection.
  Dio get dio => _dio;

  // ── Auth Interceptor ────────────────────────────────────────────────────
  /// Injects the Bearer token and Riot-specific headers for Valorant API requests.
  InterceptorsWrapper _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _storageService.read(AppConfig.accessTokenKey);
        if (token != null && token.isNotEmpty) {
          options.headers[AppHeaders.headerAuthorization] =
              '${AppHeaders.authBearerPrefix}$token';
        }

        // For Riot PvP API requests, automatically inject required extra headers
        if (options.path.contains(AppHeaders.pvpNetDomain) ||
            options.baseUrl.contains(AppHeaders.pvpNetDomain)) {
          // 1. Client Version
          final version = await _storageService.read(
            AppConfig.clientVersionKey,
          );
          if (version != null && version.isNotEmpty) {
            options.headers[AppHeaders.headerRiotClientVersion] = version;
          }

          // 2. Client Platform (Base64)
          options.headers[AppHeaders.headerRiotClientPlatform] =
              AppHeaders.clientPlatformBase64;

          // 3. Entitlements JWT
          final entitlementsToken = await _storageService.read(
            AppConfig.entitlementsTokenKey,
          );
          if (entitlementsToken != null && entitlementsToken.isNotEmpty) {
            options.headers[AppHeaders.headerRiotEntitlementsJwt] =
                entitlementsToken;
          }
        }

        handler.next(options);
      },
      onError: (error, handler) {
        handler.next(error);
      },
    );
  }

  // ── Logging Interceptor ─────────────────────────────────────────────────
  LogInterceptor _loggingInterceptor() {
    return LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
    );
  }
}
