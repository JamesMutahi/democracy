import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;

  const AudioPlayerWidget({super.key, required this.audioUrl});

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late final AudioController _controller;
  bool _isUserSeeking = false;
  double _sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AudioController();
    _controller.onStateChanged = () => setState(() {});
    _controller.loadAudio(widget.audioUrl);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 800),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: _controller.hasError
            ? _buildErrorState(colorScheme)
            : _buildPlayerControls(colorScheme),
      ),
    );
  }

  Widget _buildErrorState(ColorScheme colorScheme) {
    return Row(
      children: [
        Icon(Icons.error_outline, color: colorScheme.error),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            _controller.errorMessage,
            style: TextStyle(color: colorScheme.error, fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextButton(
          onPressed: () => _controller.loadAudio(widget.audioUrl),
          child: const Text('Retry'),
        ),
      ],
    );
  }

  Widget _buildPlayerControls(ColorScheme colorScheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            _buildPlayPauseButton(colorScheme),
            const SizedBox(width: 16),
            Expanded(child: _buildSeekBar(colorScheme)),
          ],
        ),
        const SizedBox(height: 8),
        _buildTimeLabels(colorScheme),
      ],
    );
  }

  Widget _buildPlayPauseButton(ColorScheme colorScheme) {
    return IconButton(
      iconSize: 40,
      onPressed: _controller.isLoading
          ? null
          : () {
              if (_controller.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            },
      icon: _controller.isLoading
          ? SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: colorScheme.primary,
              ),
            )
          : Icon(
              _controller.isPlaying
                  ? Icons.pause_circle_filled
                  : Icons.play_circle_fill,
              color: colorScheme.primary,
            ),
    );
  }

  Widget _buildSeekBar(ColorScheme colorScheme) {
    final max = _controller.duration.inMilliseconds.toDouble();
    final value = _isUserSeeking
        ? _sliderValue
        : _controller.position.inMilliseconds.toDouble().clamp(0.0, max);

    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
      ),
      child: Slider(
        min: 0.0,
        max: max > 0 ? max : 1.0,
        value: value,
        activeColor: colorScheme.primary,
        onChangeStart: (_) => _isUserSeeking = true,
        onChanged: (newValue) {
          setState(() {
            _sliderValue = newValue;
          });
        },
        onChangeEnd: (newValue) {
          _isUserSeeking = false;
          _controller.seek(Duration(milliseconds: newValue.toInt()));
        },
      ),
    );
  }

  Widget _buildTimeLabels(ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _formatDuration(
              _isUserSeeking
                  ? Duration(milliseconds: _sliderValue.toInt())
                  : _controller.position,
            ),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            _formatDuration(_controller.duration),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    if (duration.inHours > 0) {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    }
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}

class AudioController {
  final AudioPlayer _player = AudioPlayer();

  // State variables
  bool isPlaying = false;
  bool isLoading = true;
  bool hasError = false;
  String errorMessage = '';
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  // Callbacks to notify the UI
  VoidCallback? onStateChanged;

  AudioController() {
    _initAudioSession();
    _listenToPlayerStreams();
  }

  /// Configures the OS audio session to handle interruptions (calls, notifications)
  Future<void> _initAudioSession() async {
    final session = await AudioSession.instance;
    await session.configure(
      const AudioSessionConfiguration(
        avAudioSessionCategory: AVAudioSessionCategory.playback,
        avAudioSessionCategoryOptions: AVAudioSessionCategoryOptions.duckOthers,
        avAudioSessionMode: AVAudioSessionMode.defaultMode,
        androidAudioAttributes: AndroidAudioAttributes(
          contentType: AndroidAudioContentType.music,
          usage: AndroidAudioUsage.media,
        ),
        androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
        androidWillPauseWhenDucked: true,
      ),
    );

    // Listen to interruptions (e.g., phone calls)
    session.interruptionEventStream.listen((event) {
      if (event.begin) {
        if (_player.playing) pause();
      } else {
        if (event.type == AudioInterruptionType.pause ||
            event.type == AudioInterruptionType.duck) {
          play();
        }
      }
    });
  }

  /// Listens to native player streams and updates state
  void _listenToPlayerStreams() {
    _player.playerStateStream.listen((state) {
      isPlaying = state.playing;
      isLoading =
          state.processingState == ProcessingState.loading ||
          state.processingState == ProcessingState.buffering;

      if (state.processingState == ProcessingState.completed) {
        isPlaying = false;
        position = Duration.zero;
      }
      onStateChanged?.call();
    });

    _player.positionStream.listen((pos) {
      position = pos;
      onStateChanged?.call();
    });

    _player.durationStream.listen((dur) {
      duration = dur ?? Duration.zero;
      onStateChanged?.call();
    });
  }

  /// Loads the audio from a URL with robust error handling
  Future<void> loadAudio(String url) async {
    isLoading = true;
    hasError = false;
    errorMessage = '';
    onStateChanged?.call();

    try {
      await _player.setUrl(url);
    } on PlayerException catch (e) {
      hasError = true;
      errorMessage = 'Player error: ${e.code} - ${e.message}';
    } catch (e) {
      hasError = true;
      errorMessage = 'Network or system error: $e';
    } finally {
      isLoading = false;
      onStateChanged?.call();
    }
  }

  void play() => _player.play();
  void pause() => _player.pause();

  void seek(Duration position) => _player.seek(position);

  /// Disposes native resources to prevent memory leaks
  void dispose() {
    _player.dispose();
  }
}
