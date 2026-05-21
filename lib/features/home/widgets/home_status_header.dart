import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

class HomeStatusHeader extends StatelessWidget {
  const HomeStatusHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: AppDimens.homeIndicatorSize,
              height: AppDimens.homeIndicatorSize,
              decoration: const BoxDecoration(
                color: AppColors.syncGreen,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.syncGreen,
                    blurRadius: AppDimens.homeIndicatorBlurRadius,
                    spreadRadius: AppDimens.homeIndicatorSpreadRadius,
                  ),
                ],
              ),
            ),
            SizedBox(width: AppDimens.homeSpacingSm),
            Text(
              l10n.homeGlobalStreamOnline.toUpperCase(),
              style: AppTextStyles.bodySm.copyWith(
                color: AppColors.syncGreen,
                fontSize: 8.5.sp,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        Text(
          l10n.homeTelemetrySecureSyncOk.toUpperCase(),
          style: AppTextStyles.bodySm.copyWith(
            color: AppColors.white38,
            fontSize: 8.5.sp,
          ),
        ),
      ],
    );
  }
}

