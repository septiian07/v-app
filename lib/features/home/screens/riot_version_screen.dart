import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactical_app/core/models/version/riot_client_version_model.dart';
import 'package:tactical_app/core/constants/mock_data.dart';
import 'package:tactical_app/core/presentation/widgets/app_shimmer.dart';
import 'package:tactical_app/di/injection.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/features/home/bloc/riot_version_bloc.dart';
import 'package:tactical_app/features/home/bloc/riot_version_event.dart';
import 'package:tactical_app/features/home/bloc/riot_version_state.dart';

/// Screen displaying Riot/Valorant client version metadata.
class RiotVersionScreen extends StatelessWidget {
  const RiotVersionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocProvider<RiotVersionBloc>(
      create: (_) => getIt<RiotVersionBloc>()..add(const FetchRiotVersion()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(l10n.versionTitle, style: AppTextStyles.titleMd),
          backgroundColor: AppColors.background,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<RiotVersionBloc, RiotVersionState>(
            builder: (context, state) {
              if (state is RiotVersionLoading) {
                return AppShimmer(
                  enabled: true,
                  child: _buildContent(context, MockData.version),
                );
              } else if (state is RiotVersionError) {
                return _buildError(context, state.message);
              } else if (state is RiotVersionLoaded) {
                return _buildContent(context, state.versionData);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    final l10n = AppLocalizations.of(context);

    return Center(
      child: Padding(
        padding: AppDimens.p24,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.versionErrorTitle,
              style: AppTextStyles.titleSm.copyWith(color: AppColors.error),
            ),
            SizedBox(height: AppDimens.h8),
            Text(message, style: AppTextStyles.bodySm),
            SizedBox(height: AppDimens.h16),
            TextButton(
              onPressed: () =>
                  context.read<RiotVersionBloc>().add(const FetchRiotVersion()),
              child: Text(
                l10n.versionBtnRefetch,
                style: AppTextStyles.bodySm.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, RiotClientVersionModel data) {
    final l10n = AppLocalizations.of(context);

    return ListView(
      padding: AppDimens.p16,
      children: [
        _infoRow(l10n.versionManifestId, data.manifestId),
        _infoRow(l10n.versionBranch, data.branch),
        _infoRow(l10n.versionVal, data.version),
        _infoRow(l10n.versionBuild, data.buildVersion),
        _infoRow(l10n.versionEngine, data.engineVersion),
        _infoRow(l10n.versionClientBuild, data.riotClientBuild),
        _infoRow(l10n.versionBuildDate, data.buildDate),
        _infoRow(l10n.versionClientVersion, data.riotClientVersion),
        SizedBox(height: AppDimens.h24),
        TextButton(
          onPressed: () =>
              context.read<RiotVersionBloc>().add(const FetchRiotVersion()),
          child: Text(
            l10n.versionBtnRefetch,
            style: AppTextStyles.bodySm.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.labelSm.copyWith(color: AppColors.tertiary),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: AppTextStyles.bodySm.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

