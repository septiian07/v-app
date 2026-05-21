import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tactical_app/core/models/player/riot_account_xp_model.dart';
import 'package:tactical_app/core/models/player/riot_player_name_model.dart';
import 'package:tactical_app/core/models/store/riot_offers_model.dart';
import 'package:tactical_app/core/models/store/riot_storefront_model.dart';
import 'package:tactical_app/core/models/store/riot_wallet_model.dart';

part 'riot_pvp_rest_client.g.dart';

/// Retrofit REST client/datasource for the Riot PvP endpoints.
///
/// Instantiated dynamically in the repository with the player's active region base URL.
@RestApi()
abstract class RiotPvpRestClient {
  factory RiotPvpRestClient(Dio dio, {String baseUrl}) = _RiotPvpRestClient;

  /// Fetches the user storefront.
  @POST('/store/v3/storefront/{userId}')
  Future<RiotStorefrontModel> getStorefront(
    @Path('userId') String userId,
    @Body() Map<String, String> body,
  );

  /// Fetches the user wallet balances.
  @GET('/store/v1/wallet/{userId}')
  Future<RiotWalletModel> getWallet(@Path('userId') String userId);

  /// Fetches player account experience.
  @GET('/account-xp/v1/players/{userId}')
  Future<RiotAccountXpModel> getAccountXp(@Path('userId') String userId);

  /// Fetches active store offers.
  @GET('/store/v1/offers/')
  Future<RiotOffersModel> getOffers();

  /// Fetches player names from user IDs.
  @PUT('/name-service/v2/players')
  Future<List<RiotPlayerNameModel>> getPlayerNames(
    @Body() List<String> playerIds,
  );
}
