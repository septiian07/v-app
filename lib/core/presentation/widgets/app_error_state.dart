import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';

class AppErrorState extends StatelessWidget {
  final String title;
  final String message;
  final String actionLabel;
  final VoidCallback onRetry;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final TextStyle? actionStyle;
  final EdgeInsetsGeometry? padding;

  const AppErrorState({
    super.key,
    required this.title,
    required this.message,
    required this.actionLabel,
    required this.onRetry,
    this.titleStyle,
    this.messageStyle,
    this.actionStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? AppDimens.p24,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: titleStyle ??
                  AppTextStyles.titleSm.copyWith(color: AppColors.error),
            ),
            SizedBox(height: AppDimens.h8),
            Text(message, style: messageStyle ?? AppTextStyles.bodySm),
            SizedBox(height: AppDimens.h16),
            TextButton(
              onPressed: onRetry,
              child: Text(
                actionLabel,
                style: actionStyle ??
                    AppTextStyles.bodySm.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
