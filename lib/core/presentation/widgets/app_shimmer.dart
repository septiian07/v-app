import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tactical_app/core/config/app_colors.dart';

/// A base shimmer widget that configures [Skeletonizer] with the app's esports dark-theme design system.
class AppShimmer extends StatelessWidget {
  /// Whether the shimmer effect is enabled.
  final bool enabled;

  /// The widget tree to apply the shimmer effect to.
  final Widget child;

  const AppShimmer({
    super.key,
    required this.enabled,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      effect: const ShimmerEffect(
        baseColor: AppColors.surface,
        highlightColor: AppColors.white12,
        duration: Duration(seconds: 2),
      ),
      child: child,
    );
  }
}
