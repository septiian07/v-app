import 'package:tactical_app/core/models/auth/riot_user_info_model.dart';
import 'package:tactical_app/features/auth/entities/user_entity.dart';

/// Abstract contract for authentication operations.
/// Implemented in the data layer by [AuthRepositoryImpl].
abstract class AuthRepository {
  /// Authenticate with [email] and [password] via Retrofit API.
  /// Returns a [UserEntity] on success.
  Future<UserEntity> login({
    required String email,
    required String password,
  });

  /// Save an OAuth access token received from the WebView auth flow.
  Future<void> saveOAuthToken(String accessToken);

  /// Fetch the Riot entitlements token and save it to secure storage.
  Future<String> fetchAndSaveEntitlementsToken(String accessToken);

  /// Fetch the Riot user info profile and save the user ID (sub) to secure storage.
  Future<RiotUserInfoModel> fetchAndSaveUserInfo(String accessToken);

  /// Clear stored credentials and sign the user out.
  Future<void> logout();
}
