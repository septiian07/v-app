import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/core/presentation/widgets/app_webview.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(l10n.settingsPrivacyPolicy, style: AppTextStyles.titleMd),
        backgroundColor: AppColors.background,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: AppWebView(
          initialUrl: AppConfig.privacyPolicyUrl,
          loadingMessage: l10n.splashLoading,
        ),
      ),
    );
  }
}
