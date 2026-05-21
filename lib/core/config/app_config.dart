/// Global application configuration.
class AppConfig {
  AppConfig._();

  /// Base URL for API requests.
  /// Override per environment (dev, staging, prod).
  static const String baseUrl = 'https://api.example.com/v1';

  /// Connection timeout in milliseconds.
  static const int connectTimeout = 30000;

  /// Receive timeout in milliseconds.
  static const int receiveTimeout = 30000;

  /// Send timeout in milliseconds.
  static const int sendTimeout = 30000;

  /// Application name.
  static const String appName = 'Akz VLR-App';

  /// Secure storage keys.
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String localeKey = 'locale_key';
  static const String clientVersionKey = 'client_version';
  static const String regionKey = 'region_key';
  static const String entitlementsTokenKey = 'entitlements_token';
  static const String userIdKey = 'user_id';

  /// Riot Games OAuth configuration.
  static const String oauthUrl =
      'https://auth.riotgames.com/authorize?redirect_uri=https%3A%2F%2Fplayvalorant.com%2Fopt_in&client_id=play-valorant-web-prod&response_type=token%20id_token&nonce=1&scope=account%20openid';
  static const String oauthRedirectUri = 'https://playvalorant.com/opt_in';

  /// Donation and Social Urls
  static const String donationUrl = 'https://linktr.ee/septianyoga';

  /// REST Client Base URLs
  static const String valorantApiBaseUrl = 'https://valorant-api.com/v1';
  static const String riotAuthBaseUrl = 'https://auth.riotgames.com';
  static const String riotEntitlementsBaseUrl =
      'https://entitlements.auth.riotgames.com/api';

  /// PvP net base URL template dynamically formatted
  static String pvpBaseUrl(String region) => 'https://pd.$region.a.pvp.net';
}
