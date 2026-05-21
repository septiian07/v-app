import 'dart:developer';

import 'package:chuck_interceptor/chuck_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:tactical_app/core/constants/errors_constant.dart';
import 'package:tactical_app/core/config/app_routes.dart';
import 'package:tactical_app/core/network/riot_logout_service.dart';

/// Dio [Interceptor] that detects expired-credential responses (HTTP 401
/// with `errorCode == "CREDENTIALS_EXPIRED"`) and forces a full logout.
///
/// When triggered it will:
/// 1. Call [RiotLogoutService.logout] to clear cookies, tokens & storage.
/// 2. Navigate to the login screen, clearing the entire navigation stack.
///
/// Navigation is done via the [Chuck.navigatorKey] which is already attached
/// to the [MaterialApp] — no BuildContext dependency needed.
class AuthInterceptor extends Interceptor {
  final Chuck _chuck;

  /// Guards against multiple concurrent 401 responses triggering
  /// multiple logout + redirect cycles.
  bool _isLoggingOut = false;

  AuthInterceptor(this._chuck);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    if ((statusCode == 401 || statusCode == 400) && !_isLoggingOut) {
      final data = err.response?.data;
      final errorCode = _extractErrorCode(data);

      final isCredentialsExpired =
          statusCode == 401 && errorCode == AppErrors.errCredentialsExpired;
      final isBadClaims =
          statusCode == 400 && errorCode == AppErrors.errBadClaims;

      if (isCredentialsExpired || isBadClaims) {
        _isLoggingOut = true;
        log('[AuthInterceptor] $errorCode detected — redirect to login');

        try {
          // 1. Redirect to login screen, clearing entire navigation stack.
          //    User will see the webview OAuth page and must authenticate again.
          final navigator = _chuck.navigatorKey?.currentState;
          if (navigator != null) {
            navigator.pushNamedAndRemoveUntil(AppRoutes.login, (_) => false);
          }
        } catch (e) {
          log('[AuthInterceptor] Error during forced logout: $e');
        } finally {
          _isLoggingOut = false;
        }

        // Reject so callers know the request failed
        return handler.reject(err);
      }
    }

    // For all other errors, pass through normally
    handler.next(err);
  }

  /// Safely extracts `errorCode` from various response body shapes.
  String? _extractErrorCode(dynamic data) {
    if (data is Map<String, dynamic>) {
      // Try common patterns: { "errorCode": "..." } or { "error": { "code": "..." } }
      if (data.containsKey(AppErrors.keyErrorCode)) {
        return data[AppErrors.keyErrorCode]?.toString();
      }
      if (data.containsKey(AppErrors.keyErrorCodeSnake)) {
        return data[AppErrors.keyErrorCodeSnake]?.toString();
      }
      if (data[AppErrors.keyError] is Map<String, dynamic>) {
        return data[AppErrors.keyError][AppErrors.keyCode]?.toString();
      }
    }
    return null;
  }
}
