import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/presentation/widgets/app_back_app_bar.dart';
import 'package:tactical_app/core/presentation/widgets/app_shimmer.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_bloc.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_state.dart';
import 'package:tactical_app/features/storefront/widgets/base_storefront_state_widget.dart';
import 'package:tactical_app/features/storefront/widgets/hub/storefront_hub_content.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

class StorefrontView extends StatelessWidget {
  const StorefrontView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBackAppBar(title: l10n.storeTitle),
      body: SafeArea(
        child: BlocBuilder<StorefrontBloc, StorefrontState>(
          builder: (context, state) {
            return BaseStorefrontStateWidget(
              state: state,
              successBuilder: (context, _) => const StorefrontHubContent(),
              loadingBuilder: (context) => AppShimmer(
                enabled: true,
                child: const StorefrontHubContent(),
              ),
            );
          },
        ),
      ),
    );
  }
}
