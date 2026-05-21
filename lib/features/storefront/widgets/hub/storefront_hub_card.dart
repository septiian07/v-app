import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';

class StorefrontHubCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color glowColor;
  final String route;
  final List<Color> gradientColors;

  const StorefrontHubCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.glowColor,
    required this.route,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(route),
      borderRadius: BorderRadius.circular(AppDimens.storefrontCardRadius),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.storefrontCardRadius),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: glowColor.withValues(alpha: 0.25),
            width: AppDimens.storefrontCardBorderWidth,
          ),
          boxShadow: [
            BoxShadow(
              color: glowColor.withValues(alpha: 0.03),
              blurRadius: AppDimens.storefrontCardBlurRadius,
              offset: Offset(0, AppDimens.storefrontCardOffsetY),
            ),
          ],
        ),
        padding: EdgeInsets.all(AppDimens.storefrontPadding),
        child: Row(
          children: [
            Container(
              width: AppDimens.storefrontAvatarSize,
              height: AppDimens.storefrontAvatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: glowColor.withValues(alpha: 0.1),
                border: Border.all(
                  color: glowColor.withValues(alpha: 0.3),
                  width: AppDimens.storefrontAvatarBorderWidth,
                ),
              ),
              child: Icon(
                icon,
                color: glowColor,
                size: AppDimens.storefrontAvatarIconSize,
              ),
            ),
            SizedBox(width: AppDimens.storefrontSpacingLg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: AppTextStyles.labelLg.copyWith(
                      color: AppColors.secondary,
                      fontSize: 13.sp,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: AppDimens.storefrontSpacingXs),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodySm.copyWith(
                      color: AppColors.white38,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.white30,
              size: AppDimens.storefrontChevronIconSize,
            ),
          ],
        ),
      ),
    );
  }
}
