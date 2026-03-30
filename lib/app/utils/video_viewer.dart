import 'dart:async';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoViewer extends StatefulWidget {
  const VideoViewer({super.key, required this.urls});

  final List<String> urls;

  @override
  State<VideoViewer> createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer> {
  late FlickManager flickManager;
  late DataManager dataManager;

  @override
  void initState() {
    super.initState();
    _initFlickManager();
  }

  _initFlickManager() {
    flickManager = FlickManager(
      autoPlay: false,
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(widget.urls[0]),
      ),
      onVideoEnd: () {
        dataManager.skipToNextVideo(const Duration(seconds: 5));
      },
    );

    dataManager = DataManager(flickManager: flickManager, urls: widget.urls);
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && mounted) {
          flickManager.flickControlManager?.autoPause();
        } else if (visibility.visibleFraction == 1) {
          flickManager.flickControlManager?.autoResume();
        }
      },
      child: FlickVideoPlayer(
        flickManager: flickManager,
        preferredDeviceOrientationFullscreen: const [
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ],
        flickVideoWithControls: FlickVideoWithControls(
          videoFit: BoxFit.fitHeight,
          controls: CustomOrientationControls(dataManager: dataManager),
        ),
        flickVideoWithControlsFullscreen: FlickVideoWithControls(
          videoFit: BoxFit.fitHeight,
          controls: CustomOrientationControls(dataManager: dataManager),
        ),
      ),
    );
  }
}

class DataManager {
  DataManager({required this.flickManager, required this.urls});

  int currentPlaying = 0;
  final FlickManager flickManager;
  final List<String> urls;

  late Timer videoChangeTimer;

  String getNextVideo() {
    currentPlaying++;
    return urls[currentPlaying];
  }

  bool hasNextVideo() {
    return currentPlaying != urls.length - 1;
  }

  bool hasPreviousVideo() {
    return currentPlaying != 0;
  }

  skipToNextVideo([Duration? duration]) {
    if (hasNextVideo()) {
      flickManager.handleChangeVideo(
        VideoPlayerController.networkUrl(Uri.parse(urls[currentPlaying + 1])),
        videoChangeDuration: duration,
      );

      currentPlaying++;
    }
  }

  skipToPreviousVideo() {
    if (hasPreviousVideo()) {
      currentPlaying--;
      flickManager.handleChangeVideo(
        VideoPlayerController.networkUrl(Uri.parse(urls[currentPlaying])),
      );
    }
  }

  cancelVideoAutoPlayTimer({required bool playNext}) {
    if (playNext != true) {
      currentPlaying--;
    }

    flickManager.flickVideoManager?.cancelVideoAutoPlayTimer(
      playNext: playNext,
    );
  }
}

class CustomOrientationControls extends StatelessWidget {
  const CustomOrientationControls({
    super.key,
    this.iconSize = 20,
    this.fontSize = 12,
    this.dataManager,
  });

  final double iconSize;
  final double fontSize;
  final DataManager? dataManager;

  @override
  Widget build(BuildContext context) {
    FlickVideoManager flickVideoManager = Provider.of<FlickVideoManager>(
      context,
    );

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: FlickAutoHideChild(child: Container(color: Colors.black38)),
        ),
        Positioned.fill(
          child: FlickShowControlsAction(
            child: FlickSeekVideoAction(
              child: Center(
                child: flickVideoManager.nextVideoAutoPlayTimer != null
                    ? FlickAutoPlayCircularProgress(
                        colors: FlickAutoPlayTimerProgressColors(
                          backgroundColor: Colors.white30,
                          color: Colors.red,
                        ),
                      )
                    : FlickAutoHideChild(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  dataManager!.skipToPreviousVideo();
                                },
                                child: Icon(
                                  Icons.skip_previous,
                                  color: dataManager!.hasPreviousVideo()
                                      ? Colors.white
                                      : Colors.white38,
                                  size: 35,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FlickPlayToggle(size: 50),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  dataManager!.skipToNextVideo();
                                },
                                child: Icon(
                                  Icons.skip_next,
                                  color: dataManager!.hasNextVideo()
                                      ? Colors.white
                                      : Colors.white38,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: FlickAutoHideChild(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          FlickCurrentPosition(fontSize: fontSize),
                          Text(
                            ' / ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSize,
                            ),
                          ),
                          FlickTotalDuration(fontSize: fontSize),
                        ],
                      ),
                      Expanded(child: Container()),
                      FlickFullScreenToggle(size: iconSize),
                    ],
                  ),
                  FlickVideoProgressBar(
                    flickProgressBarSettings: FlickProgressBarSettings(
                      height: 5,
                      handleRadius: 5,
                      curveRadius: 50,
                      backgroundColor: Colors.white24,
                      bufferedColor: Colors.white38,
                      playedColor: Colors.red,
                      handleColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
