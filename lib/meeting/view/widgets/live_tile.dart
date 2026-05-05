import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:democracy/app/bloc/services/agora_service.dart';
import 'package:democracy/app/core/app_logger.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/meeting/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/meeting/view/live_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LivePostTile extends StatefulWidget {
  final Meeting meeting;

  const LivePostTile({super.key, required this.meeting});

  @override
  State<LivePostTile> createState() => _LivePostTileState();
}

class _LivePostTileState extends State<LivePostTile> {
  RtcEngine? _engine;
  bool _isJoined = false;
  int? _hostUid;
  bool _isPlaying = false;
  late int _count = widget.meeting.participantsCount;

  Future<void> _startPreview() async {
    try {
      await AgoraService().joinMiniStream(
        meeting: widget.meeting,
        onEngineReady: (engine) {
          setState(() {
            _engine = engine;
          });

          engine.registerEventHandler(
            RtcEngineEventHandler(
              onRtcStats: (connection, stats) {
                setState(() => _count = stats.userCount ?? 0);
              },
              onUserJoined: (connection, uid, elapsed) {
                if (widget.meeting.host.id == uid) {
                  setState(() => _hostUid = uid);
                }
              },
              onLeaveChannel: (connection, stats) {
                setState(() => _count = stats.userCount ?? 0);
              },
            ),
          );
          context.read<MeetingDetailBloc>().add(
            MeetingDetailEvent.join(
              engine: engine,
              meeting: widget.meeting,
              user: context.read<AuthBloc>().state.user!,
            ),
          );
        },
      );
    } catch (e) {
      AppLogger.error(e.toString());
    }
  }

  @override
  void dispose() async {
    _leaveChannel();
    super.dispose();
  }

  Future<void> _leaveChannel() async {
    await AgoraService().leaveCurrent();
    await AgoraService().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          _isPlaying = false;
          _isJoined = false;
        });
        await _leaveChannel();
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LiveStream(meeting: widget.meeting),
            ),
          );
        }
      },
      child: Container(
        height: 220, // Fixed aspect ratio like Twitter
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Live Video Preview
            if (_isJoined && _hostUid != null && _engine != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AgoraVideoView(
                  controller: VideoViewController.remote(
                    rtcEngine: _engine!,
                    canvas: VideoCanvas(uid: _hostUid!),
                    connection: RtcConnection(
                      channelId: widget.meeting.id.toString(),
                    ),
                  ),
                ),
              ),
            if (_isPlaying && !_isJoined)
              const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),

            // LIVE Badge
            const Positioned(
              top: 12,
              left: 12,
              child: Row(
                children: [
                  Icon(Icons.circle, color: Colors.red, size: 10),
                  SizedBox(width: 6),
                  Text(
                    'LIVE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Viewer count
            Positioned(
              bottom: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$_count watching',
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            ),

            // Play icon overlay when not playing
            if (!_isPlaying)
              Center(
                child: IconButton(
                  onPressed: () {
                    _startPreview();
                    setState(() {
                      _isPlaying = true;
                    });
                  },
                  icon: Icon(
                    Icons.play_circle_outline,
                    size: 60,
                    color: Colors.white70,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
