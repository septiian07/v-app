import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/l10n/app_localizations.dart';
import 'package:tactical_app/features/home/bloc/home_state.dart';

class HomeActiveBundleHero extends StatelessWidget {
  final HomeLoaded state;

  const HomeActiveBundleHero({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bundleName = state.bundle.displayName?.toUpperCase() ?? 'UNKNOWN';

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppDimens.cardPaddingMd),
      decoration: BoxDecoration(
        color: AppColors.cardBgSubtle,
        borderRadius: BorderRadius.circular(AppDimens.homeTelemetryRadius),
        border: Border.all(
          color: AppColors.telemetryGoldBorder,
          width: AppDimens.homeTelemetryBorderWidth,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.security,
                    color: AppColors.gold,
                    size: AppDimens.homeActiveBundleIconSize,
                  ),
                  SizedBox(width: AppDimens.homeSpacingXs),
                  Text(
                    l10n.homeActiveBundle.toUpperCase(),
                    style: AppTextStyles.labelSm.copyWith(
                      color: AppColors.gold,
                      fontSize: AppDimens.sp8,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.w4,
                  vertical: AppDimens.borderWidthMd,
                ),
                decoration: BoxDecoration(
                  color: AppColors.telemetryGoldBorder,
                  borderRadius: BorderRadius.circular(
                    AppDimens.homeActiveBundleBannerRadius,
                  ),
                ),
                child: Text(
                  l10n.homeTelemetryLiveStore.toUpperCase(),
                  style: AppTextStyles.labelSm.copyWith(
                    color: AppColors.gold,
                    fontSize: AppDimens.sp7,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimens.homeSpacingXs),
          Text(
            bundleName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.labelMd.copyWith(
              color: Colors.white,
              fontSize: AppDimens.sp12,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

