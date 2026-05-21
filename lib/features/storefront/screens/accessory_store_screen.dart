import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/di/injection.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_bloc.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_event.dart';
import 'package:tactical_app/features/storefront/widgets/accessory_store/accessory_store_view.dart';

/// Screen displaying rotating shop accessory items (buddies, player cards, sprays, titles).
class AccessoryStoreScreen extends StatelessWidget {
  const AccessoryStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storefrontArg =
        ModalRoute.of(context)?.settings.arguments as ParsedStorefrontModel?;

    return BlocProvider<StorefrontBloc>(
      create: (_) {
        final bloc = getIt<StorefrontBloc>();
        // If data was passed, initialize with it; otherwise fetch fresh data
        if (storefrontArg != null) {
          bloc.add(InitializeStorefront(storefrontArg));
        } else {
          bloc.add(FetchStorefrontData());
        }
        return bloc;
      },
      child: const AccessoryStoreView(),
    );
  }
}
