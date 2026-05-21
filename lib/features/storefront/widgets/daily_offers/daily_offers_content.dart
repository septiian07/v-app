import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/core/presentation/widgets/app_empty_state.dart';
import 'package:tactical_app/core/presentation/widgets/timer_badge.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_bloc.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_event.dart';
import 'package:tactical_app/features/storefront/widgets/daily_offers/daily_offer_card.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

class DailyOffersContent extends StatelessWidget {
  final ParsedStorefrontModel data;

  const DailyOffersContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (data.main.isEmpty) {
      return CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: AppEmptyState(
              icon: Icons.schedule,
              iconColor: AppColors.white24,
              iconSize: AppDimens.dailyOffersEmptyIconSize,
              spacing: AppDimens.dailyOffersSpacingMd,
              title: l10n.storeNoDailyOffers.toUpperCase(),
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
            horizontal: AppDimens.dailyOffersPadding,
            vertical: AppDimens.dailyOffersTimerPaddingV,
          ),
          child: TimerBadge(
            initialSeconds: data.remainingSecs.main,
            label: l10n.storeTimerOfferExpires,
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              final bloc = context.read<StorefrontBloc>();
              bloc.add(FetchStorefrontData());
              await bloc.stream.first;
            },
            child: GridView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                left: AppDimens.dailyOffersPadding,
                right: AppDimens.dailyOffersPadding,
                bottom: AppDimens.dailyOffersPaddingBottom,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppDimens.dailyOffersGridSpacing,
                mainAxisSpacing: AppDimens.dailyOffersGridSpacing,
                childAspectRatio: AppDimens.dailyOffersGridAspectRatio,
              ),
              itemCount: data.main.length,
              itemBuilder: (context, index) {
                return DailyOfferCard(offer: data.main[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
