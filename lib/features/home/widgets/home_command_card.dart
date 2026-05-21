import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';

class HomeCommandCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const HomeCommandCard({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.homeCommandSplashRadius),
        splashColor: AppColors.commandSplash,
        highlightColor: AppColors.commandHighlight,
        child: Container(
          padding: EdgeInsets.all(AppDimens.cardPaddingMd),
          decoration: BoxDecoration(
            color: AppColors.cardBgSubtle,
            borderRadius: BorderRadius.circular(AppDimens.cardRadiusMd),
            border: Border.all(
              color: AppColors.white12,
              width: AppDimens.homeCommandBorderWidth,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: AppColors.primary, size: AppDimens.homeCommandIconSize),
                  const Icon(
                    Icons.chevron_right,
                    color: AppColors.white38,
                    size: AppDimens.homeChevronIconSize,
                  ),
                ],
              ),
              Text(
                label.toUpperCase(),
                style: AppTextStyles.labelSm.copyWith(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

