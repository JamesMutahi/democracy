import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:democracy/broadcast/models/broadcast.dart';

class AgoraService {
  static final AgoraService _instance = AgoraService._internal();
  factory AgoraService() => _instance;
  AgoraService._internal();

  RtcEngine? _engine;
  int? currentBroadcast;

  Future<RtcEngine> getEngine() async {
    if (_engine == null) {
      _engine = createAgoraRtcEngine();
      try {
        await _engine!.initialize(
          const RtcEngineContext(appId: String.fromEnvironment('AGORA_ID')),
        );
      } catch (e) {
        // Reset to null on failure so the next attempt tries to initialize again
        _engine = null;
        rethrow;
      }
    }
    return _engine!;
  }

  Future<void> joinMeeting({
    required bool isBroadcaster,
    required Broadcast broadcast,
    required Function(RtcEngine) onEngineReady,
  }) async {
    if (currentBroadcast == broadcast.id) return; // Already in this channel

    final engine = await getEngine();

    try {
      await engine.leaveChannel();
    } catch (_) {}

    await engine.enableAudioVolumeIndication(
      interval: 200,
      smooth: 3,
      reportVad: true,
    );
    await engine.setChannelProfile(
      ChannelProfileType.channelProfileLiveBroadcasting,
    );
    await engine.setClientRole(
      role: isBroadcaster
          ? ClientRoleType.clientRoleBroadcaster
          : ClientRoleType.clientRoleAudience,
    );
    await engine.enableAudio();

    if (isBroadcaster) {
      await engine.muteLocalAudioStream(true);
    }

    onEngineReady(engine);

    currentBroadcast = broadcast.id;
  }

  Future<void> joinLiveStream({
    required bool isHost,
    required Broadcast broadcast,
    required Function(RtcEngine) onEngineReady,
  }) async {
    // Already in this channel
    if (currentBroadcast == broadcast.id) return; // Already in this channel

    final engine = await getEngine();

    try {
      await engine.leaveChannel();
    } catch (_) {}

    if (isHost) {
      await engine.setVideoEncoderConfiguration(
        VideoEncoderConfiguration(
          dimensions: VideoDimensions(width: 1280, height: 720),
          frameRate: 24,
          bitrate: 1800,
          orientationMode: OrientationMode.orientationModeFixedPortrait,
          degradationPreference: DegradationPreference.maintainQuality,
        ),
      );
    }

    await engine.setChannelProfile(
      ChannelProfileType.channelProfileLiveBroadcasting,
    );
    await engine.setClientRole(
      role: isHost
          ? ClientRoleType.clientRoleBroadcaster
          : ClientRoleType.clientRoleAudience,
    );
    await engine.enableVideo();
    await engine.enableAudio();

    onEngineReady(engine);

    currentBroadcast = broadcast.id;
  }

  Future<void> joinMiniStream({
    required Broadcast broadcast,
    required Function(RtcEngine) onEngineReady,
  }) async {
    if (currentBroadcast == broadcast.id) return; // Already in this channel

    final engine = await getEngine();

    try {
      await engine.leaveChannel();
    } catch (_) {}

    await engine.setChannelProfile(
      ChannelProfileType.channelProfileLiveBroadcasting,
    );
    await engine.setClientRole(role: ClientRoleType.clientRoleAudience);
    await engine.enableVideo();
    await engine.enableAudio();

    onEngineReady(engine);

    currentBroadcast = broadcast.id;
  }

  Future<void> leaveCurrent() async {
    try {
      await _engine?.leaveChannel();
    } catch (_) {}
    currentBroadcast = null;
  }

  Future<void> dispose() async {
    await _engine?.release();
    _engine = null;
    currentBroadcast = null;
  }
}
