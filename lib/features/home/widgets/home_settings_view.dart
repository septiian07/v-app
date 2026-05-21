import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tactical_app/core/presentation/widgets/dashed_line.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/config/app_routes.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/core/network/riot_logout_service.dart';
import 'package:tactical_app/di/injection.dart';
import 'package:tactical_app/features/home/bloc/home_bloc.dart';
import 'package:tactical_app/features/home/bloc/home_state.dart';
import 'package:tactical_app/features/home/repositories/riot_version_repository.dart';
import 'package:tactical_app/features/home/screens/user_profile_screen.dart';

class HomeSettingsView extends StatelessWidget {
  final HomeLoaded state;

  const HomeSettingsView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: AppDimens.p16.copyWith(bottom: AppDimens.h160),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  constraints.maxHeight - AppDimens.p16.top - AppDimens.h160,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Title
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppDimens.h16),
                    child: Text(
                      l10n.settingsTitle,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.titleMd.copyWith(
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimens.spaceMd),

                  // Settings list
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(
                        AppDimens.cardRadiusLg,
                      ),
                      border: Border.all(
                        color: Colors.white12,
                        width: AppDimens.borderWidthMd,
                      ),
                    ),
                    child: Column(
                      children: [
                        _buildSettingTile(
                          icon: Icons.person_outline,
                          title: l10n.settingsProfile,
                          onTap: () {
                            final homeBloc = context.read<HomeBloc>();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: homeBloc,
                                  child: UserProfileScreen(state: state),
                                ),
                              ),
                            );
                          },
                        ),
                        _buildDivider(),
                        _buildSettingTile(
                          icon: Icons.language,
                          title: l10n.settingsLanguage,
                          onTap: () {
                            Navigator.of(
                              context,
                            ).pushNamed(AppRoutes.languageSelection);
                          },
                        ),
                        _buildDivider(),
                        _buildSettingTile(
                          icon: Icons.favorite_border,
                          title: l10n.settingsDonate,
                          onTap: () async {
                            final url = Uri.parse(AppConfig.donationUrl);
                            try {
                              if (await canLaunchUrl(url)) {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                            } catch (e) {
                              debugPrint('Error launching URL: $e');
                            }
                          },
                          isExternal: true,
                        ),
                      ],
                    ),
                  ),

                  // Spacer to push version card & logout to absolute bottom of view
                  const Spacer(),
                  SizedBox(height: AppDimens.spaceXl),

                  // Version Info Card
                  _buildVersionCard(l10n),
                  SizedBox(height: AppDimens.spaceMd),

                  // Logout
                  OutlinedButton(
                    onPressed: () async {
                      await getIt<RiotLogoutService>().logout();
                      if (context.mounted) {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(AppRoutes.login);
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      padding: EdgeInsets.symmetric(vertical: AppDimens.h16),
                      side: BorderSide(
                        color: AppColors.error,
                        width: AppDimens.borderWidthMd,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                      ),
                      minimumSize: const Size(double.infinity, 0),
                    ),
                    child: Text(
                      l10n.settingsLogout,
                      style: AppTextStyles.labelMd.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.error,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isExternal = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: AppDimens.p20,
          child: Row(
            children: [
              Icon(icon, color: AppColors.white54, size: AppDimens.sp24),
              SizedBox(width: AppDimens.spaceMd),
              Expanded(child: Text(title, style: AppTextStyles.labelMd)),
              if (isExternal)
                Icon(
                  Icons.open_in_new,
                  color: AppColors.white38,
                  size: AppDimens.sp16,
                )
              else
                Icon(
                  Icons.chevron_right,
                  color: AppColors.white38,
                  size: AppDimens.sp20,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVersionCard(AppLocalizations l10n) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        final version = snapshot.data?.version ?? '...';

        return Container(
          width: double.infinity,
          padding: AppDimens.p16,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimens.cardRadiusLg),
            border: Border.all(
              color: Colors.white12,
              width: AppDimens.borderWidthMd,
            ),
          ),
          child: Column(
            children: [
              // Tactical version
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.settingsAppVersion,
                    style: AppTextStyles.bodySm.copyWith(
                      color: AppColors.white54,
                    ),
                  ),
                  Text('v$version', style: AppTextStyles.bodySm),
                ],
              ),
              SizedBox(height: AppDimens.h12),
              const DashedLine(
                color: Colors.white12,
                dashWidth: 4.0,
                dashSpace: 4.0,
              ),
              SizedBox(height: AppDimens.h12),
              // Riot Client version
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.settingsRiotClientVersion,
                    style: AppTextStyles.bodySm.copyWith(
                      color: AppColors.white54,
                    ),
                  ),
                  FutureBuilder<String?>(
                    future: getIt<RiotVersionRepository>()
                        .getSavedVersionString(),
                    builder: (context, snapshot) {
                      final riotVersion = snapshot.data ?? '...';
                      return Text(riotVersion, style: AppTextStyles.bodySm);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.w20),
      child: Divider(color: Colors.white10, height: AppDimens.borderWidthMd),
    );
  }
}
