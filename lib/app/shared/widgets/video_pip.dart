import 'dart:async';
import 'dart:io';

import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in_app_pip/picture_in_picture.dart';
import 'package:flutter_in_app_pip/pip_widget.dart';
import 'package:video_player/video_player.dart';

void startPip({required String url}) async {
  final CachedVideoPlayerPlus player;
  final ChewieController chewieController;

  try {
    final isNetwork = Uri.tryParse(url)?.host.isNotEmpty ?? false;

    if (isNetwork) {
      player = CachedVideoPlayerPlus.networkUrl(
        Uri.parse(url),
        cacheKey: url,
        invalidateCacheIfOlderThan: const Duration(minutes: 69),
      );
    } else {
      player = CachedVideoPlayerPlus.file(File(url));
    }

    await player.initialize();

    // Now safely create chewieController
    chewieController = ChewieController(
      videoPlayerController: player.controller,
      autoInitialize: false,
      showControls: true,
      customControls: _CustomControls(),
      autoPlay: true,
      errorBuilder: (context, errorMessage) => Center(
        child: Text(
          'Error playing video: $errorMessage',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

    // Start Picture in Picture
    PictureInPicture.startPiP(
      pipWidget: PiPWidget(
        onPiPClose: () {
          chewieController.dispose();
          player.dispose();
        },
        child: VideoPiP(chewieController: chewieController),
      ),
    );
  } catch (e) {
    debugPrint('Video initialization error: $e');
  }
}

class VideoPiP extends StatelessWidget {
  const VideoPiP({super.key, required this.chewieController});

  final ChewieController chewieController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: ColoredBox(
        color: Colors.black,
        child: Chewie(controller: chewieController),
      ),
    );
  }
}

class _CustomControls extends StatefulWidget {
  const _CustomControls();

  @override
  State<_CustomControls> createState() => _CustomControlsState();
}

class _CustomControlsState extends State<_CustomControls> {
  bool _showControls = true;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    _startHideTimer();
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() => _showControls = false);
      }
    });
  }

  void _showControlsTemporarily() {
    if (mounted) {
      setState(() => _showControls = true);
      _startHideTimer();
    }
  }

  void _toggleControls() {
    setState(() => _showControls = !_showControls);
    if (_showControls) {
      _startHideTimer();
    } else {
      _hideTimer?.cancel();
    }
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chewieController = ChewieController.of(context);
    final videoPlayerController = chewieController.videoPlayerController;

    return GestureDetector(
      onTap: _toggleControls,
      behavior: HitTestBehavior.translucent,
      child: MouseRegion(
        onEnter: (_) => _showControlsTemporarily(),
        onHover: (_) => _showControlsTemporarily(),
        onExit: (_) => _startHideTimer(),
        child: Stack(
          children: [
            // Close Button (Top Right)
            Positioned(
              top: 8,
              right: 8,
              child: AnimatedOpacity(
                opacity: _showControls ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 250),
                child: IgnorePointer(
                  ignoring: !_showControls,
                  child: IconButton(
                    onPressed: () => PictureInPicture.stopPiP(),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ),
              ),
            ),

            // Center Play/Pause
            Center(
              child: AnimatedOpacity(
                opacity: _showControls ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 250),
                child: IgnorePointer(
                  ignoring: !_showControls,
                  child: AnimatedBuilder(
                    animation: videoPlayerController,
                    builder: (context, _) {
                      final isPlaying = videoPlayerController.value.isPlaying;
                      return IconButton(
                        iconSize: 64,
                        icon: AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: Icon(
                            isPlaying
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (isPlaying) {
                            chewieController.pause();
                          } else {
                            chewieController.play();
                          }
                          _showControlsTemporarily();
                        },
                      );
                    },
                  ),
                ),
              ),
            ),

            // Bottom Seek Controls
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: _showControls ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 250),
                child: IgnorePointer(
                  ignoring: !_showControls,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    color: Colors.black.withAlpha(75),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        VideoProgressIndicator(
                          videoPlayerController,
                          allowScrubbing: true,
                          colors: const VideoProgressColors(
                            playedColor: Colors.red,
                            bufferedColor: Colors.white70,
                            backgroundColor: Colors.white30,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ValueListenableBuilder<VideoPlayerValue>(
                              valueListenable: videoPlayerController,
                              builder: (context, value, child) {
                                return Text(
                                  _formatDuration(value.position),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                );
                              },
                            ),
                            ValueListenableBuilder<VideoPlayerValue>(
                              valueListenable: videoPlayerController,
                              builder: (context, value, child) {
                                return Text(
                                  _formatDuration(value.duration),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return duration.inHours > 0
        ? "$hours:$minutes:$seconds"
        : "$minutes:$seconds";
  }
}
