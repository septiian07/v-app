import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_routes.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_bloc.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_event.dart';
import 'package:tactical_app/features/storefront/widgets/hub/storefront_hub_card.dart';
import 'package:tactical_app/features/storefront/widgets/hub/storefront_section_header.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

class StorefrontHubContent extends StatelessWidget {
  const StorefrontHubContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return RefreshIndicator(
      onRefresh: () async {
        // Triggered via outer BlocBuilder with FetchStorefrontData
        final bloc = context.read<StorefrontBloc>();
        bloc.add(FetchStorefrontData());
        await bloc.stream.first;
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(AppDimens.storefrontPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StorefrontSectionHeader(
              title: l10n.storeDepartments.toUpperCase(),
            ),
            SizedBox(height: AppDimens.h16),
            StorefrontHubCard(
              title: l10n.storeFeaturedBundleTitle,
              subtitle: l10n.storeBundleDesc,
              icon: Icons.star,
              glowColor: AppColors.featuredBundleAccent,
              route: AppRoutes.storefrontFeaturedBundle,
              gradientColors: [
                AppColors.featuredBundleAccent.withValues(alpha: 0.15),
                AppColors.kingdomAccentDark.withValues(alpha: 0.05),
              ],
            ),
            SizedBox(height: AppDimens.storefrontSpacingMd),
            StorefrontHubCard(
              title: l10n.storeDailyOffersTitle,
              subtitle: l10n.storeDailyDesc,
              icon: Icons.schedule,
              glowColor: AppColors.primary,
              route: AppRoutes.storefrontDailyOffers,
              gradientColors: [
                AppColors.vpAccent.withValues(alpha: 0.15),
                AppColors.vpAccentDark.withValues(alpha: 0.05),
              ],
            ),
            SizedBox(height: AppDimens.storefrontSpacingMd),
            StorefrontHubCard(
              title: l10n.storeNightMarketTitle,
              subtitle: l10n.storeNightDesc,
              icon: Icons.nights_stay,
              glowColor: AppColors.agentsAccent,
              route: AppRoutes.storefrontNightMarket,
              gradientColors: [
                AppColors.agentsAccent.withValues(alpha: 0.15),
                AppColors.agentsAccentDark.withValues(alpha: 0.05),
              ],
            ),
            SizedBox(height: AppDimens.storefrontSpacingMd),
            StorefrontHubCard(
              title: l10n.storeAccessoryTitle,
              subtitle: l10n.storeAccessoryDesc,
              icon: Icons.local_mall,
              glowColor: AppColors.radianiteAccent,
              route: AppRoutes.storefrontAccessoryStore,
              gradientColors: [
                AppColors.radianiteAccent.withValues(alpha: 0.15),
                AppColors.radianiteAccentDark.withValues(alpha: 0.05),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
