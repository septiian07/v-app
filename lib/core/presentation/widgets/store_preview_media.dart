import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';

class StorePreviewMedia extends StatefulWidget {
  final String? imageUrl;
  final String? videoUrl;
  final BoxFit fit;

  const StorePreviewMedia({
    super.key,
    required this.imageUrl,
    required this.videoUrl,
    this.fit = BoxFit.cover,
  });

  @override
  State<StorePreviewMedia> createState() => _StorePreviewMediaState();
}

class _StorePreviewMediaState extends State<StorePreviewMedia> {
  VideoPlayerController? _controller;
  bool _videoFailed = false;

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  @override
  void didUpdateWidget(covariant StorePreviewMedia oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoUrl != widget.videoUrl) {
      _disposeVideo();
      _initVideo();
    }
  }

  Future<void> _initVideo() async {
    final videoUrl = widget.videoUrl;
    if (videoUrl == null || videoUrl.isEmpty) {
      return;
    }

    try {
      final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
      await controller.initialize();
      controller
        ..setLooping(true)
        ..setVolume(1.0)
        ..play();
      if (!mounted) {
        await controller.dispose();
        return;
      }
      setState(() => _controller = controller);
    } catch (_) {
      if (mounted) {
        setState(() => _videoFailed = true);
      }
    }
  }

  void _disposeVideo() {
    _controller?.dispose();
    _controller = null;
    _videoFailed = false;
  }

  @override
  void dispose() {
    _disposeVideo();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null && _controller!.value.isInitialized) {
      return FittedBox(
        fit: widget.fit,
        child: SizedBox(
          width: _controller!.value.size.width,
          height: _controller!.value.size.height,
          child: VideoPlayer(_controller!),
        ),
      );
    }

    if (!_videoFailed && widget.videoUrl != null) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.white38,
          strokeWidth: 2.0,
        ),
      );
    }

    final imageUrl = widget.imageUrl;
    if (imageUrl == null || imageUrl.isEmpty) {
      return Container(
        color: AppColors.black26,
        alignment: Alignment.center,
        child: Icon(
          Icons.broken_image,
          color: AppColors.white24,
          size: AppDimens.iconLg,
        ),
      );
    }

    return Image.network(
      imageUrl,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => Container(
        color: AppColors.black26,
        alignment: Alignment.center,
        child: Icon(
          Icons.broken_image,
          color: AppColors.white24,
          size: AppDimens.iconLg,
        ),
      ),
    );
  }
}
