import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:democracy/app/bloc/services/agora_service.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/meeting/view/live_stream.dart';
import 'package:flutter/material.dart';

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

  Future<void> _startPreview() async {
    try {
      await AgoraService().joinMiniStream(
        meeting: widget.meeting,
        onEngineReady: (engine) {
          _engine = engine;
          setState(() => _isJoined = true);

          engine.registerEventHandler(
            RtcEngineEventHandler(
              onUserJoined: (connection, uid, elapsed) {
                setState(() => _hostUid = uid);
              },
            ),
          );
        },
      );
    } catch (e) {
      debugPrint("Mini stream error: $e");
    }
  }

  @override
  void dispose() async {
    await _leaveChannel();
    super.dispose();
  }

  Future<void> _leaveChannel() async {
    setState(() {
      _isPlaying = false;
      _isJoined = false;
    });
    await AgoraService().leaveCurrent();
    await AgoraService().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
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
                  '${widget.meeting.participantsCount} watching',
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
