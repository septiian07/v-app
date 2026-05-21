/// HTTP Header configurations and general HTTP/network constants.
class AppHeaders {
  AppHeaders._();

  /// HTTP Header Keys
  static const String headerContentType = 'Content-Type';
  static const String headerAccept = 'Accept';
  static const String headerAuthorization = 'Authorization';
  static const String headerLanguage = 'language';
  static const String headerRiotClientVersion = 'X-Riot-ClientVersion';
  static const String headerRiotClientPlatform = 'X-Riot-ClientPlatform';
  static const String headerRiotEntitlementsJwt = 'X-Riot-Entitlements-JWT';

  /// HTTP Header Values
  static const String contentTypeJson = 'application/json';
  static const String acceptJson = 'application/json';
  static const String defaultLanguage = 'id-ID';
  static const String clientPlatformBase64 =
      'ew0KCSJwbGF0Zm9ybVR5cGUiOiAiUEMiLA0KCSJwbGF0Zm9ybU9TIjogIldpbmRvd3MiLA0KCSJwbGF0Zm9ybU9TVmVyc2lvbiI6ICIxMC4wLjE5MDQyLjEuMjU2LjY0Yml0IiwNCgkicGxhdGZvcm1DaGlwc2V0IjogIlVua25vd24iDQp9';

  /// Domain & Auth Constants
  static const String pvpNetDomain = '.pvp.net';
  static const String authBearerPrefix = 'Bearer ';
}
