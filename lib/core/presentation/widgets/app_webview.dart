import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// A reusable WebView widget following the app design system.
///
/// Features:
/// - Configurable URL loading.
/// - JavaScript enabled by default.
/// - Built-in loading overlay with app styling.
/// - Optional navigation interception via [onNavigationRequest].
/// - Optional URL change listener via [onUrlChange].
/// - Optional page lifecycle callbacks.
class AppWebView extends StatefulWidget {
  /// The initial URL to load.
  final String initialUrl;

  /// Optional loading message shown during page loads.
  final String loadingMessage;

  /// Called on every navigation request. Return [NavigationDecision.prevent]
  /// to block navigation, or [NavigationDecision.navigate] to allow it.
  final NavigationDecision Function(String url)? onNavigationRequest;

  /// Called whenever the WebView URL changes (including fragment changes).
  final void Function(String url)? onUrlChange;

  /// Called when a page starts loading.
  final void Function(String url)? onPageStarted;

  /// Called when a page finishes loading.
  final void Function(String url)? onPageFinished;

  /// Whether to show the built-in loading overlay. Defaults to `true`.
  final bool showLoadingOverlay;

  /// Optional external loading flag (e.g., from BLoC state).
  final bool isExternalLoading;

  /// Called once the [WebViewController] is initialized.
  final void Function(WebViewController controller)? onControllerReady;

  const AppWebView({
    super.key,
    required this.initialUrl,
    this.loadingMessage = 'LOADING...',
    this.onNavigationRequest,
    this.onUrlChange,
    this.onPageStarted,
    this.onPageFinished,
    this.showLoadingOverlay = true,
    this.isExternalLoading = false,
    this.onControllerReady,
  });

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColors.background)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            if (mounted) setState(() => _isLoading = true);
            widget.onPageStarted?.call(url);
          },
          onPageFinished: (url) {
            if (mounted) setState(() => _isLoading = false);
            widget.onPageFinished?.call(url);
          },
          onNavigationRequest: (NavigationRequest request) {
            if (widget.onNavigationRequest != null) {
              return widget.onNavigationRequest!(request.url);
            }
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            if (change.url != null) {
              widget.onUrlChange?.call(change.url!);
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.initialUrl));

    widget.onControllerReady?.call(_controller);
  }

  @override
  Widget build(BuildContext context) {
    final showOverlay =
        widget.showLoadingOverlay && (_isLoading || widget.isExternalLoading);

    return Stack(
      children: [
        // ── WebView Content ──────────────────────────────────────────
        WebViewWidget(controller: _controller),

        // ── Loading Overlay ──────────────────────────────────────────
        if (showOverlay)
          Container(
            color: AppColors.background.withValues(alpha: 0.7),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: AppDimens.w48,
                    height: AppDimens.h48,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: AppDimens.h16),
                  Text(
                    widget.loadingMessage,
                    style: AppTextStyles.labelMd.copyWith(
                      color: AppColors.tertiary,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
