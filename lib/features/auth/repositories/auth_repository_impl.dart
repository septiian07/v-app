import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/models/auth/riot_user_info_model.dart';
import 'package:tactical_app/core/network/datasources/auth/riot_entitlements_rest_client.dart';
import 'package:tactical_app/core/network/datasources/auth/riot_user_info_rest_client.dart';
import 'package:tactical_app/core/network/error_handler.dart';
import 'package:tactical_app/core/storage/secure_storage_service.dart';
import 'package:tactical_app/features/auth/datasources/auth_rest_client.dart';
import 'package:tactical_app/features/auth/entities/user_entity.dart';
import 'package:tactical_app/features/auth/models/login_request_model.dart';
import 'package:tactical_app/features/auth/repositories/auth_repository.dart';

/// Concrete implementation of [AuthRepository].
///
/// Uses the Retrofit [AuthRestClient], [RiotEntitlementsRestClient], and
/// [RiotUserInfoRestClient] for type-safe API calls and [SecureStorageService]
/// for persisting credentials.
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRestClient _restClient;
  final SecureStorageService _storageService;
  final RiotEntitlementsRestClient _entitlementsRestClient;
  final RiotUserInfoRestClient _userInfoRestClient;

  AuthRepositoryImpl(
    this._restClient,
    this._storageService,
    this._entitlementsRestClient,
    this._userInfoRestClient,
  );

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _restClient.login(
        LoginRequestModel(email: email, password: password),
      );

      // Persist token to secure storage.
      await _storageService.write(AppConfig.accessTokenKey, response.token);

      return response.toEntity();
    } on DioException catch (e) {
      throw AppException(
        message: ErrorHandler.handleDioError(e),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<void> saveOAuthToken(String accessToken) async {
    await _storageService.write(AppConfig.accessTokenKey, accessToken);
  }

  @override
  Future<String> fetchAndSaveEntitlementsToken(String accessToken) async {
    try {
      final response = await _entitlementsRestClient.getEntitlementsToken(
        'Bearer $accessToken',
        const {},
      );

      // Save entitlements token to secure storage.
      await _storageService.write(
        AppConfig.entitlementsTokenKey,
        response.entitlementsToken,
      );

      return response.entitlementsToken;
    } on DioException catch (e) {
      throw AppException(
        message: ErrorHandler.handleDioError(e),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<RiotUserInfoModel> fetchAndSaveUserInfo(String accessToken) async {
    try {
      final userInfo = await _userInfoRestClient.getUserInfo('Bearer $accessToken');

      // Save user ID (userId) to secure storage.
      await _storageService.write(AppConfig.userIdKey, userInfo.userId);

      return userInfo;
    } on DioException catch (e) {
      throw AppException(
        message: ErrorHandler.handleDioError(e),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<void> logout() async {
    await _storageService.deleteAll();
  }
}
