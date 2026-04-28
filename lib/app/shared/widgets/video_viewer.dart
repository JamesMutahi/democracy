import 'dart:io';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';

class VideoViewer extends StatefulWidget {
  const VideoViewer({
    super.key,
    required this.url,
    this.cacheKey,
    this.showControls = true,
    this.autoPlay = false,
    this.onVideoPlay,
  });

  final String url;
  final String? cacheKey;
  final bool showControls;
  final bool autoPlay;
  final VoidCallback? onVideoPlay;

  @override
  State<VideoViewer> createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer>
    with AutomaticKeepAliveClientMixin {
  late final CachedVideoPlayerPlus _player;
  late final ChewieController _chewieController;

  bool _isInitialized = false;
  bool hasPlayed = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      final isNetwork = Uri.tryParse(widget.url)?.host.isNotEmpty ?? false;

      if (isNetwork) {
        _player = CachedVideoPlayerPlus.networkUrl(
          Uri.parse(widget.url),
          cacheKey: widget.cacheKey,
          invalidateCacheIfOlderThan: const Duration(minutes: 69),
        );
      } else {
        _player = CachedVideoPlayerPlus.file(File(widget.url));
      }

      await _player.initialize();

      // Now safely create ChewieController
      _chewieController = ChewieController(
        videoPlayerController: _player.controller,
        autoInitialize: true,
        showControls: widget.showControls,
        autoPlay: widget.autoPlay,
        errorBuilder: (context, errorMessage) => Center(
          child: Text(
            'Error playing video: $errorMessage',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );

      _player.controller.addListener(_onVideoStateChanged);

      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      debugPrint('Video initialization error: $e');
      setState(() {
        _isInitialized = false;
      });
    }
  }

  void _onVideoStateChanged() {
    if (_player.controller.value.isPlaying && !hasPlayed) {
      hasPlayed = true;
      widget.onVideoPlay?.call();
    }
  }

  @override
  void dispose() {
    _player.controller.removeListener(_onVideoStateChanged);
    _chewieController.dispose();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (!_isInitialized) {
      return const BottomLoader();
    }

    return Chewie(controller: _chewieController);
  }
}