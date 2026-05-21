import 'package:tactical_app/core/models/valorant_api_models.dart';

/// Abstract contract managing Riot PvP network operations.
abstract class RiotPvpRepository {
  /// Fetches player active storefront grid.
  Future<ParsedStorefrontModel> getStorefront(String userId);

  /// Fetches player wallet credit balances.
  Future<RiotWalletModel> getWallet(String userId);

  /// Fetches player account experience profile.
  Future<RiotAccountXpModel> getAccountXp(String userId);

  /// Fetches active store item offers.
  Future<RiotOffersModel> getOffers();

  /// Fetches player in-game names and taglines.
  Future<List<RiotPlayerNameModel>> getPlayerNames(List<String> playerIds);
}
