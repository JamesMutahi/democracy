import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AgoraService {
  static final AgoraService _instance = AgoraService._internal();
  factory AgoraService() => _instance;
  AgoraService._internal();

  RtcEngine? _engine;
  int? _currentMeeting;

  Future<RtcEngine> getEngine() async {
    if (_engine == null) {
      _engine = createAgoraRtcEngine();
      await _engine!.initialize(
        RtcEngineContext(appId: dotenv.env['AGORA_ID']!),
      );
    }
    return _engine!;
  }

  Future<void> joinAudioMeeting({
    required bool isBroadcaster,
    required Meeting meeting,
    required Function(RtcEngine) onEngineReady,
  }) async {
    if (_currentMeeting == meeting.id) return; // Already in this channel

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

    onEngineReady(engine);

    _currentMeeting = meeting.id;
  }

  Future<void> joinLiveStream({
    required bool isHost,
    required Meeting meeting,
    required Function(RtcEngine) onEngineReady,
  }) async {
    if (_currentMeeting == meeting.id) return; // Already in this channel

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

    _currentMeeting = meeting.id;
  }

  Future<void> joinMiniStream({
    required Meeting meeting,
    required Function(RtcEngine) onEngineReady,
  }) async {
    if (_currentMeeting == meeting.id) return; // Already in this channel

    final engine = await getEngine();

    await engine.leaveChannel(); // Leave previous

    await engine.setChannelProfile(
      ChannelProfileType.channelProfileLiveBroadcasting,
    );
    await engine.setClientRole(role: ClientRoleType.clientRoleAudience);
    await engine.enableVideo();
    await engine.enableAudio();

    onEngineReady(engine);

    _currentMeeting = meeting.id;
  }

  Future<void> leaveCurrent() async {
    await _engine?.leaveChannel();
    _currentMeeting = null;
  }

  Future<void> dispose() async {
    await _engine?.release();
    _engine = null;
    _currentMeeting = null;
  }
}
