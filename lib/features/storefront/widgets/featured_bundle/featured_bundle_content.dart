import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/core/presentation/widgets/app_empty_state.dart';
import 'package:tactical_app/features/storefront/widgets/featured_bundle/featured_bundle_card.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

class FeaturedBundleContent extends StatelessWidget {
  final ParsedStorefrontModel data;

  const FeaturedBundleContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (data.bundles.isEmpty) {
      return CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: AppEmptyState(
              icon: Icons.star_border,
              iconColor: AppColors.white24,
              iconSize: AppDimens.featuredBundleEmptyIconSize,
              spacing: AppDimens.featuredBundleSpacingMd,
              title: l10n.storeNoFeaturedBundle.toUpperCase(),
              titleStyle: AppTextStyles.labelSm.copyWith(
                color: AppColors.white38,
                fontSize: AppDimens.sp11,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ],
      );
    }

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.featuredBundlePadding,
        vertical: AppDimens.featuredBundlePadding,
      ),
      itemCount: data.bundles.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: AppDimens.featuredBundleSpacingLg);
      },
      itemBuilder: (context, index) {
        final bundleItem = data.bundles[index];
        final remainingSeconds = data.remainingSecs.bundles.length > index
            ? data.remainingSecs.bundles[index]
            : 0;

        return FeaturedBundleCard(
          bundleItem: bundleItem,
          remainingSeconds: remainingSeconds,
          l10n: l10n,
        );
      },
    );
  }
}
