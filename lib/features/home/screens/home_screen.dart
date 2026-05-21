import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/di/injection.dart';
import 'package:tactical_app/l10n/app_localizations.dart';
import 'package:tactical_app/features/home/bloc/home_bloc.dart';
import 'package:tactical_app/features/home/bloc/home_event.dart';
import 'package:tactical_app/features/home/bloc/home_state.dart';
import 'package:tactical_app/features/home/widgets/home_dashboard_view.dart';
import 'package:tactical_app/features/home/widgets/home_settings_view.dart';
import 'package:tactical_app/features/home/widgets/home_sync_failed_widget.dart';
import 'package:tactical_app/core/constants/mock_data.dart';
import 'package:tactical_app/core/presentation/widgets/app_shimmer.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';

/// Home screen shown after successful OAuth login.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider<HomeBloc>(
      create: (_) => getIt<HomeBloc>()
        ..add(const FetchHomeAssets())
        ..add(const FetchStorefrontForDashboard()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        extendBody: true,
        body: SafeArea(
          bottom:
              false, // Bottom safe area is handled by the navigation bar padding
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return AppShimmer(
                  enabled: true,
                  child: IndexedStack(
                    index: _currentIndex,
                    children: [
                      const HomeDashboardView(),
                      HomeSettingsView(
                        state: HomeLoaded(
                          skins: const [],
                          buddies: const [],
                          cards: const [],
                          titles: const [],
                          sprays: const [],
                          bundle: const RiotBundleModel(
                            uuid: '',
                            displayName: '',
                            displayIcon: '',
                          ),
                          userInfo: MockData.userInfo,
                          wallet: MockData.wallet,
                          accountXp: MockData.accountXp,
                          isProfileLoading: false,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is HomeError) {
                return HomeSyncFailedWidget(message: state.message);
              } else if (state is HomeLoaded) {
                final dashboard = state.isStorefrontLoading
                    ? AppShimmer(
                        enabled: true,
                        child: HomeDashboardView(storefront: state.storefront),
                      )
                    : HomeDashboardView(storefront: state.storefront);
                return IndexedStack(
                  index: _currentIndex,
                  children: [
                    dashboard,
                    HomeSettingsView(state: state),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        bottomNavigationBar: Builder(
          builder: (navContext) => _buildBottomNavigationBar(navContext, l10n),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(
    BuildContext context,
    AppLocalizations l10n,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.p16.left,
        right: AppDimens.p16.right,
        bottom: AppDimens.p16.bottom + MediaQuery.paddingOf(context).bottom,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimens.radiusLg),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: AppDimens.h64,
            decoration: BoxDecoration(
              color: AppColors.glassFill,
              borderRadius: BorderRadius.circular(AppDimens.radiusLg),
              border: Border.all(
                color: AppColors.glassBorder,
                width: AppDimens.borderWidthMd,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(
                  context,
                  icon: Icons.dashboard_outlined,
                  activeIcon: Icons.dashboard,
                  label: l10n.homeTabDashboard,
                  index: 0,
                ),
                _buildNavItem(
                  context,
                  icon: Icons.settings_outlined,
                  activeIcon: Icons.settings,
                  label: l10n.homeTabSettings,
                  index: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final isSelected = _currentIndex == index;
    final color = isSelected ? AppColors.primary : AppColors.textDisabled;

    return GestureDetector(
      onTap: () {
        if (index == 1) {
          final bloc = context.read<HomeBloc>();
          final state = bloc.state;
          if (state is HomeLoaded &&
              state.userInfo == null &&
              !state.isProfileLoading) {
            bloc.add(const FetchProfileAssets());
          }
        }
        setState(() => _currentIndex = index);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: AppDimens.w80,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Icon(
                isSelected ? activeIcon : icon,
                key: ValueKey<bool>(isSelected),
                color: color,
                size: AppDimens.iconMd,
              ),
            ),
            SizedBox(height: AppDimens.h4),
            Text(
              label.toUpperCase(),
              style: AppTextStyles.labelSm.copyWith(
                color: color,
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.bold,
                fontSize: AppDimens.sp10,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
