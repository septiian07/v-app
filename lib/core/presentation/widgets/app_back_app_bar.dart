import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';

class AppBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleStyle;
  final bool centerTitle;
  final Color backgroundColor;

  const AppBackAppBar({
    super.key,
    required this.title,
    this.titleStyle,
    this.centerTitle = true,
    this.backgroundColor = AppColors.background,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: titleStyle ?? AppTextStyles.titleMd),
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.secondary),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
