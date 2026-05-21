import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/presentation/widgets/app_back_app_bar.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_bloc.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_event.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_state.dart';
import 'package:tactical_app/features/storefront/widgets/accessory_store/accessory_store_content.dart';
import 'package:tactical_app/features/storefront/widgets/base_storefront_state_widget.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

class AccessoryStoreView extends StatelessWidget {
  const AccessoryStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBackAppBar(
        title: l10n.storeAccessoriesTitle.toUpperCase(),
      ),
      body: SafeArea(
        child: BlocBuilder<StorefrontBloc, StorefrontState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<StorefrontBloc>().add(InvalidateStorefrontCache());
                await Future.delayed(const Duration(milliseconds: 300));
              },
              child: BaseStorefrontStateWidget(
                state: state,
                successBuilder: (context, data) =>
                    AccessoryStoreContent(data: data),
              ),
            );
          },
        ),
      ),
    );
  }
}
