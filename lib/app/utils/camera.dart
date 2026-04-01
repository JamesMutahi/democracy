import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:democracy/app/utils/image_editor.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:video_player/video_player.dart';

List<CameraDescription> get cameras => _cameras;
List<CameraDescription> _cameras = <CameraDescription>[];

void openCamera({
  required BuildContext context,
  required User? recipient,
  required TextEditingController textEditingController,
  required void Function(File) onImageEditingComplete,
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
        ),
      ),
    );
  }
}

void _logError(String code, String? message) {
  // TODO: Log error
  print('Error: $code${message == null ? '' : '\nError Message: $message'}');
}

class CameraPage extends StatefulWidget {
  const CameraPage({
    super.key,
    required this.recipient,
    required this.textEditingController,
    required this.onImageEditingComplete,
  });

  final User? recipient;
  final TextEditingController textEditingController;
  final void Function(File) onImageEditingComplete;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late CameraController controller;
  VideoPlayerController? videoController;
  late TabController _tabController;

  XFile? imageFile;
  XFile? videoFile;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCameraController(
      _cameras.firstWhere((c) => c.lensDirection == CameraLensDirection.back),
    );
    _tabController = TabController(length: 4, initialIndex: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  Future<void> _handleTabSelection() async {
    if (_tabController.index == 0 || _tabController.index == 3) {
      int index = _tabController.previousIndex;
      setState(() {
        _tabController.index = index;
      });
    }
  }

  Future<void> _switchCamera() async {
    if (_cameras.isEmpty) return;

    final currentDirection = controller.description.lensDirection;
    final newCamera = _cameras.firstWhere(
      (c) => c.lensDirection != currentDirection,
      orElse: () => _cameras.first,
    );

    await _initializeCameraController(newCamera);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    controller.dispose();
    videoController?.dispose();
    _tabController.dispose();
    super.dispose();
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
    return Scaffold(
      body: SafeArea(
        child: NativeDeviceOrientationReader(
          useSensor: true,
          builder: (ctx) {
            final orientation = NativeDeviceOrientationReader.orientation(ctx);
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
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _CameraButton(
                          iconData: Icons.close_rounded,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          turns: turns,
                          child: null,
                        ),
                        // TODO: Show when on video tab; Long press on camera button switches to video tab; Start and stop timer
                        RotatedBox(
                          quarterTurns: turns,
                          child: Card(
                            color: Colors.black.withAlpha(75),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '00:00',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        _FlashModeButton(
                          onPressed: onSetFlashModeButtonPressed,
                          turns: turns,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _CameraButton(
                          iconData: Icons.photo_outlined,
                          onPressed: () {
                            //   TODO: Open gallery
                          },
                          turns: turns,
                          child: null,
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap:
                                controller.value.isInitialized &&
                                    !controller.value.isRecordingVideo
                                ? onTakePictureButtonPressed
                                : null,
                            onLongPress: () {
                              // TODO: Animate circle avatar to red square and show recording timer at top center
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: BoxBorder.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(7.5),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                              ),
                            ),
                          ),
                        ),
                        _SwitchCameraButton(
                          onPressed: _switchCamera,
                          turns: turns,
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
        child: TabBar(
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
            IgnorePointer(ignoring: true, child: SizedBox(width: 200)),
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
            IgnorePointer(ignoring: true, child: SizedBox(width: 200)),
          ],
        ),
      ),
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

  void onTakePictureButtonPressed() {
    takePicture().then((XFile? file) {
      if (mounted) {
        setState(() {
          imageFile = file;
          videoController?.dispose();
          videoController = null;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ImageEditor(
              recipient: widget.recipient,
              textEditingController: widget.textEditingController,
              onImageEditingComplete: widget.onImageEditingComplete,
              path: imageFile!.path,
            ),
          ),
        );
      }
    });
  }

  Future<XFile?> takePicture() async {
    final CameraController cameraController = controller;
    if (!cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      showInSnackBar('Error: ${e.code}\n${e.description}');
      return null;
    }
  }

  void onVideoRecordButtonPressed() {
    startVideoRecording().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  Future<void> startVideoRecording() async {
    final CameraController cameraController = controller;

    if (!cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return;
    }

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
