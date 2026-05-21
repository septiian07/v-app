import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:tactical_app/core/storage/secure_storage_service.dart';

/// Manages Riot session cookies: save from WebView, restore into WebView, and clear all.
@lazySingleton
class RiotCookieService {
  final SecureStorageService _storageService;
  final WebViewCookieManager _cookieManager = WebViewCookieManager();

  static const String _cookieStorageKey = 'riot_cookies';

  // Riot auth domains whose cookies we need to persist.
  static const List<String> _riotDomains = [
    'auth.riotgames.com',
    'riotgames.com',
    'playvalorant.com',
  ];

  RiotCookieService(this._storageService);

  /// Extract and persist Riot cookies from the WebView after successful auth.
  Future<void> saveCookiesFromWebView() async {
    // webview_flutter's WebViewCookieManager does not support reading cookies.
    // We inject a JS snippet to read document.cookie from each Riot domain.
    // Since we can't enumerate cookies per-domain from the native side,
    // we save cookies by injecting JS via the controller after auth success.
    // See [saveCookiesFromController] for the JS-based approach.
  }

  /// Save cookies extracted via JavaScript from the WebViewController.
  /// Call this from the login screen after successful auth redirect.
  Future<void> saveCookiesFromController(WebViewController controller) async {
    try {
      final result = await controller.runJavaScriptReturningResult(
        'document.cookie',
      );

      // JS returns a string like "key1=val1; key2=val2"
      final cookieString = result.toString().replaceAll('"', '');
      if (cookieString.isEmpty) return;

      // Read existing saved cookies and merge
      final existing = await _loadSavedCookieMap();
      final newCookies = _parseCookieString(cookieString);
      existing.addAll(newCookies); // update duplicates

      await _storageService.write(
        _cookieStorageKey,
        jsonEncode(existing),
      );
    } catch (_) {
      // Silently fail — cookies are best-effort
    }
  }

  /// Restore saved Riot cookies into the WebView before loading auth pages.
  /// This allows session resumption without re-login.
  Future<void> restoreCookies() async {
    try {
      final saved = await _loadSavedCookieMap();
      if (saved.isEmpty) return;

      for (final domain in _riotDomains) {
        for (final entry in saved.entries) {
          await _cookieManager.setCookie(
            WebViewCookie(
              name: entry.key,
              value: entry.value,
              domain: domain,
              path: '/',
            ),
          );
        }
      }
    } catch (_) {
      // Silently fail
    }
  }

  /// Clear all Riot cookies from WebView and local storage.
  Future<void> clearAll() async {
    try {
      await _cookieManager.clearCookies();
    } catch (_) {}
    await _storageService.delete(_cookieStorageKey);
  }

  /// Clear WebView cache/storage via the controller.
  Future<void> clearWebViewData(WebViewController controller) async {
    try {
      await controller.clearCache();
      await controller.clearLocalStorage();
    } catch (_) {}
  }

  /// Parse "key1=val1; key2=val2" into a map.
  Map<String, String> _parseCookieString(String raw) {
    final map = <String, String>{};
    for (final pair in raw.split(';')) {
      final trimmed = pair.trim();
      final idx = trimmed.indexOf('=');
      if (idx > 0) {
        map[trimmed.substring(0, idx)] = trimmed.substring(idx + 1);
      }
    }
    return map;
  }

  /// Load previously saved cookies from secure storage.
  Future<Map<String, String>> _loadSavedCookieMap() async {
    final json = await _storageService.read(_cookieStorageKey);
    if (json == null || json.isEmpty) return {};
    try {
      return Map<String, String>.from(jsonDecode(json));
    } catch (_) {
      return {};
    }
  }
}
