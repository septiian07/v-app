import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';

class StorefrontSectionHeader extends StatelessWidget {
  final String title;

  const StorefrontSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.labelSm.copyWith(
        color: AppColors.tertiary,
        letterSpacing: 1.5,
      ),
    );
  }
}
