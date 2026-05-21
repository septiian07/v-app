import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';

part 'riot_version_rest_client.g.dart';

/// Retrofit REST client/datasource for the Valorant API endpoints.
///
/// Automatically registered in [NetworkModule] and injected via injectable.
@RestApi(baseUrl: AppConfig.valorantApiBaseUrl)
abstract class RiotVersionRestClient {
  factory RiotVersionRestClient(Dio dio, {String baseUrl}) =
      _RiotVersionRestClient;

  /// Fetches the current Riot/Valorant client version metadata.
  @GET('/version')
  Future<RiotClientVersionResponse> getVersion();

  /// Fetches weapon skins with a specific language translation.
  @GET('/weapons/skins')
  Future<RiotWeaponSkinListResponse> getWeaponSkins(
    @Query('language') String language,
  );

  /// Fetches weapon buddies with a specific language translation.
  @GET('/buddies')
  Future<RiotBuddyListResponse> getBuddies(
    @Query('language') String language,
  );

  /// Fetches player cards with a specific language translation.
  @GET('/playercards')
  Future<RiotPlayerCardListResponse> getPlayerCards(
    @Query('language') String language,
  );

  /// Fetches player titles with a specific language translation.
  @GET('/playertitles')
  Future<RiotPlayerTitleListResponse> getPlayerTitles(
    @Query('language') String language,
  );

  /// Fetches player sprays with a specific language translation.
  @GET('/sprays')
  Future<RiotSprayListResponse> getSprays(
    @Query('language') String language,
  );

  /// Fetches a specific bundle by ID with a specific language translation.
  @GET('/bundles/{bundleId}')
  Future<RiotBundleResponse> getBundle(
    @Path('bundleId') String bundleId,
    @Query('language') String language,
  );
}
