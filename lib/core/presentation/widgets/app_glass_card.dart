import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';

/// A glassmorphism container following the design spec.
///
/// Visual properties:
/// - 20 % white fill
/// - [BackdropFilter] with 30 px Gaussian blur
/// - 1 px solid border at 10 % white
/// - 0 px border radius (sharp edges)
class AppGlassCard extends StatelessWidget {
  /// Child widget rendered inside the glass card.
  final Widget child;

  /// Optional padding inside the card.
  final EdgeInsetsGeometry? padding;

  /// Optional explicit width.
  final double? width;

  /// Optional explicit height.
  final double? height;

  const AppGlassCard({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppDimens.sharpRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Container(
          width: width,
          height: height,
          padding: padding ?? EdgeInsets.all(AppDimens.gutter),
          decoration: BoxDecoration(
            color: AppColors.glassFill,
            borderRadius: AppDimens.sharpRadius,
            border: Border.all(
              color: AppColors.glassBorder,
              width: AppDimens.glassBorderWidth,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
