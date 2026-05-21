// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chuck_interceptor/chuck_interceptor.dart' as _i1020;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:tactical_app/core/localization/bloc/language_bloc.dart'
    as _i360;
import 'package:tactical_app/core/network/datasources/auth/riot_entitlements_rest_client.dart'
    as _i430;
import 'package:tactical_app/core/network/datasources/auth/riot_user_info_rest_client.dart'
    as _i49;
import 'package:tactical_app/core/network/datasources/version/riot_version_rest_client.dart'
    as _i89;
import 'package:tactical_app/core/network/dio_client.dart' as _i482;
import 'package:tactical_app/core/network/network_module.dart' as _i426;
import 'package:tactical_app/core/network/riot_cookie_service.dart' as _i926;
import 'package:tactical_app/core/network/riot_logout_service.dart' as _i656;
import 'package:tactical_app/core/storage/secure_storage_service.dart' as _i302;
import 'package:tactical_app/features/auth/blocs/auth_bloc.dart' as _i233;
import 'package:tactical_app/features/auth/datasources/auth_rest_client.dart'
    as _i785;
import 'package:tactical_app/features/auth/repositories/auth_repository.dart'
    as _i179;
import 'package:tactical_app/features/auth/repositories/auth_repository_impl.dart'
    as _i721;
import 'package:tactical_app/features/home/bloc/home_bloc.dart' as _i684;
import 'package:tactical_app/features/home/bloc/riot_version_bloc.dart'
    as _i986;
import 'package:tactical_app/features/home/repositories/riot_pvp_repository.dart'
    as _i441;
import 'package:tactical_app/features/home/repositories/riot_pvp_repository_impl.dart'
    as _i299;
import 'package:tactical_app/features/home/repositories/riot_version_repository.dart'
    as _i606;
import 'package:tactical_app/features/home/repositories/riot_version_repository_impl.dart'
    as _i794;
import 'package:tactical_app/features/region/bloc/region_bloc.dart' as _i74;
import 'package:tactical_app/features/splash/bloc/splash_bloc.dart' as _i396;
import 'package:tactical_app/features/storefront/bloc/storefront_bloc.dart'
    as _i1022;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.singleton<_i1020.Chuck>(() => networkModule.chuck());
    gh.lazySingleton<_i302.SecureStorageService>(
      () => _i302.SecureStorageService(),
    );
    gh.lazySingleton<_i926.RiotCookieService>(
      () => _i926.RiotCookieService(gh<_i302.SecureStorageService>()),
    );
    gh.factory<_i360.LanguageBloc>(
      () => _i360.LanguageBloc(gh<_i302.SecureStorageService>()),
    );
    gh.factory<_i74.RegionBloc>(
      () => _i74.RegionBloc(gh<_i302.SecureStorageService>()),
    );
    gh.lazySingleton<_i656.RiotLogoutService>(
      () => _i656.RiotLogoutService(
        gh<_i302.SecureStorageService>(),
        gh<_i926.RiotCookieService>(),
      ),
    );
    gh.lazySingleton<_i482.DioClient>(
      () =>
          _i482.DioClient(gh<_i302.SecureStorageService>(), gh<_i1020.Chuck>()),
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio(gh<_i482.DioClient>()));
    gh.lazySingleton<_i785.AuthRestClient>(
      () => networkModule.authRestClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i89.RiotVersionRestClient>(
      () => networkModule.riotVersionRestClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i430.RiotEntitlementsRestClient>(
      () => networkModule.riotEntitlementsRestClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i49.RiotUserInfoRestClient>(
      () => networkModule.riotUserInfoRestClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i179.AuthRepository>(
      () => _i721.AuthRepositoryImpl(
        gh<_i785.AuthRestClient>(),
        gh<_i302.SecureStorageService>(),
        gh<_i430.RiotEntitlementsRestClient>(),
        gh<_i49.RiotUserInfoRestClient>(),
      ),
    );
    gh.factory<_i233.AuthBloc>(
      () => _i233.AuthBloc(gh<_i179.AuthRepository>()),
    );
    gh.lazySingleton<_i606.RiotVersionRepository>(
      () => _i794.RiotVersionRepositoryImpl(
        gh<_i89.RiotVersionRestClient>(),
        gh<_i302.SecureStorageService>(),
      ),
    );
    gh.factory<_i396.SplashBloc>(
      () => _i396.SplashBloc(
        gh<_i302.SecureStorageService>(),
        gh<_i606.RiotVersionRepository>(),
      ),
    );
    gh.factory<_i986.RiotVersionBloc>(
      () => _i986.RiotVersionBloc(gh<_i606.RiotVersionRepository>()),
    );
    gh.lazySingleton<_i441.RiotPvpRepository>(
      () => _i299.RiotPvpRepositoryImpl(
        gh<_i361.Dio>(),
        gh<_i302.SecureStorageService>(),
        gh<_i606.RiotVersionRepository>(),
      ),
    );
    gh.factory<_i684.HomeBloc>(
      () => _i684.HomeBloc(
        gh<_i606.RiotVersionRepository>(),
        gh<_i441.RiotPvpRepository>(),
        gh<_i179.AuthRepository>(),
        gh<_i302.SecureStorageService>(),
      ),
    );
    gh.factory<_i1022.StorefrontBloc>(
      () => _i1022.StorefrontBloc(
        gh<_i441.RiotPvpRepository>(),
        gh<_i302.SecureStorageService>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i426.NetworkModule {}
