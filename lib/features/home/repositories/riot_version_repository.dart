import 'package:tactical_app/core/models/valorant_api_models.dart';

/// Abstract repository managing Riot/Valorant version and assets metadata operations.
abstract class RiotVersionRepository {
  /// Fetches the Riot Client version metadata and persists the version string to secure storage.
  Future<RiotClientVersionModel> getAndSaveVersion();

  /// Reads the cached version string from secure storage if present.
  Future<String?> getSavedVersionString();

  /// Fetches weapon skins from valorant-api.com.
  Future<List<RiotWeaponSkinModel>> getWeaponSkins();

  /// Fetches weapon buddies from valorant-api.com.
  Future<List<RiotBuddyModel>> getBuddies();

  /// Fetches player cards from valorant-api.com.
  Future<List<RiotPlayerCardModel>> getPlayerCards();

  /// Fetches player titles from valorant-api.com.
  Future<List<RiotPlayerTitleModel>> getPlayerTitles();

  /// Fetches sprays from valorant-api.com.
  Future<List<RiotSprayModel>> getSprays();

  /// Fetches a specific bundle from valorant-api.com.
  Future<RiotBundleModel> getBundle(String bundleId);
}
