import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactical_app/core/constants/mock_data.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/core/presentation/widgets/app_error_state.dart';
import 'package:tactical_app/core/presentation/widgets/app_shimmer.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_bloc.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_event.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_state.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

class BaseStorefrontStateWidget extends StatelessWidget {
  final StorefrontState state;
  final Widget Function(BuildContext context, ParsedStorefrontModel storefront) successBuilder;
  final Widget Function(BuildContext context)? loadingBuilder;

  const BaseStorefrontStateWidget({
    super.key,
    required this.state,
    required this.successBuilder,
    this.loadingBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (state is StorefrontInitial || state is StorefrontLoading) {
      if (loadingBuilder != null) {
        return loadingBuilder!(context);
      }
      return AppShimmer(
        enabled: true,
        child: successBuilder(context, MockData.storefront),
      );
    }

    if (state is StorefrontFailure) {
      return AppErrorState(
        title: l10n.storeErrorTitle,
        message: (state as StorefrontFailure).errorMessage,
        actionLabel: l10n.storeRetry,
        onRetry: () =>
            context.read<StorefrontBloc>().add(FetchStorefrontData()),
      );
    }

    if (state is StorefrontSuccess) {
      return successBuilder(context, (state as StorefrontSuccess).storefront);
    }

    return const SizedBox.shrink();
  }
}
