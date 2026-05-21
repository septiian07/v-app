import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';

class HomeSignOutButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const HomeSignOutButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.cardRadiusMd),
        splashColor: AppColors.error.withValues(alpha: 0.2),
        highlightColor: AppColors.error.withValues(alpha: 0.1),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: AppDimens.cardPaddingMd),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(AppDimens.cardRadiusMd),
            border: Border.all(
              color: AppColors.error.withValues(alpha: 0.5),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.error.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.power_settings_new,
                color: AppColors.error,
                size: AppDimens.homeExitIconSize,
              ),
              SizedBox(width: AppDimens.homeSpacingSm),
              Text(
                label.toUpperCase(),
                style: AppTextStyles.labelSm.copyWith(
                  color: AppColors.error,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

