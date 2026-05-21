import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/models/auth/riot_user_info_model.dart';

part 'riot_user_info_rest_client.g.dart';

/// Retrofit REST client/datasource for the Riot User Info endpoint.
///
/// Automatically registered in [NetworkModule] and injected via injectable.
@RestApi(baseUrl: AppConfig.riotAuthBaseUrl)
abstract class RiotUserInfoRestClient {
  factory RiotUserInfoRestClient(Dio dio, {String baseUrl}) =
      _RiotUserInfoRestClient;

  /// Fetches the authenticated player's user info profile.
  @GET('/userinfo')
  Future<RiotUserInfoModel> getUserInfo(
    @Header('Authorization') String authorization,
  );
}
