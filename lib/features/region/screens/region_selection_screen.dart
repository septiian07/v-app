import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactical_app/di/injection.dart';
import 'package:tactical_app/core/config/app_routes.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/core/presentation/widgets/app_buttons.dart';
import 'package:tactical_app/features/region/bloc/region_bloc.dart';
import 'package:tactical_app/features/region/bloc/region_event.dart';
import 'package:tactical_app/features/region/bloc/region_state.dart';

/// Region model containing visual and logical information.
class RegionOption {
  final String code;
  final String name;
  final IconData icon;

  const RegionOption({
    required this.code,
    required this.name,
    required this.icon,
  });
}

/// Screen allowing users to select their active region before authenticating.
class RegionSelectionScreen extends StatelessWidget {
  const RegionSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final regions = [
      RegionOption(code: 'na', name: l10n.regionNaName, icon: Icons.public),
      RegionOption(code: 'eu', name: l10n.regionEuName, icon: Icons.language),
      RegionOption(code: 'ap', name: l10n.regionApName, icon: Icons.explore),
      RegionOption(
        code: 'kr',
        name: l10n.regionKrName,
        icon: Icons.g_translate,
      ),
    ];

    return BlocProvider<RegionBloc>(
      create: (_) => getIt<RegionBloc>(),
      child: BlocListener<RegionBloc, RegionState>(
        listener: (context, state) {
          if (state.isSaved) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.login);
          } else if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: Text(
              l10n.regionHeaderSubtitle,
              style: AppTextStyles.titleMd,
            ),
            backgroundColor: AppColors.background,
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            child: Padding(
              padding: AppDimens.p16,
              child: Column(
                children: [
                  Expanded(
                    child: BlocBuilder<RegionBloc, RegionState>(
                      builder: (context, state) {
                        return ListView.separated(
                          itemCount: regions.length,
                          separatorBuilder: (_, __) =>
                              SizedBox(height: AppDimens.h8),
                          itemBuilder: (context, index) {
                            final region = regions[index];
                            final isSelected =
                                state.selectedRegionCode == region.code;

                            return ListTile(
                              leading: Icon(
                                region.icon,
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.tertiary,
                              ),
                              title: Text(
                                region.name,
                                style: AppTextStyles.bodySm.copyWith(
                                  color: isSelected
                                      ? Colors.white
                                      : AppColors.tertiary,
                                ),
                              ),
                              trailing: isSelected
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: AppColors.primary,
                                    )
                                  : null,
                              onTap: () {
                                context.read<RegionBloc>().add(
                                  SelectRegion(region.code),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: AppDimens.h16),
                  BlocBuilder<RegionBloc, RegionState>(
                    builder: (context, state) {
                      final isSaving = state.isSaving;
                      final isButtonEnabled =
                          state.selectedRegionCode != null && !isSaving;

                      return AppPrimaryButton(
                        label: isSaving
                            ? l10n.regionBtnSync
                            : l10n.regionBtnConfirm,
                        onPressed: isButtonEnabled
                            ? () => context.read<RegionBloc>().add(
                                const ConfirmRegionSelection(),
                              )
                            : null,
                      );
                    },
                  ),
                  SizedBox(height: AppDimens.h12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

