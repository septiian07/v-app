import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/models/auth/riot_entitlements_model.dart';

part 'riot_entitlements_rest_client.g.dart';

/// Retrofit REST client/datasource for the Riot Games entitlements token endpoint.
///
/// Automatically registered in [NetworkModule] and injected via injectable.
@RestApi(baseUrl: AppConfig.riotEntitlementsBaseUrl)
abstract class RiotEntitlementsRestClient {
  factory RiotEntitlementsRestClient(Dio dio, {String baseUrl}) =
      _RiotEntitlementsRestClient;

  /// Fetches the entitlements token for authorized operations.
  @POST('/token/v1')
  Future<RiotEntitlementsModel> getEntitlementsToken(
    @Header('Authorization') String authorization,
    @Body() Map<String, dynamic> body,
  );
}
