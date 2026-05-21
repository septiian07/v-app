import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_routes.dart';
import 'package:tactical_app/core/network/riot_cookie_service.dart';
import 'package:tactical_app/core/presentation/widgets/app_webview.dart';
import 'package:tactical_app/di/injection.dart';
import 'package:tactical_app/features/auth/blocs/auth_bloc.dart';
import 'package:tactical_app/features/auth/blocs/auth_event.dart';
import 'package:tactical_app/features/auth/blocs/auth_state.dart';
import 'package:tactical_app/l10n/app_localizations.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginWebViewBody extends StatefulWidget {
  const LoginWebViewBody({super.key});

  @override
  State<LoginWebViewBody> createState() => _LoginWebViewBodyState();
}

class _LoginWebViewBodyState extends State<LoginWebViewBody> {
  WebViewController? _webController;
  final RiotCookieService _cookieService = getIt<RiotCookieService>();

  @override
  void initState() {
    super.initState();
    // Restore saved Riot cookies before the WebView loads
    _cookieService.restoreCookies();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthOAuthSuccess) {
          // Save Riot cookies from WebView on auth success
          if (_webController != null) {
            _cookieService.saveCookiesFromController(_webController!);
          }

          Navigator.of(context).pushReplacementNamed(AppRoutes.home);
        }
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.error,
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(bottom: AppDimens.h48),
          child: AppWebView(
            initialUrl: AppConfig.oauthUrl,
            loadingMessage: l10n.loginLoading,
            isExternalLoading: state is AuthLoading,
            onControllerReady: (controller) {
              _webController = controller;
            },
            onNavigationRequest: (url) {
              log('URL: $url');
              if (url.startsWith(AppConfig.oauthRedirectUri)) {
                // ✓ Success: OAuth redirect detected.
                // Save Riot cookies before token extraction.
                if (_webController != null) {
                  _cookieService.saveCookiesFromController(_webController!);
                }
                _tryExtractToken(context, url);
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
            onUrlChange: (url) => _tryExtractToken(context, url),
          ),
        );
      },
    );
  }

  /// Parses the URL fragment for `access_token` and dispatches to BLoC.
  void _tryExtractToken(BuildContext context, String url) {
    if (!url.startsWith(AppConfig.oauthRedirectUri)) return;

    final uri = Uri.parse(url);
    final fragment = uri.fragment;
    if (fragment.isEmpty) return;

    final params = Uri.splitQueryString(fragment);
    final accessToken = params['access_token'];
    log('Access Token: $accessToken');

    if (accessToken != null && accessToken.isNotEmpty) {
      context.read<AuthBloc>().add(
        OAuthTokenReceived(accessToken: accessToken),
      );
    }
  }
}
