import 'package:chuck_interceptor/chuck_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:tactical_app/features/auth/datasources/auth_rest_client.dart';
import 'package:tactical_app/core/network/datasources/auth/riot_entitlements_rest_client.dart';
import 'package:tactical_app/core/network/datasources/auth/riot_user_info_rest_client.dart';
import 'package:tactical_app/core/network/datasources/version/riot_version_rest_client.dart';
import 'package:tactical_app/core/network/dio_client.dart';

/// Injectable module that provides Retrofit client instances.
///
/// This module bridges the gap between the [DioClient] (which configures
/// the raw [Dio] instance) and the generated Retrofit interfaces.
@module
abstract class NetworkModule {
  /// Provides the configured [Dio] instance from [DioClient].
  @lazySingleton
  Dio dio(DioClient dioClient) => dioClient.dio;

  /// Provides the [AuthRestClient] Retrofit interface.
  @lazySingleton
  AuthRestClient authRestClient(Dio dio) => AuthRestClient(dio);

  /// Provides the [RiotVersionRestClient] Retrofit interface.
  @lazySingleton
  RiotVersionRestClient riotVersionRestClient(Dio dio) =>
      RiotVersionRestClient(dio);

  /// Provides the [RiotEntitlementsRestClient] Retrofit interface.
  @lazySingleton
  RiotEntitlementsRestClient riotEntitlementsRestClient(Dio dio) =>
      RiotEntitlementsRestClient(dio);

  /// Provides the [RiotUserInfoRestClient] Retrofit interface.
  @lazySingleton
  RiotUserInfoRestClient riotUserInfoRestClient(Dio dio) =>
      RiotUserInfoRestClient(dio);

  /// Provides the [Chuck] HTTP traffic inspector singleton.
  @singleton
  Chuck chuck() => Chuck(showNotification: true, showInspectorOnShake: true);
}
