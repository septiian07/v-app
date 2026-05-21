import 'package:flutter/material.dart';

import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';

enum PreviewMode { level, variant }

class StoreItemPreviewDialog extends StatefulWidget {
  final int levelCount;
  final int variantCount;
  final PreviewMode initialMode;
  final int initialIndex;
  final Widget Function(BuildContext, PreviewMode, int) previewBuilder;
  final ValueChanged<PreviewMode>? onModeChanged;
  final ValueChanged<int>? onIndexChanged;

  const StoreItemPreviewDialog({
    super.key,
    required this.levelCount,
    required this.variantCount,
    required this.previewBuilder,
    this.initialMode = PreviewMode.level,
    this.initialIndex = 0,
    this.onModeChanged,
    this.onIndexChanged,
  });

  @override
  State<StoreItemPreviewDialog> createState() => _StoreItemPreviewDialogState();
}

class _StoreItemPreviewDialogState extends State<StoreItemPreviewDialog> {
  late PreviewMode _mode = widget.initialMode;
  late int _selectedIndex = widget.initialIndex;

  int get _currentCount =>
      _mode == PreviewMode.level ? widget.levelCount : widget.variantCount;

  int get _visibleCount => _currentCount.clamp(0, 4);

  void _setMode(PreviewMode mode) {
    if (_mode == mode) return;
    setState(() {
      _mode = mode;
      if (_visibleCount > 0 && _selectedIndex >= _visibleCount) {
        _selectedIndex = 0;
      }
    });
    widget.onModeChanged?.call(_mode);
    widget.onIndexChanged?.call(_selectedIndex);
  }

  void _setIndex(int index) {
    setState(() => _selectedIndex = index);
    widget.onIndexChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.surface,
      insetPadding: EdgeInsets.symmetric(
        horizontal: AppDimens.w20,
        vertical: AppDimens.h24,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.cardRadiusLg),
        side: BorderSide(
          color: AppColors.white12,
          width: AppDimens.borderWidthMd,
        ),
      ),
      child: Padding(
        padding: AppDimens.p16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            SizedBox(height: AppDimens.spaceMd),
            _buildPreviewArea(context),
            SizedBox(height: AppDimens.spaceMd),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: AppDimens.p8,
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(AppDimens.cardRadiusMd),
        border: Border.all(
          color: AppColors.white12,
          width: AppDimens.borderWidthMd,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ModeTab(
              label: 'LEVEL',
              isActive: _mode == PreviewMode.level,
              onTap: () => _setMode(PreviewMode.level),
            ),
          ),
          SizedBox(width: AppDimens.w8),
          Expanded(
            child: _ModeTab(
              label: 'VARIANT',
              isActive: _mode == PreviewMode.variant,
              onTap: () => _setMode(PreviewMode.variant),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreviewArea(BuildContext context) {
    if (_visibleCount == 0) {
      return Container(
        height: AppDimens.h160,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.cardSurface,
          borderRadius: BorderRadius.circular(AppDimens.cardRadiusMd),
          border: Border.all(
            color: AppColors.white12,
            width: AppDimens.borderWidthMd,
          ),
        ),
        child: Text(
          'NO PREVIEW',
          style: AppTextStyles.labelMd.copyWith(
            color: AppColors.white38,
            letterSpacing: 1.2,
          ),
        ),
      );
    }

    return Container(
      height: AppDimens.h160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(AppDimens.cardRadiusMd),
        border: Border.all(
          color: AppColors.white12,
          width: AppDimens.borderWidthMd,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: widget.previewBuilder(context, _mode, _selectedIndex),
    );
  }

  Widget _buildFooter() {
    if (_visibleCount == 0) {
      return const SizedBox.shrink();
    }

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: AppDimens.w8,
      runSpacing: AppDimens.h8,
      children: List.generate(_visibleCount, (index) {
        final isSelected = index == _selectedIndex;
        return _IndexChip(
          label: '${index + 1}',
          isSelected: isSelected,
          onTap: () => _setIndex(index),
        );
      }),
    );
  }
}

class _ModeTab extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _ModeTab({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isActive
          ? AppColors.primary.withValues(alpha: 0.15)
          : Colors.transparent,
      borderRadius: BorderRadius.circular(AppDimens.cardRadiusSm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.cardRadiusSm),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: AppDimens.h8),
          alignment: Alignment.center,
          child: Text(
            label,
            style: AppTextStyles.labelMd.copyWith(
              color: isActive ? AppColors.secondary : AppColors.white38,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}

class _IndexChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _IndexChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? AppColors.primary : AppColors.cardSurface,
      borderRadius: BorderRadius.circular(AppDimens.cardRadiusSm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.cardRadiusSm),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.w12,
            vertical: AppDimens.h8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.cardRadiusSm),
            border: Border.all(
              color: isSelected
                  ? AppColors.primary.withValues(alpha: 0.6)
                  : AppColors.white12,
              width: AppDimens.borderWidthMd,
            ),
          ),
          child: Text(
            label,
            style: AppTextStyles.labelMd.copyWith(
              color: isSelected ? AppColors.secondary : AppColors.white54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
