import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

class HomeSyncFailedWidget extends StatelessWidget {
  final String message;

  const HomeSyncFailedWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: EdgeInsets.all(AppDimens.cardPaddingMd),
      margin: EdgeInsets.only(bottom: AppDimens.homeSpacingMd),
      decoration: BoxDecoration(
        color: AppColors.telemetryErrorBg,
        border: Border.all(
          color: AppColors.telemetryErrorBorder,
          width: AppDimens.borderWidthMd,
        ),
        borderRadius: BorderRadius.circular(AppDimens.homeTelemetryRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.error_outline,
                color: AppColors.error,
                size: AppDimens.homeSyncErrorIconSize,
              ),
              SizedBox(width: AppDimens.homeSpacingXs),
              Text(
                l10n.homeTelemetrySyncError.toUpperCase(),
                style: AppTextStyles.labelSm.copyWith(
                  color: AppColors.error,
                  fontSize: 8.5.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimens.homeSpacingXs),
          Text(
            '${l10n.homeAssetSyncFailed.toUpperCase()} ${message.toUpperCase()}',
            style: AppTextStyles.bodySm.copyWith(
              color: AppColors.error,
              fontSize: 9.sp,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

