import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/di/injection.dart';
import 'package:tactical_app/core/config/app_routes.dart';

import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/features/splash/bloc/splash_bloc.dart';
import 'package:tactical_app/features/splash/bloc/splash_event.dart';
import 'package:tactical_app/features/splash/bloc/splash_state.dart';

/// Minimalist splash screen for bootstrapping app preferences,
/// pre-fetching API version headers, and routing active sessions.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (_) => getIt<SplashBloc>()..add(const InitializeApp()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToHome) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          } else if (state is SplashNavigateToLogin) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.login);
          } else if (state is SplashNavigateToRegionSelection) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.region);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ── App Logo ────────────────────────────────────────────────
                Icon(
                  Icons.analytics_outlined,
                  color: AppColors.primary,
                  size: AppDimens.splashLogoSize,
                ),
                SizedBox(height: AppDimens.h24),

                // ── App Name ────────────────────────────────────────────────
                Text(
                  AppConfig.appName,
                  style: AppTextStyles.titleLg.copyWith(
                    letterSpacing: AppDimens.splashLetterSpacing,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: AppDimens.h48),

                // ── Loading Indicator ───────────────────────────────────────
                SizedBox(
                  width: AppDimens.splashIndicatorSize,
                  height: AppDimens.splashIndicatorSize,
                  child: const CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: AppDimens.splashIndicatorStrokeWidth,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
