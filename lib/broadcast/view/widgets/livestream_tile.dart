import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/agora_service.dart';
import 'package:democracy/app/core/app_logger.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LivestreamTile extends StatefulWidget {
  final Broadcast broadcast;

  const LivestreamTile({super.key, required this.broadcast});

  @override
  State<LivestreamTile> createState() => _LivestreamTileState();
}

class _LivestreamTileState extends State<LivestreamTile> {
  RtcEngine? _engine;
  bool _isJoined = false;
  int? _hostUid;
  bool _isPlaying = false;
  late int _count = widget.broadcast.participantsCount;

  Future<void> _startPreview() async {
    try {
      await AgoraService().joinMiniStream(
        broadcast: widget.broadcast,
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
                if (widget.broadcast.host.id == uid) {
                  setState(() => _hostUid = uid);
                }
              },
              onLeaveChannel: (connection, stats) {
                setState(() => _count = stats.userCount ?? 0);
              },
            ),
          );
          context.read<BroadcastDetailBloc>().add(
            BroadcastDetailEvent.join(
              engine: engine,
              broadcast: widget.broadcast,
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
          context.router.push(LiveStream(broadcastId: widget.broadcast.id));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                          channelId: widget.broadcast.id.toString(),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProfileImage(user: widget.broadcast.host, radius: 12),
                    SizedBox(width: 5),
                    ProfileName(user: widget.broadcast.host),
                  ],
                ),
                SizedBox(height: 5),
                Text(widget.broadcast.title),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
