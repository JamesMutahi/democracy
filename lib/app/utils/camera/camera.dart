import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:democracy/app/utils/camera/video_editor/video_editor.dart';
import 'package:democracy/app/utils/camera/video_editor/widgets/video_progress_alert.dart';
import 'package:democracy/app/utils/snack_bar_content.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pro_video_editor/core/models/video/editor_video_model.dart';
import 'package:pro_video_editor/core/models/video/video_render_data_model.dart';
import 'package:pro_video_editor/core/models/video/video_segment_model.dart';
import 'package:pro_video_editor/core/platform/platform_interface.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:video_player/video_player.dart';

import 'image_editor/image_editor.dart';

List<CameraDescription> get cameras => _cameras;
List<CameraDescription> _cameras = <CameraDescription>[];

void openCamera({
  required BuildContext context,
  required User? recipient,
  required TextEditingController textEditingController,
  required void Function(File) onImageEditingComplete,
  void Function(File)? onVideoEditingComplete,
}) async {
  try {
    _cameras = await availableCameras();
  } on CameraException catch (e) {
    _logError(e.code, e.description);
  }
  if (context.mounted) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraPage(
          recipient: recipient,
          textEditingController: textEditingController,
          onImageEditingComplete: onImageEditingComplete,
          onVideoEditingComplete: onVideoEditingComplete,
        ),
      ),
    );
  }
}

void _logError(String code, String? message) {
  // TODO: Log error
  debugPrint(
    'Error: $code${message == null ? '' : '\nError Message: $message'}',
  );
}

class CameraPage extends StatefulWidget {
  const CameraPage({
    super.key,
    required this.recipient,
    required this.textEditingController,
    required this.onImageEditingComplete,
    required this.onVideoEditingComplete,
    this.tabIndex,
  });

  final User? recipient;
  final TextEditingController textEditingController;
  final void Function(File) onImageEditingComplete;
  final void Function(File)? onVideoEditingComplete;
  final int? tabIndex;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late CameraController controller;
  VideoPlayerController? videoController;
  late TabController _tabController;
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

  late bool onVideoTab = widget.tabIndex == 1 ? true : false;
  List<XFile> videoFiles = [];
  bool isSwitchingCamera = false;

  // For merge progress tracking
  String? _taskId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCameraController(
      _cameras.firstWhere((c) => c.lensDirection == CameraLensDirection.back),
    );
    _tabController = TabController(
      length: 4,
      initialIndex: widget.tabIndex ?? 2,
      vsync: this,
    );
    _tabController.addListener(_handleTabSelection);
  }

  Future<void> _handleTabSelection() async {
    if (_tabController.index == 0 || _tabController.index == 3) {
      int index = _tabController.previousIndex;
      setState(() {
        _tabController.index = index;
      });
    }
    if (_tabController.indexIsChanging) {
      if (_tabController.index == 1) {
        setState(() {
          onVideoTab = true;
        });
      }
      if (_tabController.index == 2) {
        setState(() {
          onVideoTab = false;
        });
      }
    }
  }

  @override
  void dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    controller.dispose();
    videoController?.dispose();
    _tabController.dispose();
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  // #docregion AppLifecycle
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (!cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCameraController(cameraController.description);
    }
  }
  // #enddocregion AppLifecycle

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: NativeDeviceOrientationReader(
              useSensor: true,
              builder: (ctx) {
                final orientation = NativeDeviceOrientationReader.orientation(
                  ctx,
                );
                int turns = 0;
                switch (orientation) {
                  case NativeDeviceOrientation.portraitUp:
                    turns = 0;
                    break;
                  case NativeDeviceOrientation.portraitDown:
                    turns = 2;
                    break;
                  case NativeDeviceOrientation.landscapeLeft:
                    turns = 1;
                    break;
                  case NativeDeviceOrientation.landscapeRight:
                    turns = 3;
                    break;
                  case NativeDeviceOrientation.unknown:
                    turns = 0;
                    break;
                }
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    _Camera(
                      controller: controller,
                      videoController: videoController,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 75,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          children: [
                            if (!controller.value.isRecordingVideo)
                              if (!isSwitchingCamera)
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: _CameraButton(
                                    iconData: Icons.close_rounded,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    turns: turns,
                                    child: null,
                                  ),
                                ),
                            if (_tabController.index == 1)
                              Align(
                                alignment: Alignment.center,
                                child: _Timer(
                                  stopWatchTimer: _stopWatchTimer,
                                  turns: turns,
                                ),
                              ),
                            if (!controller.value.isRecordingVideo)
                              if (!isSwitchingCamera)
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: _FlashModeButton(
                                    onPressed: onSetFlashModeButtonPressed,
                                    turns: turns,
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 100,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          children: [
                            if (!controller.value.isRecordingVideo)
                              if (!isSwitchingCamera)
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: _CameraButton(
                                    iconData: Icons.photo_outlined,
                                    onPressed: () {
                                      //   TODO: Open gallery
                                    },
                                    turns: turns,
                                    child: null,
                                  ),
                                ),
                            Align(
                              alignment: Alignment.center,
                              child: _MainCameraButton(
                                onVideoTab: onVideoTab,
                                isSwitchingCamera: isSwitchingCamera,
                                cameraController: controller,
                                onVideoRecordButtonPressed:
                                    onVideoRecordButtonPressed,
                                onStopButtonPressed: onStopButtonPressed,
                                recipient: widget.recipient,
                                textEditingController:
                                    widget.textEditingController,
                                onImageEditingComplete:
                                    widget.onImageEditingComplete,
                                onVideoEditingComplete:
                                    widget.onVideoEditingComplete,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: _SwitchCameraButton(
                                onPressed: _switchCamera,
                                turns: turns,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            padding: const EdgeInsets.all(0.0),
            height: 60.0,
            elevation: 100.0,
            color: Colors.black,
            child:
                isSwitchingCamera ||
                    widget.onVideoEditingComplete == null ||
                    controller.value.isRecordingVideo
                ? SizedBox.shrink()
                : TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    physics: NeverScrollableScrollPhysics(),
                    tabAlignment: TabAlignment.center,
                    labelStyle: Theme.of(context).textTheme.titleMedium,
                    splashBorderRadius: BorderRadius.circular(10),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withAlpha(50),
                    ),
                    padding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.symmetric(horizontal: 10),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    tabs: [
                      IgnorePointer(
                        ignoring: true,
                        child: SizedBox(width: 200),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5,
                        ),
                        child: Text('Video'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5,
                        ),
                        child: Text('Photo'),
                      ),
                      IgnorePointer(
                        ignoring: true,
                        child: SizedBox(width: 200),
                      ),
                    ],
                  ),
          ),
        ),
        if (_taskId != null)
          SafeArea(child: VideoProgressAlert(taskId: _taskId!)),
      ],
    );
  }

  Future<void> _initializeCameraController(
    CameraDescription cameraDescription,
  ) async {
    final cameraController = CameraController(
      cameraDescription,
      kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
      enableAudio: true,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    controller = cameraController;

    // If the controller is updated then update the UI.
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (cameraController.value.hasError) {
        showInSnackBar(
          'Camera error ${cameraController.value.errorDescription}',
        );
      }
    });

    try {
      await cameraController.initialize();
      await Future.wait(<Future<Object?>>[
        cameraController.getMaxZoomLevel().then((double value) => 1.0),
        cameraController.getMinZoomLevel().then((double value) => 1.0),
      ]);
    } on CameraException catch (e) {
      if (mounted) {
        switch (e.code) {
          case 'CameraAccessDenied':
            showInSnackBar('You have denied camera access.');
          case 'CameraAccessDeniedWithoutPrompt':
            // iOS only
            showInSnackBar(
              'Please go to Settings app to enable camera access.',
            );
          case 'CameraAccessRestricted':
            // iOS only
            showInSnackBar('Camera access is restricted.');
          case 'AudioAccessDenied':
            showInSnackBar('You have denied audio access.');
          case 'AudioAccessDeniedWithoutPrompt':
            // iOS only
            showInSnackBar('Please go to Settings app to enable audio access.');
          case 'AudioAccessRestricted':
            // iOS only
            showInSnackBar('Audio access is restricted.');
          default:
            _showCameraException(e);
        }
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _switchCamera() async {
    if (_cameras.isEmpty) return;
    final currentDirection = controller.description.lensDirection;
    final newCamera = _cameras.firstWhere(
      (c) => c.lensDirection != currentDirection,
      orElse: () => _cameras.first,
    );

    if (controller.value.isRecordingVideo) {
      setState(() {
        isSwitchingCamera = true;
      });
      // Stop recording
      _stopWatchTimer.onStopTimer();
      XFile? file = await stopVideoRecording();
      setState(() {
        videoFiles.add(file!);
      });
      // Initialize with new camera
      await _initializeCameraController(newCamera);
      // Start recording again
      await startVideoRecording();
      _stopWatchTimer.onStartTimer();
      setState(() {
        isSwitchingCamera = false;
      });
    } else {
      await _initializeCameraController(newCamera);
    }
  }

  void onVideoRecordButtonPressed() {
    startVideoRecording().then((_) {
      if (mounted) {
        _stopWatchTimer.onStartTimer();
        videoFiles = [];
        setState(() {});
      }
    });
  }

  Future<void> startVideoRecording() async {
    final CameraController cameraController = controller;

    if (cameraController.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return;
    }

    try {
      await cameraController.startVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return;
    }
  }

  void onStopButtonPressed() {
    if (videoFiles.isNotEmpty) {
      setState(() {
        _taskId = "merge_${DateTime.now().millisecondsSinceEpoch}";
      });
    }
    stopVideoRecording().then((XFile? file) async {
      if (mounted) {
        _stopWatchTimer.onResetTimer();
        setState(() {
          videoFiles.add(file!);
        });
      }

      String path = file!.path;
      if (videoFiles.length == 1) {
        _navigateToVideoEditor(path: path);
      } else {
        try {
          path = await mergeFiles(files: videoFiles);
          _navigateToVideoEditor(path: path);
        } catch (e) {
          // TODO: Log error
          if (mounted) {
            final snackBar = getSnackBar(
              context: context,
              message: e.toString(),
              status: SnackBarStatus.failure,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          setState(() {
            _taskId = null;
          });
        }
      }
    });
  }

  void _navigateToVideoEditor({required String path}) {
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => VideoEditor(
            recipient: widget.recipient,
            textEditingController: widget.textEditingController,
            onImageEditingComplete: widget.onImageEditingComplete,
            onVideoEditingComplete: widget.onVideoEditingComplete!,
            path: path,
          ),
        ),
      );
    }
  }

  Future<String> mergeFiles({required List<XFile> files}) async {
    final directory = await getApplicationCacheDirectory();
    final mergedPath =
        '${directory.path}/merged_${DateTime.now().millisecondsSinceEpoch}.mp4';
    final List<VideoSegment> segments = files.map((xFile) {
      return VideoSegment(video: EditorVideo.file(File(xFile.path)));
    }).toList();

    await ProVideoEditor.instance.renderVideoToFile(
      mergedPath,
      VideoRenderData(
        id: _taskId,
        videoSegments: segments,
        outputFormat: VideoOutputFormat.mp4,
        enableAudio: true,
      ),
    );
    return mergedPath;
  }

  Future<XFile?> stopVideoRecording() async {
    final CameraController cameraController = controller;

    if (!cameraController.value.isRecordingVideo) {
      return null;
    }

    try {
      var file = await cameraController.stopVideoRecording();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void onSetFlashModeButtonPressed(FlashMode mode) {
    setFlashMode(mode).then((_) {
      if (mounted) {
        setState(() {});
      }
      showInSnackBar('Flash mode set to ${mode.toString().split('.').last}');
    });
  }

  Future<void> setFlashMode(FlashMode mode) async {
    try {
      await controller.setFlashMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _showCameraException(CameraException e) {
    _logError(e.code, e.description);
    if (context.mounted) {
      showInSnackBar('Error: ${e.code}\n${e.description}');
    }
  }
}

class _Camera extends StatefulWidget {
  const _Camera({required this.controller, required this.videoController});

  final CameraController controller;
  final VideoPlayerController? videoController;

  @override
  State<_Camera> createState() {
    return _CameraState();
  }
}

class _CameraState extends State<_Camera> with TickerProviderStateMixin {
  VoidCallback? videoPlayerListener;
  bool enableAudio = true;
  final double _minAvailableZoom = 1.0;
  final double _maxAvailableZoom = 1.0;
  double _currentScale = 1.0;
  double _baseScale = 1.0;

  // Counting pointers (number of user fingers on screen)
  int _pointers = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(color: Colors.black, child: _cameraPreviewWidget()),
        ),
      ],
    );
  }

  Widget _cameraPreviewWidget() {
    // Show loading while camera is not ready
    if (!widget.controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    // Safe guard for previewSize
    final previewSize = widget.controller.value.previewSize;
    if (previewSize == null) {
      return const Center(
        child: Text(
          'Camera preview not available',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Listener(
      onPointerDown: (_) => _pointers++,
      onPointerUp: (_) => _pointers--,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRect(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: previewSize.height,
                height: previewSize.width,
                child: CameraPreview(
                  widget.controller,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onScaleStart: _handleScaleStart,
                        onScaleUpdate: _handleScaleUpdate,
                        onTapDown: (details) =>
                            onViewFinderTap(details, constraints),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          // Zoom level indicator
          if (_currentScale > 1.01)
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    '${_currentScale.toStringAsFixed(1)}×',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _currentScale;
  }

  void _handleScaleUpdate(ScaleUpdateDetails details) async {
    if (_pointers != 2) return;

    _currentScale = (_baseScale * details.scale).clamp(
      _minAvailableZoom,
      _maxAvailableZoom,
    );

    try {
      await widget.controller.setZoomLevel(_currentScale);
    } catch (e) {
      debugPrint('Zoom error: $e');
    }
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    final CameraController cameraController = widget.controller;

    final offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    cameraController.setExposurePoint(offset);
    cameraController.setFocusPoint(offset);
  }

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

class _CameraButton extends StatelessWidget {
  const _CameraButton({
    required this.iconData,
    required this.child,
    required this.onPressed,
    required this.turns,
  });

  final IconData? iconData;
  final Widget? child;
  final VoidCallback onPressed;
  final int turns;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: turns,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withAlpha(75),
          ),
          child: child ?? Icon(iconData, color: Colors.white, size: 25),
        ),
      ),
    );
  }
}

class _SwitchCameraButton extends StatefulWidget {
  const _SwitchCameraButton({required this.onPressed, required this.turns});

  final VoidCallback onPressed;
  final int turns;

  @override
  State<_SwitchCameraButton> createState() => _SwitchCameraButtonState();
}

class _SwitchCameraButtonState extends State<_SwitchCameraButton> {
  double turns = 0.0;

  void _changeRotation() {
    setState(() {
      if (turns == 0) {
        turns = 1.0;
      } else {
        turns = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: turns,
      duration: const Duration(seconds: 1),
      child: _CameraButton(
        iconData: Icons.cameraswitch_rounded,
        onPressed: () {
          _changeRotation();
          widget.onPressed();
        },
        turns: widget.turns,
        child: null,
      ),
    );
  }
}

class _FlashModeButton extends StatefulWidget {
  const _FlashModeButton({required this.onPressed, required this.turns});

  final Function(FlashMode mode) onPressed;
  final int turns;

  @override
  State<_FlashModeButton> createState() => _FlashModeButtonState();
}

class _FlashModeButtonState extends State<_FlashModeButton> {
  final List<IconData> _icons = [
    Icons.flash_off_rounded,
    Icons.flash_auto_rounded,
    Icons.flash_on_rounded,
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _CameraButton(
      onPressed: () {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _icons.length;
        });
        if (_currentIndex == 0) {
          widget.onPressed(FlashMode.off);
        }
        if (_currentIndex == 1) {
          widget.onPressed(FlashMode.auto);
        }
        if (_currentIndex == 2) {
          widget.onPressed(FlashMode.always);
        }
      },
      turns: widget.turns,
      iconData: null,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, -1.0),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: Icon(
          _icons[_currentIndex],
          key: ValueKey<int>(_currentIndex),
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _Timer extends StatelessWidget {
  const _Timer({required this.stopWatchTimer, required this.turns});

  final StopWatchTimer stopWatchTimer;
  final int turns;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: stopWatchTimer.rawTime,
      initialData: 0,
      builder: (context, snap) {
        final value = snap.data;
        final displayTime = StopWatchTimer.getDisplayTime(
          value!,
          hours: false,
          minute: true,
          second: true,
          milliSecond: false,
        );
        return RotatedBox(
          quarterTurns: turns,
          child: Card(
            color: Colors.black.withAlpha(75),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(displayTime, style: TextStyle(color: Colors.white)),
            ),
          ),
        );
      },
    );
  }
}

class _MainCameraButton extends StatefulWidget {
  const _MainCameraButton({
    required this.onVideoTab,
    required this.isSwitchingCamera,
    required this.cameraController,
    required this.onVideoRecordButtonPressed,
    required this.onStopButtonPressed,
    required this.recipient,
    required this.textEditingController,
    required this.onImageEditingComplete,
    required this.onVideoEditingComplete,
  });

  final bool onVideoTab;
  final bool isSwitchingCamera;
  final CameraController cameraController;
  final VoidCallback onVideoRecordButtonPressed;
  final VoidCallback onStopButtonPressed;
  final User? recipient;
  final TextEditingController textEditingController;
  final void Function(File) onImageEditingComplete;
  final void Function(File)? onVideoEditingComplete;

  @override
  State<_MainCameraButton> createState() => _MainCameraButtonState();
}

class _MainCameraButtonState extends State<_MainCameraButton>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  late bool isRecording =
      widget.cameraController.value.isRecordingVideo ||
      widget.isSwitchingCamera;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.25).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isVideoMode = widget.onVideoTab;
    final double outerSize = isVideoMode ? (isRecording ? 80 : 70) : 80;
    return GestureDetector(
      onTap: () async {
        if (widget.cameraController.value.isInitialized) {
          if (widget.onVideoTab) {
            if (widget.onVideoTab) {
              if (isRecording) {
                setState(() {
                  isRecording = false;
                });
                await Future.delayed(Duration(milliseconds: 300));
                widget.onStopButtonPressed();
              } else {
                setState(() {
                  isRecording = true;
                });
                await Future.delayed(Duration(milliseconds: 300));
                widget.onVideoRecordButtonPressed();
              }
            }
          } else {
            _takePhotoWithAnimation();
          }
        }
      },
      child: ScaleTransition(
        scale: _animation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: outerSize,
          height: outerSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 5),
            color: isRecording ? Colors.black.withAlpha(50) : null,
          ),
          padding: EdgeInsets.all(isVideoMode ? (isRecording ? 20 : 13) : 7.5),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: isRecording ? Colors.red : Colors.white,
              borderRadius: BorderRadius.circular(isRecording ? 5 : 999),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _takePhotoWithAnimation() async {
    if (!widget.cameraController.value.isInitialized) return;
    await _animationController.forward();
    try {
      XFile file = await widget.cameraController.takePicture();
      await _animationController.reverse();
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ImageEditor(
              recipient: widget.recipient,
              textEditingController: widget.textEditingController,
              onImageEditingComplete: widget.onImageEditingComplete,
              onVideoEditingComplete: widget.onVideoEditingComplete,
              path: file.path,
            ),
          ),
        );
      }
    } on CameraException catch (e) {
      _logError(e.code, e.description);
    }
  }
}
