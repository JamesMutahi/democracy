import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:democracy/app/bloc/global/global_cubit.dart';
import 'package:democracy/app/models/asset.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoViewer extends StatefulWidget {
  const VideoViewer({
    super.key,
    required this.asset,
    this.showControls = true,
    this.autoPlay = false,
  });

  final Asset asset;
  final bool showControls;
  final bool autoPlay;

  @override
  State<VideoViewer> createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer> {
  late final CachedVideoPlayerPlus _player;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    _player = CachedVideoPlayerPlus.networkUrl(
      Uri.parse(widget.asset.url),
      cacheKey: widget.asset.fileKey,
      invalidateCacheIfOlderThan: const Duration(minutes: 69), // Nice!
    );
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
    return BlocListener<GlobalCubit, GlobalState>(
      listener: (context, state) {
        if (state.currentlyPlaying?.id != widget.asset.id) {
          if (_chewieController.isPlaying) {
            _chewieController.pause();
          }
        }
      },
      child: _player.isInitialized
          ? Chewie(controller: _chewieController)
          : BottomLoader(),
    );
  }
}
