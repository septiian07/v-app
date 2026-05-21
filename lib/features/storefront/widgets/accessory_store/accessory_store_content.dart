import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/core/presentation/widgets/app_empty_state.dart';
import 'package:tactical_app/core/presentation/widgets/timer_badge.dart';
import 'package:tactical_app/features/storefront/widgets/accessory_store/accessory_store_card.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

class AccessoryStoreContent extends StatelessWidget {
  final ParsedStorefrontModel data;

  const AccessoryStoreContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (data.accessory.isEmpty) {
      return CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: AppEmptyState(
              icon: Icons.local_mall,
              iconColor: AppColors.white24,
              iconSize: AppDimens.accessoryStoreEmptyIconSize,
              spacing: AppDimens.accessoryStoreSpacingMd,
              title: l10n.storeNoAccessories.toUpperCase(),
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
            horizontal: AppDimens.accessoryStorePadding,
            vertical: AppDimens.accessoryStoreTimerPaddingV,
          ),
          child: TimerBadge(
            initialSeconds: data.remainingSecs.accessory,
            label: l10n.storeTimerAccessoryReset,
          ),
        ),
        Expanded(
          child: GridView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              left: AppDimens.accessoryStorePadding,
              right: AppDimens.accessoryStorePadding,
              bottom: AppDimens.accessoryStorePaddingBottom,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppDimens.accessoryStoreGridSpacing,
              mainAxisSpacing: AppDimens.accessoryStoreGridSpacing,
              childAspectRatio: AppDimens.accessoryStoreGridAspectRatio,
            ),
            itemCount: data.accessory.length,
            itemBuilder: (context, index) {
              return AccessoryStoreCard(offer: data.accessory[index]);
            },
          ),
        ),
      ],
    );
  }
}
