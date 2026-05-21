import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_routes.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';

class _GridItem {
  final String label;
  final IconData icon;
  final Color accentColor;
  final String route;

  const _GridItem({
    required this.label,
    required this.icon,
    required this.accentColor,
    required this.route,
  });
}

class HomeDashboardView extends StatelessWidget {
  final ParsedStorefrontModel? storefront;

  const HomeDashboardView({super.key, this.storefront});

  void _showComingSoonDialog(BuildContext context, String featureName) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: BeveledRectangleBorder(
          side: BorderSide(
            color: AppColors.white12,
            width: AppDimens.borderWidthMd,
          ),
          borderRadius: BorderRadius.circular(AppDimens.radiusXs),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppDimens.spaceMd),
            Icon(
              Icons.schedule_rounded,
              color: AppColors.primary,
              size: AppDimens.iconLg,
            ),
            SizedBox(height: AppDimens.spaceMd),
            Text(
              l10n.dialogFeatureComingSoon.toUpperCase(),
              style: AppTextStyles.labelMd.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimens.spaceSm),
            Text(
              featureName,
              style: AppTextStyles.bodySm.copyWith(
                color: AppColors.white38,
                fontSize: AppDimens.sp10,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimens.spaceMd),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    bool isLocked = false,
    List<_GridItem>? gridItems,
  }) {
    final l10n = AppLocalizations.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.cardRadiusLg),
        child: Container(
          padding: EdgeInsets.all(AppDimens.p16.left),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.cardSurface,
                AppColors.background.withValues(alpha: 0.5),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppDimens.cardRadiusLg),
            border: Border.all(
              color: AppColors.white12,
              width: AppDimens.borderWidthMd,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    padding: AppDimens.p12,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Icon(
                      icon,
                      color: AppColors.primary,
                      size: AppDimens.avatarIconLg,
                    ),
                  ),
                  SizedBox(width: AppDimens.spaceMd),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                title.toUpperCase(),
                                style: AppTextStyles.titleSm.copyWith(
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.5,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (isLocked) ...[
                              SizedBox(width: AppDimens.spaceSm),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppDimens.badgePaddingH,
                                  vertical: AppDimens.badgePaddingV,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white10,
                                  borderRadius: BorderRadius.circular(
                                    AppDimens.radiusXs,
                                  ),
                                ),
                                child: Text(
                                  l10n.dashboardLocked.toUpperCase(),
                                  style: AppTextStyles.labelSm.copyWith(
                                    color: AppColors.white38,
                                    fontSize: AppDimens.sp8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        SizedBox(height: AppDimens.spaceXs),
                        Text(
                          subtitle,
                          style: AppTextStyles.bodySm.copyWith(
                            color: AppColors.white54,
                            fontSize: AppDimens.sp10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (gridItems == null) ...[
                    Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.white38,
                      size: AppDimens.iconMd,
                    ),
                  ],
                ],
              ),
              if (gridItems != null && gridItems.isNotEmpty) ...[
                SizedBox(height: AppDimens.spaceMd),
                GridView.custom(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: AppDimens.homeSpacingSm,
                    crossAxisSpacing: AppDimens.homeSpacingSm,
                    childAspectRatio: 2.5,
                  ),
                  padding: EdgeInsets.zero,
                  childrenDelegate: SliverChildBuilderDelegate((
                    context,
                    index,
                  ) {
                    final item = gridItems[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(AppDimens.radiusXs),
                      onTap: () => Navigator.of(
                        context,
                      ).pushNamed(item.route, arguments: storefront),
                      child: Container(
                        decoration: BoxDecoration(
                          color: item.accentColor.withValues(alpha: 0.1),
                          border: Border.all(
                            color: item.accentColor.withValues(alpha: 0.3),
                            width: AppDimens.borderWidthMd,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppDimens.radiusXs,
                          ),
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimens.spaceSm,
                          vertical: AppDimens.spaceXs,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              item.icon,
                              color: item.accentColor,
                              size: AppDimens.iconMd,
                            ),
                            SizedBox(height: AppDimens.spaceXs),
                            Text(
                              item.label,
                              style: AppTextStyles.labelSm.copyWith(
                                color: item.accentColor,
                                fontSize: AppDimens.sp9,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  }, childCount: gridItems.length),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListView(
      padding: AppDimens.p16.copyWith(bottom: AppDimens.h160),
      children: [
        // ── MENU CATEGORY ─────────────────────────
        Padding(
          padding: EdgeInsets.only(bottom: AppDimens.homeSpacingSm),
          child: Text(
            l10n.menu.toUpperCase(),
            style: AppTextStyles.labelSm.copyWith(
              color: AppColors.white38,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // ── Menu Card ──────────────────────────
        _buildMenuCard(
          context: context,
          title: l10n.homeBtnStore,
          subtitle: l10n.dashboardStoreSubtitle,
          icon: Icons.storefront_outlined,
          onTap: () {},
          gridItems: [
            _GridItem(
              label: 'Featured Bundle',
              icon: Icons.star,
              accentColor: AppColors.featuredBundleAccent,
              route: AppRoutes.storefrontFeaturedBundle,
            ),
            _GridItem(
              label: 'Daily Offer',
              icon: Icons.schedule,
              accentColor: AppColors.vpAccent,
              route: AppRoutes.storefrontDailyOffers,
            ),
            _GridItem(
              label: 'Night Market',
              icon: Icons.nights_stay,
              accentColor: AppColors.agentsAccent,
              route: AppRoutes.storefrontNightMarket,
            ),
            _GridItem(
              label: 'Accessory',
              icon: Icons.local_mall,
              accentColor: AppColors.radianiteAccent,
              route: AppRoutes.storefrontAccessoryStore,
            ),
          ],
        ),
        SizedBox(height: AppDimens.homeSpacingSm),
        _buildMenuCard(
          context: context,
          title: l10n.dashboardMatchHistory,
          subtitle: l10n.dashboardMatchHistoryDesc,
          icon: Icons.history_rounded,
          onTap: () => _showComingSoonDialog(
            context,
            l10n.dashboardMatchHistory.toUpperCase(),
          ),
          isLocked: true,
        ),
        SizedBox(height: AppDimens.homeSpacingSm),
        _buildMenuCard(
          context: context,
          title: l10n.dashboardCompetitive,
          subtitle: l10n.dashboardCompetitiveDesc,
          icon: Icons.leaderboard_outlined,
          onTap: () => _showComingSoonDialog(
            context,
            l10n.dashboardCompetitive.toUpperCase(),
          ),
          isLocked: true,
        ),
        SizedBox(height: AppDimens.homeSpacingSm),
        _buildMenuCard(
          context: context,
          title: l10n.dashboardTopAgents,
          subtitle: l10n.dashboardTopAgentsDesc,
          icon: Icons.people_outline_rounded,
          onTap: () => _showComingSoonDialog(
            context,
            l10n.dashboardTopAgents.toUpperCase(),
          ),
          isLocked: true,
        ),
      ],
    );
  }
}
