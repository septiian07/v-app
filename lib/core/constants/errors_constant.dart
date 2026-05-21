/// Standard error strings and JSON keys for response parsing.
class AppErrors {
  AppErrors._();

  /// Error & JSON Response Keys
  static const String errCredentialsExpired = 'CREDENTIALS_EXPIRED';
  static const String errBadClaims = 'BAD_CLAIMS';
  static const String keyErrorCode = 'errorCode';
  static const String keyErrorCodeSnake = 'error_code';
  static const String keyError = 'error';
  static const String keyCode = 'code';
}
