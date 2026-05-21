import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactical_app/di/injection.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_bloc.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_event.dart';
import 'package:tactical_app/features/storefront/widgets/hub/storefront_view.dart';

/// Hub screen displaying options to route into separate dedicated Storefront pages (Featured Bundle, Daily Offers, Night Market, Accessory Store).
class StorefrontScreen extends StatelessWidget {
  const StorefrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StorefrontBloc>(
      create: (_) => getIt<StorefrontBloc>()..add(FetchStorefrontData()),
      child: const StorefrontView(),
    );
  }
}


