import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/core/presentation/widgets/app_empty_state.dart';
import 'package:tactical_app/core/presentation/widgets/timer_badge.dart';
import 'package:tactical_app/features/storefront/widgets/night_market/night_market_card.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

class NightMarketContent extends StatelessWidget {
  final ParsedStorefrontModel data;

  const NightMarketContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (data.nightMarket.isEmpty) {
      return CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: AppEmptyState(
              icon: Icons.nights_stay,
              iconColor: AppColors.white24,
              iconSize: AppDimens.nightMarketEmptyIconSize,
              spacing: AppDimens.nightMarketSpacingLg,
              title: l10n.storeNoNightMarket.toUpperCase(),
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

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.nightMarketPadding,
            vertical: AppDimens.nightMarketTimerPaddingV,
          ),
          child: TimerBadge(
            initialSeconds: data.remainingSecs.nightMarket,
            label: l10n.storeTimerNightMarketCloses,
          ),
        ),
        Expanded(
          child: GridView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              left: AppDimens.nightMarketPadding,
              right: AppDimens.nightMarketPadding,
              bottom: AppDimens.nightMarketPaddingBottom,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppDimens.nightMarketGridSpacing,
              mainAxisSpacing: AppDimens.nightMarketGridSpacing,
              childAspectRatio: AppDimens.nightMarketGridAspectRatio,
            ),
            itemCount: data.nightMarket.length,
            itemBuilder: (context, index) {
              return NightMarketCard(offer: data.nightMarket[index]);
            },
          ),
        ),
      ],
    );
  }
}
