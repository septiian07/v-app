import 'package:flutter/material.dart';
import 'package:tactical_app/l10n/app_localizations.dart';
import 'package:tactical_app/core/constants/assets_constant.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/core/models/auth/riot_user_info_model.dart';
import 'package:tactical_app/core/models/player/riot_account_xp_model.dart';
import 'package:tactical_app/core/models/store/riot_wallet_model.dart';

/// Displays the player's profile overview on the home screen:
/// name, tagline, level badge, and currency balances (VP, Radianite, KC, Free Agents).
class HomeProfileCard extends StatelessWidget {
  final RiotUserInfoModel userInfo;
  final RiotWalletModel wallet;
  final RiotAccountXpModel accountXp;

  const HomeProfileCard({
    super.key,
    required this.userInfo,
    required this.wallet,
    required this.accountXp,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final balances = wallet.balances;
    final level = accountXp.progress?.level ?? 1;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.homeProfileCardRadius),
        gradient: const LinearGradient(
          colors: [AppColors.cardSurface, AppColors.cardSurfaceDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.3),
          width: AppDimens.homeProfileCardBorderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.05),
            blurRadius: AppDimens.homeProfileCardBlurRadius,
            offset: Offset(0, AppDimens.homeProfileCardOffsetY),
          ),
        ],
      ),
      padding: EdgeInsets.all(AppDimens.homeProfilePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header label ─────────────────────────────────────────────
          Text(
            l10n.homeProfileHeader.toUpperCase(),
            style: AppTextStyles.labelSm.copyWith(
              color: AppColors.tertiary,
              letterSpacing: 1.5,
              fontSize: AppDimens.sp9,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: AppDimens.homeProfileSpacingMd),

          // ── Avatar + Name + Level ────────────────────────────────────
          Row(
            children: [
              // Avatar circle
              Container(
                width: AppDimens.homeProfileAvatarSize,
                height: AppDimens.homeProfileAvatarSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.1),
                  border: Border.all(
                    color: AppColors.primary,
                    width: AppDimens.homeProfileAvatarBorderWidth,
                  ),
                ),
                child: Icon(
                  Icons.security,
                  color: AppColors.primary,
                  size: AppDimens.homeProfileAvatarIconSize,
                ),
              ),

              SizedBox(width: AppDimens.homeProfileSpacingMd),

              // Name + Tagline
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userInfo.gameName.toUpperCase(),
                      style: AppTextStyles.titleSm.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: AppDimens.sp16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppDimens.homeProfileSpacingXs),
                    Text(
                      '#${userInfo.tagLine.toUpperCase()}',
                      style: AppTextStyles.bodySm.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: AppDimens.sp11,
                      ),
                    ),
                  ],
                ),
              ),

              // Level badge
              Container(
                width: AppDimens.homeProfileLevelBadgeSize,
                height: AppDimens.homeProfileLevelBadgeSize,
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(
                    AppDimens.homeProfileLevelBadgeRadius,
                  ),
                  border: Border.all(
                    color: Colors.blueAccent.withValues(alpha: 0.4),
                    width: AppDimens.borderWidthMd,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.homeProfileLevel,
                      style: AppTextStyles.labelSm.copyWith(
                        color: AppColors.white38,
                        fontSize: AppDimens.sp7,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$level',
                      style: AppTextStyles.labelLg.copyWith(
                        color: AppColors.secondary,
                        fontSize: AppDimens.sp13,
                        fontWeight: FontWeight.w900,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: AppDimens.homeProfileSpacingLg),

          // ── Divider ──────────────────────────────────────────────────
          Divider(color: AppColors.white10, height: AppDimens.borderWidthMd),

          SizedBox(height: AppDimens.homeProfileSpacingLg),

          // ── Currency row ─────────────────────────────────────────────
          Row(
            children: [
              _buildCurrencyChip(
                label: l10n.homeProfileVp,
                value: '${balances.vp ?? 0}',
                assetPath: AppAssets.icValorantPoints,
                color: AppColors.primary,
              ),
              SizedBox(width: AppDimens.homeProfileSpacingSm),
              _buildCurrencyChip(
                label: l10n.homeProfileRadianite,
                value: '${balances.radianite ?? 0}',
                assetPath: AppAssets.icRadianitePoints,
                color: AppColors.radianiteAccent,
              ),
              SizedBox(width: AppDimens.homeProfileSpacingSm),
              _buildCurrencyChip(
                label: l10n.homeProfileKingdom,
                value: '${balances.kingdomCredits ?? 0}',
                assetPath: AppAssets.icKingdomCredits,
                color: AppColors.kingdomAccent,
              ),
              SizedBox(width: AppDimens.homeProfileSpacingSm),
              _buildCurrencyChip(
                label: l10n.homeProfileFreeAgents,
                value: '${balances.freeAgents ?? 0}',
                icon: Icons.assignment_ind,
                color: AppColors.agentsAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds a compact currency chip showing icon, label abbreviation, and value.
  Widget _buildCurrencyChip({
    required String label,
    required String value,
    IconData? icon,
    String? assetPath,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppDimens.homeProfileCurrencyCardPadding,
          horizontal: AppDimens.w4,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(
            AppDimens.homeProfileCurrencyCardRadius,
          ),
          border: Border.all(
            color: color.withValues(alpha: 0.2),
            width: AppDimens.borderWidthSm,
          ),
        ),
        child: Column(
          children: [
            if (assetPath != null)
              Image.asset(
                assetPath,
                width: AppDimens.homeProfileCurrencyIconSize,
                height: AppDimens.homeProfileCurrencyIconSize,
                fit: BoxFit.contain,
              )
            else if (icon != null)
              Icon(
                icon,
                color: color,
                size: AppDimens.homeProfileCurrencyIconSize,
              ),
            SizedBox(height: AppDimens.h2),
            Text(
              value,
              style: AppTextStyles.labelSm.copyWith(
                color: AppColors.secondary,
                fontSize: AppDimens.sp10,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: AppDimens.borderWidthMd),
            Text(
              label,
              style: AppTextStyles.labelSm.copyWith(
                color: AppColors.white38,
                fontSize: AppDimens.sp7,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

