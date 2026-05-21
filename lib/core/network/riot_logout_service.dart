import 'package:injectable/injectable.dart';
import 'package:tactical_app/core/config/app_config.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:tactical_app/core/storage/secure_storage_service.dart';
import 'package:tactical_app/core/network/riot_cookie_service.dart';

/// Service that handles full Riot session logout:
/// clears cookies, WebView data, and all persisted credentials.
@lazySingleton
class RiotLogoutService {
  final SecureStorageService _storageService;
  final RiotCookieService _cookieService;

  RiotLogoutService(this._storageService, this._cookieService);

  /// Full logout: clears cookies, secure storage, and optionally WebView cache.
  /// Pass [controller] if a WebView instance is active.
  Future<void> logout({WebViewController? controller}) async {
    // 1. Clear Riot cookies from WebView + local storage
    await _cookieService.clearAll();

    // 2. Clear WebView cache/localStorage if controller available
    if (controller != null) {
      await _cookieService.clearWebViewData(controller);
    }

    // 3. Wipe token secure storage
    await _storageService.delete(AppConfig.accessTokenKey);
    await _storageService.delete(AppConfig.refreshTokenKey);
    await _storageService.delete(AppConfig.entitlementsTokenKey);
    await _storageService.delete(AppConfig.userIdKey);
  }
}
