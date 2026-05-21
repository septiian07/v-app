import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';

class StorePreviewFallback extends StatelessWidget {
  const StorePreviewFallback({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black26,
      alignment: Alignment.center,
      child: Icon(
        Icons.broken_image,
        color: AppColors.white24,
        size: AppDimens.iconLg,
      ),
    );
  }
}
