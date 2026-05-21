import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactical_app/l10n/app_localizations.dart';
import 'package:tactical_app/core/constants/assets_constant.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/features/home/bloc/home_bloc.dart';
import 'package:tactical_app/features/home/bloc/home_event.dart';
import 'package:tactical_app/features/home/bloc/home_state.dart';
import 'package:tactical_app/core/constants/mock_data.dart';
import 'package:tactical_app/core/presentation/widgets/app_shimmer.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';

class UserProfileScreen extends StatelessWidget {
  final HomeLoaded state;

  const UserProfileScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          l10n.profileTitleLabel,
          style: AppTextStyles.titleMd.copyWith(
            letterSpacing: 2.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.secondary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, homeState) {
            final bool isLoading = homeState is HomeLoading || (homeState is HomeLoaded && homeState.isProfileLoading);
            
            HomeLoaded currentState = homeState is HomeLoaded ? homeState : state;
            if (isLoading && currentState.userInfo == null) {
              currentState = HomeLoaded(
                skins: const [],
                buddies: const [],
                cards: const [],
                titles: const [],
                sprays: const [],
                bundle: const RiotBundleModel(uuid: '', displayName: '', displayIcon: ''),
                userInfo: MockData.userInfo,
                wallet: MockData.wallet,
                accountXp: MockData.accountXp,
                isProfileLoading: true,
              );
            }

            return AppShimmer(
              enabled: isLoading,
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<HomeBloc>().add(const FetchProfileAssets());
                  await context.read<HomeBloc>().stream.firstWhere(
                    (state) => state is HomeLoaded && !state.isProfileLoading,
                  );
                },
                color: AppColors.primary,
                backgroundColor: AppColors.surface,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: AppDimens.p16,
                  children: [
                    _buildTopProfileCard(currentState),
                    SizedBox(height: AppDimens.spaceMd),
                    _buildInformationCard(currentState, l10n),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTopProfileCard(HomeLoaded currentState) {
    final userInfo = currentState.userInfo;
    if (userInfo == null) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.h24,
        horizontal: AppDimens.w16,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.cardRadiusLg),
        border: Border.all(
          color: AppColors.white12,
          width: AppDimens.borderWidthMd,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: AppDimens.w72,
            height: AppDimens.w72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.background,
              border: Border.all(
                color: AppColors.primary,
                width: AppDimens.ghostBorderWidth,
              ),
            ),
            child: Icon(
              Icons.person,
              color: AppColors.primary,
              size: AppDimens.sp40,
            ),
          ),
          SizedBox(height: AppDimens.spaceMd),
          Text(
            userInfo.gameName,
            style: AppTextStyles.titleMd.copyWith(
              color: AppColors.secondary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(height: AppDimens.h4),
          Text(
            '#${userInfo.tagLine}',
            style: AppTextStyles.bodySm.copyWith(
              color: AppColors.white54,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInformationCard(HomeLoaded currentState, AppLocalizations l10n) {
    final wallet = currentState.wallet;
    final accountXp = currentState.accountXp;
    if (wallet == null || accountXp == null) return const SizedBox.shrink();

    final balances = wallet.balances;
    final level = accountXp.progress?.level ?? 1;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.cardRadiusLg),
        border: Border.all(
          color: AppColors.white12,
          width: AppDimens.borderWidthMd,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.w16,
              vertical: AppDimens.h8,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimens.cardRadiusLg),
                bottomRight: Radius.circular(AppDimens.cardRadiusLg),
              ),
            ),
            child: Text(
              l10n.profilePlayerInfo,
              style: AppTextStyles.labelMd.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.w20,
              vertical: AppDimens.h16,
            ),
            child: Column(
              children: [
                _buildInfoRow(
                  l10n.profileAccountLevel,
                  '$level',
                  icon: Icons.military_tech,
                ),
                _buildInfoRow(
                  l10n.profileRegion,
                  _getLocalizedRegionName(currentState.region, l10n),
                  icon: Icons.public,
                ),
                _buildInfoRow(
                  l10n.profileVp,
                  '${balances.vp ?? 0}',
                  assetPath: AppAssets.icValorantPoints,
                ),
                _buildInfoRow(
                  l10n.profileRadianite,
                  '${balances.radianite ?? 0}',
                  assetPath: AppAssets.icRadianitePoints,
                ),
                _buildInfoRow(
                  l10n.profileKingdom,
                  '${balances.kingdomCredits ?? 0}',
                  assetPath: AppAssets.icKingdomCredits,
                ),
                _buildInfoRow(
                  l10n.profileFreeAgents,
                  '${balances.freeAgents ?? 0}',
                  icon: Icons.assignment_ind,
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    String label,
    String value, {
    String? assetPath,
    IconData? icon,
    bool isLast = false,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (assetPath != null) ...[
                  Image.asset(
                    assetPath,
                    width: AppDimens.w14,
                    height: AppDimens.w14,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: AppDimens.w8),
                ] else if (icon != null) ...[
                  Icon(icon, color: AppColors.white54, size: AppDimens.w14),
                  SizedBox(width: AppDimens.w8),
                ],
                Text(
                  label,
                  style: AppTextStyles.bodySm.copyWith(color: AppColors.white54),
                ),
              ],
            ),
            Text(
              value,
              style: AppTextStyles.bodySm.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        if (!isLast) ...[
          SizedBox(height: AppDimens.h12),
          CustomPaint(
            size: const Size(double.infinity, 1),
            painter: _DashedLinePainter(),
          ),
          SizedBox(height: AppDimens.h12),
        ],
      ],
    );
  }

  String _getLocalizedRegionName(String? regionCode, AppLocalizations l10n) {
    if (regionCode == null) return '-';
    switch (regionCode.toLowerCase()) {
      case 'na':
        return l10n.regionNaName;
      case 'eu':
        return l10n.regionEuName;
      case 'ap':
        return l10n.regionApName;
      case 'kr':
        return l10n.regionKrName;
      default:
        return regionCode.toUpperCase();
    }
  }
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5, dashSpace = 5, startX = 0;
    final paint = Paint()
      ..color = AppColors.white12
      ..strokeWidth = AppDimens.borderWidthMd;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
