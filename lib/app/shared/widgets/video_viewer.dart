import 'dart:io';

import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';

class VideoViewer extends StatefulWidget {
  const VideoViewer({
    super.key,
    required this.url,
    this.cacheKey,
    this.showControls = true,
    this.autoPlay = false,
  });

  final String url;
  final String? cacheKey;
  final bool showControls;
  final bool autoPlay;

  @override
  State<VideoViewer> createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer>
    with AutomaticKeepAliveClientMixin {
  late final CachedVideoPlayerPlus _player;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> initializePlayer() async {
    bool isNetworkImage = Uri.tryParse(widget.url)?.host.isNotEmpty ?? false;
    if (isNetworkImage) {
      _player = CachedVideoPlayerPlus.networkUrl(
        Uri.parse(widget.url),
        cacheKey: widget.cacheKey,
        invalidateCacheIfOlderThan: const Duration(minutes: 69), // Nice!
      );
    } else {
      _player = CachedVideoPlayerPlus.file(File(widget.url));
    }

    await _player.initialize().then((_) {
      setState(() {});
    });
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _player.controller,
      autoInitialize: true,
      showControls: widget.showControls,
      autoPlay: widget.autoPlay,
    );
  }

  @override
  void dispose() {
    _player.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _player.isInitialized
        ? Chewie(controller: _chewieController)
        : BottomLoader();
  }
}
