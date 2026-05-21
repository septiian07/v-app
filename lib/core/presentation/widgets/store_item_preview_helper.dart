import 'package:flutter/material.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/core/presentation/widgets/store_item_preview_dialog.dart';
import 'package:tactical_app/core/presentation/widgets/store_preview_media.dart';
import 'package:tactical_app/core/presentation/widgets/store_preview_fallback.dart';

class StoreItemPreviewHelper {
  static void show(BuildContext context, RiotWeaponSkinModel skin) {
    final levels = skin.levels ?? const [];
    final chromas = skin.chromas ?? const [];
    showDialog(
      context: context,
      builder: (_) => StoreItemPreviewDialog(
        levelCount: levels.length,
        variantCount: chromas.length,
        previewBuilder: (context, mode, index) {
          final media = buildPreviewMedia(skin, mode, index);
          return media ?? const StorePreviewFallback();
        },
      ),
    );
  }

  static Widget? buildPreviewMedia(
    RiotWeaponSkinModel skin,
    PreviewMode mode,
    int index,
  ) {
    final imageUrl = _previewImageUrl(skin, mode, index);
    final videoUrl = _previewVideoUrl(skin, mode, index);
    if (imageUrl == null && videoUrl == null) {
      return null;
    }
    return StorePreviewMedia(imageUrl: imageUrl, videoUrl: videoUrl);
  }

  static String? _previewImageUrl(
    RiotWeaponSkinModel skin,
    PreviewMode mode,
    int index,
  ) {
    if (mode == PreviewMode.level) {
      final levels = skin.levels;
      if (levels != null && levels.isNotEmpty) {
        final safeIndex = index.clamp(0, levels.length - 1);
        final level = levels[safeIndex];
        return level.displayIcon ?? skin.displayIcon;
      }
      return skin.displayIcon;
    }

    final chromas = skin.chromas;
    if (chromas != null && chromas.isNotEmpty) {
      final safeIndex = index.clamp(0, chromas.length - 1);
      final chroma = chromas[safeIndex];
      return chroma.fullRender ?? chroma.displayIcon ?? skin.displayIcon;
    }
    return skin.displayIcon;
  }

  static String? _previewVideoUrl(
    RiotWeaponSkinModel skin,
    PreviewMode mode,
    int index,
  ) {
    if (mode == PreviewMode.level) {
      final levels = skin.levels;
      if (levels != null && levels.isNotEmpty) {
        final safeIndex = index.clamp(0, levels.length - 1);
        return levels[safeIndex].streamedVideo;
      }
      return null;
    }

    final chromas = skin.chromas;
    if (chromas != null && chromas.isNotEmpty) {
      final safeIndex = index.clamp(0, chromas.length - 1);
      return chromas[safeIndex].streamedVideo;
    }
    return null;
  }
}
