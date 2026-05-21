import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';

class HomeTelemetryCard extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final bool isGold;

  const HomeTelemetryCard({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
    this.isGold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.cardPaddingMd,
        vertical: AppDimens.cardPaddingSm,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppDimens.homeTelemetryRadius),
        border: Border.all(
          color: isGold ? AppColors.telemetryGoldBorder : AppColors.telemetryBorder,
          width: AppDimens.homeTelemetryBorderWidth,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label.toUpperCase(),
                style: AppTextStyles.labelSm.copyWith(
                  color: AppColors.white38,
                  fontSize: 7.5.sp,
                  letterSpacing: 0.5,
                ),
              ),
              Container(
                width: AppDimens.homeStatusDotSize,
                height: AppDimens.homeStatusDotSize,
                decoration: BoxDecoration(
                  color: isGold ? AppColors.gold : AppColors.syncGreenAccent,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimens.homeSpacingXs),
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                value,
                style: AppTextStyles.displayLg.copyWith(
                  color: isGold ? AppColors.gold : AppColors.syncGreenAccent,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(width: AppDimens.w4),
              Text(
                unit.toUpperCase(),
                style: AppTextStyles.labelSm.copyWith(
                  color: AppColors.white24,
                  fontSize: 7.sp,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

