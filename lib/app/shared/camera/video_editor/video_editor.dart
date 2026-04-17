import 'dart:async';
import 'dart:io' as io;
import 'dart:math';
import 'dart:ui';

import 'package:democracy/app/bloc/global/global_cubit.dart';
import 'package:democracy/app/shared/camera/camera.dart';
import 'package:democracy/app/shared/camera/widgets/stickers.dart';
import 'package:democracy/app/shared/camera/video_editor/utils/audio_helper_service.dart';
import 'package:democracy/app/shared/camera/video_editor/widgets/clips_previewer.dart';
import 'package:democracy/app/shared/camera/video_editor/widgets/video_initializing_widget.dart';
import 'package:democracy/app/shared/camera/video_editor/widgets/video_progress_alert.dart';
import 'package:democracy/app/shared/camera/widgets/send.dart';
import 'package:democracy/user/models/user.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pro_image_editor/designs/whatsapp/whatsapp_sticker_editor.dart';
import 'package:pro_image_editor/designs/whatsapp/widgets/appbar/whatsapp_appbar.dart';
import 'package:pro_image_editor/features/main_editor/helpers/whats_app_helper.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import 'package:pro_video_editor/core/platform/io/io_helper.dart';
import 'package:pro_video_editor/pro_video_editor.dart';
import 'package:video_player/video_player.dart' hide VideoAudioTrack;

class VideoEditor extends StatefulWidget {
  const VideoEditor({
    super.key,
    required this.recipient,
    required this.textEditingController,
    required this.onImageEditingComplete,
    required this.onVideoEditingComplete,
    required this.path,
  });

  final User? recipient;
  final TextEditingController? textEditingController;
  final void Function(io.File) onImageEditingComplete;
  final void Function(String) onVideoEditingComplete;
  final String path;

  @override
  State<VideoEditor> createState() => _VideoEditorState();
}

class _VideoEditorState extends State<VideoEditor> {
  final _editorKey = GlobalKey<ProImageEditorState>();

  /// When true, the editor will be closed and will not navigate back to camera
  bool canPop = false;

  /// Helper class for managing WhatsApp filters.
  final _whatsAppHelper = WhatsAppHelper();

  final bool _useMaterialDesign =
      platformDesignMode == ImageEditorDesignMode.material;

  final _captionFocus = FocusNode();

  final _taskId = DateTime.now().microsecondsSinceEpoch.toString();

  /// The target format for the exported video.
  final _outputFormat = VideoOutputFormat.mp4;

  /// Indicates whether a seek operation is in progress.
  bool _isSeeking = false;

  /// Stores the currently selected trim duration span.
  TrimDurationSpan? _durationSpan;

  /// Temporarily stores a pending trim duration span.
  TrimDurationSpan? _tempDurationSpan;

  /// Controls video playback and trimming functionalities.
  ProVideoController? _proVideoController;

  /// Stores generated thumbnails for the trimmer bar and filter background.
  List<ImageProvider>? _thumbnails;

  /// Holds information about the selected video.
  ///
  /// This will be populated via [_setMetadata].
  late VideoMetadata _videoMetadata;

  /// Number of thumbnails to generate across the video timeline.
  final int _thumbnailCount = 7;

  /// The video currently loaded in the editor.
  late EditorVideo _video = EditorVideo.file(widget.path);

  final _proVideoEditor = ProVideoEditor.instance;

  String? _outputPath;
  final Map<String, Uint8List> _cachedKeyFrames = {};
  final Map<String, List<Uint8List>> _cachedKeyFrameList = {};

  /// The duration it took to generate the exported video.
  Duration _videoGenerationTime = Duration.zero;
  late VideoPlayerController _videoController;

  late final _audioService = AudioHelperService(
    videoController: _videoController,
  );
  final _updateClipsNotifier = ValueNotifier(false);

  late final ProImageEditorConfigs _configs = ProImageEditorConfigs(
    dialogConfigs: DialogConfigs(
      widgets: DialogWidgets(
        loadingDialog: (message, configs) =>
            VideoProgressAlert(taskId: _taskId),
      ),
    ),
    mainEditor: MainEditorConfigs(
      tools: [
        SubEditorMode.paint,
        SubEditorMode.text,
        SubEditorMode.emoji,
        SubEditorMode.sticker,
      ],
      widgets: MainEditorWidgets(
        appBar: (editor, rebuildStream) => ReactiveAppbar(
          stream: rebuildStream,
          builder: (_) => PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: Center(
              child: Stack(
                children: [
                  WhatsAppAppBar(
                    configs: editor.configs,
                    onClose: editor.closeEditor,
                    onTapCropRotateEditor: editor.openCropRotateEditor,
                    onTapStickerEditor: () => openWhatsAppStickerEditor(editor),
                    onTapPaintEditor: editor.openPaintEditor,
                    onTapTextEditor: editor.openTextEditor,
                    onTapUndo: editor.undoAction,
                    canUndo: editor.canUndo,
                    openEditor: editor.isSubEditorOpen,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomBar: (editor, rebuildStream, key) => null,
        wrapBody: (editor, rebuildStream, content) {
          return Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              content,
              if (!editor.isLayerBeingTransformed) _buildSendArea(editor),
            ],
          );
        },
      ),
    ),
    paintEditor: const PaintEditorConfigs(
      tools: [
        PaintMode.freeStyle,
        PaintMode.arrow,
        PaintMode.line,
        PaintMode.rect,
        PaintMode.circle,
        PaintMode.dashLine,
        PaintMode.polygon,
        // Blur and pixelate are not supported.
        // PaintMode.pixelate,
        // PaintMode.blur,
        PaintMode.eraser,
      ],
    ),
    clipsEditor: ClipsEditorConfigs(
      clips: [
        VideoClip(
          id: '001',
          title: 'My awesome video',
          // subtitle: 'Optional',
          duration: Duration.zero,
          clip: EditorVideoClip.autoSource(
            assetPath: _video.assetPath,
            bytes: _video.byteArray,
            file: _video.file,
            networkUrl: _video.networkUrl,
          ),
        ),
      ],
    ),
    videoEditor: const VideoEditorConfigs(
      initialMuted: false,
      initialPlay: false,
      isAudioSupported: true,
      minTrimDuration: Duration.zero,
      playTimeSmoothingDuration: Duration(milliseconds: 600),
    ),
    imageGeneration: const ImageGenerationConfigs(
      captureImageByteFormat: ImageByteFormat.rawStraightRgba,
    ),
    stickerEditor: StickerEditorConfigs(
      builder: (setLayer, scrollController) => EditorStickers(
        setLayer: setLayer,
        scrollController: scrollController,
      ),
    ),
    emojiEditor: EmojiEditorConfigs(
      checkPlatformCompatibility: !kIsWeb,
      style: EmojiEditorStyle(
        backgroundColor: Colors.transparent,
        textStyle: DefaultEmojiTextStyle.copyWith(
          fontFamily: !kIsWeb ? null : GoogleFonts.notoColorEmoji().fontFamily,
          fontSize: _useMaterialDesign ? 48 : 30,
        ),
        emojiViewConfig: EmojiViewConfig(
          gridPadding: EdgeInsets.zero,
          horizontalSpacing: 0,
          verticalSpacing: 0,
          recentsLimit: 40,
          backgroundColor: Colors.transparent,
          buttonMode: !_useMaterialDesign
              ? ButtonMode.CUPERTINO
              : ButtonMode.MATERIAL,
          loadingIndicator: const Center(child: CircularProgressIndicator()),
          columns: _calculateEmojiColumns(),
          emojiSizeMax: !_useMaterialDesign ? 32 : 64,
          replaceEmojiOnLimitExceed: false,
        ),
        bottomActionBarConfig: const BottomActionBarConfig(enabled: false),
      ),
    ),
  );

  void openWhatsAppStickerEditor(ProImageEditorState editor) async {
    editor.removeKeyEventListener();

    Layer? layer;
    if (_useMaterialDesign) {
      layer = await editor.openPage(
        WhatsAppStickerPage(
          configs: editor.configs,
          callbacks: editor.callbacks,
        ),
      );
    } else {
      layer = await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black12,
        showDragHandle: false,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (context) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              clipBehavior: Clip.hardEdge,
              child: WhatsAppStickerPage(
                configs: editor.configs,
                callbacks: editor.callbacks,
              ),
            ),
          ),
        ),
      );
    }
    editor.initKeyEventListener();
    if (layer == null || !mounted) return;

    if (layer.runtimeType != WidgetLayer) {
      layer.scale = editor.configs.emojiEditor.initScale;
    }

    editor.addLayer(layer);
  }

  /// Calculates the number of columns for the EmojiPicker.
  int _calculateEmojiColumns() => max(
    1,
    (_useMaterialDesign ? 6 : 10) / 400 * MediaQuery.sizeOf(context).width - 1,
  ).floor();

  Widget _buildSendArea(ProImageEditorState editor) {
    double opacity = max(
      0,
      min(1, 1 - 1 / 120 * _whatsAppHelper.filterShowHelper),
    );
    return SendArea(
      editor: editor,
      opacity: opacity,
      recipient: widget.recipient,
      controller: widget.textEditingController,
      captionFocus: _captionFocus,
    );
  }

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  @override
  void dispose() {
    _videoController.dispose();
    _audioService.dispose();
    _updateClipsNotifier.dispose();
    _captionFocus.dispose();
    super.dispose();
  }

  /// Loads and sets [_videoMetadata] for the given [_video].
  Future<void> _setMetadata() async {
    _videoMetadata = await _proVideoEditor.getMetadata(_video);
  }

  /// Generates thumbnails for the given [_video].
  Future<void> _generateThumbnails({bool updateClipThumbnails = true}) async {
    if (!mounted) return;
    var imageWidth =
        MediaQuery.sizeOf(context).width /
        _thumbnailCount *
        MediaQuery.devicePixelRatioOf(context);

    List<Uint8List> thumbnailList = [];

    /// On android `getKeyFrames` is a way faster than `getThumbnails` but
    /// the timestamps are more "random". If you want the best results i
    /// recommend you to use only `getThumbnails`.
    final duration = _videoMetadata.duration;
    final segmentDuration = duration.inMilliseconds / _thumbnailCount;
    thumbnailList = await _proVideoEditor.getThumbnails(
      ThumbnailConfigs(
        video: _video,
        outputSize: Size.square(imageWidth),
        boxFit: ThumbnailBoxFit.cover,
        timestamps: List.generate(_thumbnailCount, (i) {
          final midpointMs = (i + 0.5) * segmentDuration;
          return Duration(milliseconds: midpointMs.round());
        }),
        outputFormat: ThumbnailFormat.jpeg,
      ),
    );

    List<ImageProvider> temporaryThumbnails = thumbnailList
        .map(MemoryImage.new)
        .toList();

    if (updateClipThumbnails) {
      _configs.clipsEditor.clips.first = _configs.clipsEditor.clips.first
          .copyWith(thumbnails: temporaryThumbnails);
    }

    /// Optional precache every thumbnail
    if (mounted) {
      var cacheList = temporaryThumbnails.map(
        (item) => precacheImage(item, context),
      );
      await Future.wait(cacheList);
      _thumbnails = temporaryThumbnails;

      if (_proVideoController != null) {
        _proVideoController!.thumbnails = _thumbnails;
      }
    }
  }

  Future<void> _initializePlayer() async {
    await _setMetadata();

    _configs.clipsEditor.clips.first = _configs.clipsEditor.clips.first
        .copyWith(duration: _videoMetadata.duration);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _generateThumbnails();
    });

    _videoController = VideoPlayerController.file(io.File(widget.path));

    await Future.wait([
      _videoController.initialize(),
      _videoController.setLooping(false),
      _videoController.setVolume(_configs.videoEditor.initialMuted ? 0 : 100),
      _configs.videoEditor.initialPlay
          ? _videoController.play()
          : _videoController.pause(),
      _audioService.initialize(),
    ]);
    if (!mounted) return;

    _proVideoController = ProVideoController(
      videoPlayer: _buildVideoPlayer(),
      initialResolution: _videoMetadata.resolution,
      videoDuration: _videoMetadata.duration,
      fileSize: _videoMetadata.fileSize,
      thumbnails: _thumbnails,
    );

    _videoController.addListener(_onDurationChange);

    setState(() {});
  }

  void _onDurationChange() {
    var totalVideoDuration = _videoMetadata.duration;
    var duration = _videoController.value.position;
    _proVideoController!.setPlayTime(duration);

    if (_durationSpan != null && duration >= _durationSpan!.end) {
      _seekToPosition(_durationSpan!);
    } else if (duration >= totalVideoDuration) {
      _seekToPosition(
        TrimDurationSpan(start: Duration.zero, end: totalVideoDuration),
      );
    }
  }

  Future<void> _seekToPosition(TrimDurationSpan span) async {
    _durationSpan = span;

    if (_isSeeking) {
      _tempDurationSpan = span; // Store the latest seek request
      return;
    }
    _isSeeking = true;

    _proVideoController!.pause();
    _proVideoController!.setPlayTime(_durationSpan!.start);

    await _videoController.pause();
    await _videoController.seekTo(span.start);

    _isSeeking = false;

    // Check if there's a pending seek request
    if (_tempDurationSpan != null) {
      TrimDurationSpan nextSeek = _tempDurationSpan!;
      _tempDurationSpan = null; // Clear the pending seek
      await _seekToPosition(nextSeek); // Process the latest request
    }
  }

  /// Generates the final video based on the given [parameters].
  ///
  /// Applies blur, color filters, cropping, rotation, flipping, and trimming
  /// before exporting using FFmpeg. Measures and stores the generation time.
  Future<void> _generateVideo(CompleteParameters parameters) async {
    final stopwatch = Stopwatch()..start();

    unawaited(_videoController.pause());
    unawaited(_audioService.pause());
    final directory = await getTemporaryDirectory();

    final AudioTrack? customAudioTrack = parameters.customAudioTrack;
    final double volumeBalance = customAudioTrack?.volumeBalance ?? 0;
    double overlayVolume = 1;
    double originalVolume = 1;
    if (volumeBalance < 0) {
      overlayVolume += volumeBalance;
    } else {
      originalVolume -= volumeBalance;
    }

    final exportModel = VideoRenderData(
      id: _taskId,
      videoSegments: [VideoSegment(video: _video, volume: originalVolume)],
      outputFormat: _outputFormat,
      enableAudio: _proVideoController?.isAudioEnabled ?? true,
      imageLayers: parameters.layers.isNotEmpty
          ? [ImageLayer(image: EditorLayerImage.memory(parameters.image))]
          : null,
      blur: parameters.blur,
      colorFilters: parameters.colorFilters
          .map((el) => ColorFilter(matrix: el))
          .toList(),
      startTime: parameters.startTime,
      endTime: parameters.endTime,
      transform: parameters.isTransformed
          ? ExportTransform(
              width: parameters.cropWidth,
              height: parameters.cropHeight,
              rotateTurns: parameters.rotateTurns,
              x: parameters.cropX,
              y: parameters.cropY,
              flipX: parameters.flipX,
              flipY: parameters.flipY,
            )
          : null,
      audioTracks: customAudioTrack != null
          ? [
              VideoAudioTrack(
                path: (await _audioService.safeCustomAudioPath(
                  customAudioTrack,
                ))!,
                volume: overlayVolume,
              ),
            ]
          : [],
    );

    final now = DateTime.now().millisecondsSinceEpoch;
    try {
      _outputPath = await ProVideoEditor.instance.renderVideoToFile(
        '${directory.path}/my_video_$now.mp4',
        exportModel,
      );
      widget.onVideoEditingComplete(_outputPath!);
      setState(() {
        canPop = true;
      });
    } on RenderCanceledException {
      stopwatch.stop();
      _outputPath = null;
      _videoGenerationTime = Duration.zero;
      return;
    }
    _videoGenerationTime = stopwatch.elapsed;
    debugPrint('Video generation time: $_videoGenerationTime');
  }

  /// If [_outputPath] is available, it performs the function [onVideoEditingComplete].
  /// Afterwards, it pops the current editor page.
  void _handleCloseEditor(EditorMode editorMode) async {
    if (editorMode != EditorMode.main) return Navigator.pop(context);
    await _handleBackToCamera();
  }

  Future<void> _handleBackToCamera() async {
    if (canPop) {
      if (mounted) Navigator.pop(context);
      return;
    }

    // Navigate back to CameraPage (replace current route)
    if (mounted) {
      // Push replacement
      final cameras = context.read<GlobalCubit>().state.cameras;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CameraPage(
            cameras: cameras,
            recipient: widget.recipient,
            textEditingController: widget.textEditingController,
            onImageEditingComplete: widget.onImageEditingComplete,
            onVideoEditingComplete: widget.onVideoEditingComplete,
          ),
        ),
      );
    }
  }

  Future<VideoClip?> _addClip() async {
    // Open video picker
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: false,
    );

    // User cancelled picker
    if (!mounted || result == null || result.files.isEmpty) return null;

    final file = result.files.single;
    final path = file.path;
    if (path == null) return null;

    // Extract file name for display
    final name = file.name;
    final title = name.split('.').first;
    LoadingDialog.instance.show(context, configs: _configs);
    final meta = await _proVideoEditor.getMetadata(EditorVideo.file(path));
    LoadingDialog.instance.hide();

    // Create and return your video clip
    return VideoClip(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      clip: EditorVideoClip.file(path),
      duration: meta.duration,
    );
  }

  Future<void> _mergeClips(
    List<VideoClip> clips,
    void Function(double) onProgress,
  ) async {
    LoadingDialog.instance.show(context, configs: _configs);
    final directory = await getApplicationCacheDirectory();
    final updatedFile = File('${directory.path}/temp.mp4');

    _updateClipsNotifier.value = true;
    await _proVideoEditor.renderVideoToFile(
      updatedFile.path,
      VideoRenderData(
        id: _taskId,
        videoSegments: clips.map((el) {
          final clip = el.clip;
          return VideoSegment(
            video: EditorVideo.autoSource(
              networkUrl: clip.networkUrl,
              assetPath: clip.assetPath,
              byteArray: clip.bytes,
              file: clip.file,
            ),
            startTime: el.trimSpan?.start,
            endTime: el.trimSpan?.end,
          );
        }).toList(),
      ),
    );
    if (!mounted) {
      LoadingDialog.instance.hide();
      return;
    }

    _video = EditorVideo.file(updatedFile.path);

    await _setMetadata();
    await _generateThumbnails(updateClipThumbnails: false);
    await _initializePlayer();

    final editor = _editorKey.currentState!;

    _proVideoController =
        ProVideoController(
          videoPlayer: _buildVideoPlayer(),
          initialResolution: _videoMetadata.resolution,
          videoDuration: _videoMetadata.duration,
          fileSize: _videoMetadata.fileSize,
          thumbnails: _thumbnails,
        )..initialize(
          configsFunction: () => _configs.videoEditor,
          callbacksAudioFunction: () =>
              editor.audioEditorCallbacks ?? const AudioEditorCallbacks(),
          callbacksFunction: () =>
              editor.callbacks.videoEditorCallbacks ?? VideoEditorCallbacks(),
        );

    /// Load the new video
    final controller = VideoPlayerController.file(io.File(updatedFile.path));
    await controller.initialize();
    LoadingDialog.instance.hide();

    if (!mounted) return;

    _videoController = controller;
    _videoController.addListener(_onDurationChange);
    editor.initializeVideoEditor();

    _updateClipsNotifier.value = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // Intercept system back button / gesture
      canPop: canPop,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        _handleBackToCamera();
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 220),
        child: _proVideoController == null
            ? const VideoInitializingWidget()
            : _buildEditor(),
      ),
    );
  }

  Widget _buildEditor() {
    return ProImageEditor.video(
      _proVideoController!,
      key: _editorKey,
      callbacks: ProImageEditorCallbacks(
        onCompleteWithParameters: _generateVideo,
        onCloseEditor: _handleCloseEditor,
        videoEditorCallbacks: VideoEditorCallbacks(
          onPause: _videoController.pause,
          onPlay: _videoController.play,
          onMuteToggle: (isMuted) {
            if (isMuted) {
              _audioService.setVolume(0);
              _videoController.setVolume(0);
            } else {
              _audioService.balanceAudio();
            }
          },
          onTrimSpanUpdate: (durationSpan) {
            if (_videoController.value.isPlaying) {
              _proVideoController!.pause();
            }
          },
          onTrimSpanEnd: _seekToPosition,
        ),
        audioEditorCallbacks: AudioEditorCallbacks(
          onBalanceChange: _audioService.balanceAudio,
          onStartTimeChange: (startTime) async {
            await Future.value([
              _audioService.seek(startTime),
              _videoController.seekTo(Duration.zero),
            ]);
          },
          onPlay: _audioService.play,
          onStop: (audio) => _audioService.pause(),
        ),
        clipsEditorCallbacks: ClipsEditorCallbacks(
          onBuildPlayer: (controller, videoClip) {
            return ClipsPreviewer(
              videoConfigs: _configs.videoEditor,
              proController: controller,
              videoClip: videoClip,
            );
          },
          onMergeClips: _mergeClips,
          onReadKeyFrame: (source) async {
            if (_cachedKeyFrames.containsKey(source.id)) {
              return _cachedKeyFrames[source.id]!;
            }

            final result = await _proVideoEditor.getKeyFrames(
              KeyFramesConfigs(
                video: EditorVideo.autoSource(
                  assetPath: source.clip.assetPath,
                  byteArray: source.clip.bytes,
                  file: source.clip.file,
                  networkUrl: source.clip.networkUrl,
                ),
                outputSize: const Size.square(200),
                boxFit: ThumbnailBoxFit.cover,
                maxOutputFrames: 1,
                outputFormat: ThumbnailFormat.jpeg,
              ),
            );
            _cachedKeyFrames[source.id] = result.first;
            return result.first;
          },
          onReadKeyFrames: (source) async {
            if (_cachedKeyFrameList.containsKey(source.id)) {
              return _cachedKeyFrameList[source.id]!;
            }

            final result = await _proVideoEditor.getKeyFrames(
              KeyFramesConfigs(
                video: EditorVideo.autoSource(
                  assetPath: source.clip.assetPath,
                  byteArray: source.clip.bytes,
                  file: source.clip.file,
                  networkUrl: source.clip.networkUrl,
                ),
                outputSize: const Size.square(200),
                boxFit: ThumbnailBoxFit.cover,
                maxOutputFrames: _thumbnailCount,
                outputFormat: ThumbnailFormat.jpeg,
              ),
            );
            _cachedKeyFrameList[source.id] = result;
            return result;
          },
          onAddClip: _addClip,
        ),
      ),
      configs: _configs,
    );
  }

  Widget _buildVideoPlayer() {
    return ValueListenableBuilder(
      valueListenable: _updateClipsNotifier,
      builder: (_, isLoading, _) {
        return Center(
          child: isLoading
              ? const CircularProgressIndicator.adaptive()
              : AspectRatio(
                  aspectRatio: _videoController.value.size.aspectRatio,
                  child: VideoPlayer(_videoController),
                ),
        );
      },
    );
  }
}
