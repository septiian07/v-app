import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

class HomeSyncingWidget extends StatelessWidget {
  const HomeSyncingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimens.homeVerticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: AppDimens.homeSyncLoaderSize,
                height: AppDimens.homeSyncLoaderSize,
                child: const CircularProgressIndicator(
                  strokeWidth: AppDimens.homeLoaderStrokeWidth,
                  color: AppColors.info,
                ),
              ),
              SizedBox(width: AppDimens.homeSpacingSm),
              Text(
                l10n.homeSyncingAssets.toUpperCase(),
                style: AppTextStyles.bodySm.copyWith(
                  color: AppColors.info,
                  fontSize: 9.sp,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimens.homeSpacingSm),
          ClipRRect(
            borderRadius: BorderRadius.circular(2.r),
            child: const LinearProgressIndicator(
              color: AppColors.primary,
              backgroundColor: AppColors.white12,
            ),
          ),
          SizedBox(height: AppDimens.homeSpacingMd),
        ],
      ),
    );
  }
}

