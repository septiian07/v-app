import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/l10n/app_localizations.dart';
import 'package:tactical_app/features/home/bloc/home_state.dart';
import 'package:tactical_app/features/home/widgets/home_telemetry_card.dart';

class HomeTelemetryGrid extends StatelessWidget {
  final HomeLoaded state;

  const HomeTelemetryGrid({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: AppDimens.homeSpacingSm,
      mainAxisSpacing: AppDimens.homeSpacingSm,
      childAspectRatio: AppDimens.homeTelemetryAspect,
      children: [
        HomeTelemetryCard(
          label: l10n.homeSkins,
          value: '${state.skins.length}',
          unit: 'ACTIVE',
        ),
        HomeTelemetryCard(
          label: l10n.homeBuddies,
          value: '${state.buddies.length}',
          unit: 'CACHED',
        ),
        HomeTelemetryCard(
          label: l10n.homeCards,
          value: '${state.cards.length}',
          unit: 'CACHED',
        ),
        HomeTelemetryCard(
          label: l10n.homeTitles,
          value: '${state.titles.length}',
          unit: 'LOADED',
        ),
        HomeTelemetryCard(
          label: l10n.homeSprays,
          value: '${state.sprays.length}',
          unit: 'ACTIVE',
        ),
        HomeTelemetryCard(
          label: l10n.homeTelemetryDatabase,
          value: '100%',
          unit: l10n.homeTelemetryLocal,
          isGold: true,
        ),
      ],
    );
  }
}

