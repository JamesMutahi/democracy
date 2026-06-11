import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:democracy/broadcast/models/broadcast.dart';

class AgoraService {
  static final AgoraService _instance = AgoraService._internal();
  factory AgoraService() => _instance;
  AgoraService._internal();

  RtcEngine? _engine;
  int? _currentBroadcast;

  Future<RtcEngine> getEngine() async {
    if (_engine == null) {
      _engine = createAgoraRtcEngine();
      await _engine!.initialize(
        RtcEngineContext(appId: const String.fromEnvironment('AGORA_ID')),
      );
    }
    return _engine!;
  }

  Future<void> joinMeeting({
    required bool isBroadcaster,
    required Broadcast broadcast,
    required Function(RtcEngine) onEngineReady,
  }) async {
    if (_currentBroadcast == broadcast.id) return; // Already in this channel

    final engine = await getEngine();

    await engine.leaveChannel(); // Leave previous

    await engine.enableAudio();
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
    if (isBroadcaster) await engine.muteLocalAudioStream(true);

    onEngineReady(engine);

    _currentBroadcast = broadcast.id;
  }

  Future<void> joinLiveStream({
    required bool isHost,
    required Broadcast broadcast,
    required Function(RtcEngine) onEngineReady,
  }) async {
    if (_currentBroadcast == broadcast.id) return; // Already in this channel

    final engine = await getEngine();

    await engine.leaveChannel(); // Leave previous

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
    await engine.setClientRole(role: ClientRoleType.clientRoleAudience);
    await engine.enableVideo();
    await engine.enableAudio();

    onEngineReady(engine);

    _currentBroadcast = broadcast.id;
  }

  Future<void> joinMiniStream({
    required Broadcast broadcast,
    required Function(RtcEngine) onEngineReady,
  }) async {
    if (_currentBroadcast == broadcast.id) return; // Already in this channel

    final engine = await getEngine();

    await engine.leaveChannel(); // Leave previous

    await engine.setChannelProfile(
      ChannelProfileType.channelProfileLiveBroadcasting,
    );
    await engine.setClientRole(role: ClientRoleType.clientRoleAudience);
    await engine.enableVideo();
    await engine.enableAudio();

    onEngineReady(engine);

    _currentBroadcast = broadcast.id;
  }

  Future<void> leaveCurrent() async {
    await _engine?.leaveChannel();
    _currentBroadcast = null;
  }

  Future<void> dispose() async {
    await _engine?.release();
    _engine = null;
    _currentBroadcast = null;
  }
}
