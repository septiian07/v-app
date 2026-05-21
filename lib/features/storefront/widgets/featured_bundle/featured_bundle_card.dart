import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/core/constants/assets_constant.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/core/presentation/widgets/timer_badge.dart';
import 'package:tactical_app/core/utils/url_utils.dart';
import 'package:tactical_app/features/storefront/widgets/featured_bundle/featured_bundle_item_tile.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

class FeaturedBundleCard extends StatelessWidget {
  final ParsedStorefrontBundleModel bundleItem;
  final int remainingSeconds;
  final AppLocalizations l10n;

  const FeaturedBundleCard({
    super.key,
    required this.bundleItem,
    required this.remainingSeconds,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final bundle = bundleItem.bundle;
    final displayIcon = bundle.displayIcon2 ?? bundle.displayIcon;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (remainingSeconds > 0) ...[
          Center(
            child: TimerBadge(
              initialSeconds: remainingSeconds,
              label: l10n.storeTimerBundleConcludes,
            ),
          ),
          SizedBox(height: AppDimens.featuredBundleSpacingMd),
        ],
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.cardSurface,
            borderRadius: BorderRadius.circular(
              AppDimens.featuredBundleCardRadius,
            ),
            border: Border.all(
              color: AppColors.featuredBundleAccent.withValues(alpha: 0.3),
              width: AppDimens.featuredBundleCardBorderWidth,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.featuredBundleAccent.withValues(
                  alpha: 0.05,
                ),
                blurRadius: AppDimens.featuredBundleCardBlurRadius,
                offset: Offset(0, AppDimens.featuredBundleCardOffsetY),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isValidUrl(displayIcon))
                Image.network(
                  displayIcon!,
                  width: double.infinity,
                  height: AppDimens.featuredBundleImageHeight,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: AppColors.black26,
                    height: AppDimens.featuredBundleImageHeight,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.broken_image,
                      color: AppColors.white24,
                      size: AppDimens.iconLg,
                    ),
                  ),
                ),
              Padding(
                padding: AppDimens.p16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            bundle.displayName ??
                                l10n.storeFeaturedBundleTitle,
                            style: AppTextStyles.titleSm.copyWith(
                              color: AppColors.secondary,
                              fontSize: AppDimens.sp14,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDimens.featuredBundleBadgePaddingH,
                            vertical: AppDimens.featuredBundleBadgePaddingV,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.featuredBundleAccent
                                .withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(
                              AppDimens.featuredBundleBadgeRadius,
                            ),
                            border: Border.all(
                              color: AppColors.featuredBundleAccent,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                AppAssets.icValorantPoints,
                                width: AppDimens.w12,
                                height: AppDimens.w12,
                              ),
                              SizedBox(width: AppDimens.w4),
                              Text(
                                '${bundleItem.price}',
                                style: AppTextStyles.labelSm.copyWith(
                                  color: AppColors.featuredBundleAccent,
                                  fontSize: AppDimens.sp11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (bundleItem.items.isNotEmpty) ...[
                      SizedBox(height: AppDimens.featuredBundleSpacingLg),
                      Text(
                        l10n.storeIncludedWeaponLevels.toUpperCase(),
                        style: AppTextStyles.labelSm.copyWith(
                          color: AppColors.white38,
                          fontSize: AppDimens.sp8,
                        ),
                      ),
                      SizedBox(height: AppDimens.featuredBundleSpacingXs),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: AppDimens.featuredBundleGridSpacing,
                          mainAxisSpacing: AppDimens.featuredBundleGridSpacing,
                          childAspectRatio:
                              AppDimens.featuredBundleGridAspectRatio,
                        ),
                        itemCount: bundleItem.items.length,
                        itemBuilder: (context, index) {
                          return FeaturedBundleItemTile(
                            item: bundleItem.items[index],
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
