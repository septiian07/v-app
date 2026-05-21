import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_dimens.dart';

class AppEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final TextStyle? titleStyle;
  final Color? iconColor;
  final double? iconSize;
  final double spacing;
  final EdgeInsetsGeometry? padding;

  const AppEmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.titleStyle,
    this.iconColor,
    this.iconSize,
    this.spacing = 8,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? AppDimens.p24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
            SizedBox(height: spacing),
            Text(
              title,
              style: titleStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
