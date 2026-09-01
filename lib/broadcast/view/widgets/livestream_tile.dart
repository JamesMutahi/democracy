import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/agora_service.dart';
import 'package:democracy/app/core/app_logger.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';

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

  // Default to the broadcast count, update via Agora stats once joined
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _count = widget.broadcast.participantsCount;
  }

  Future<void> _startPreview() async {
    try {
      setState(() => _isPlaying = true);

      // 🚨 Note: Ensure you fetch the token for the mini stream if required by your backend
      // final tokenData = await apiRepository.getBroadcastToken(broadcast: widget.broadcast);
      // final token = tokenData['token'] as String;
      // final uid = context.read<AuthBloc>().state.user!.id;

      await AgoraService().joinMiniStream(
        broadcast: widget.broadcast,
        // token: token,
        // uid: uid,
        onEngineReady: (engine) {
          // 🚨 Prevent crashes if the user scrolled away immediately after tapping play
          if (!mounted) {
            engine.leaveChannel();
            return;
          }

          _engine = engine;

          engine.registerEventHandler(
            RtcEngineEventHandler(
              onJoinChannelSuccess: (connection, elapsed) {
                if (!mounted) return;
                setState(() => _isJoined = true);
              },
              onRtcStats: (connection, stats) {
                if (!mounted) return;
                setState(
                  () => _count =
                      stats.userCount ?? widget.broadcast.participantsCount,
                );
              },
              onUserJoined: (connection, uid, elapsed) {
                if (!mounted) return;
                // Map the Agora UID to your host's UID
                if (widget.broadcast.host.id == uid) {
                  setState(() => _hostUid = uid);
                } else if (_hostUid == null) {
                  // Fallback: If your backend doesn't strictly map User IDs to Agora UIDs,
                  // just grab the first broadcaster that joins the channel
                  setState(() => _hostUid = uid);
                }
              },
              onUserOffline: (connection, uid, reason) {
                if (!mounted) return;
                if (_hostUid == uid) {
                  setState(() => _hostUid = null);
                }
              },
              onLeaveChannel: (connection, stats) {
                if (!mounted) return;
                setState(() {
                  _isJoined = false;
                  _hostUid = null;
                });
              },
            ),
          );
        },
      );
    } catch (e) {
      if (mounted) {
        setState(() => _isPlaying = false);
        AppLogger.error('Mini stream error: $e');
      }
    }
  }

  @override
  void dispose() {
    // 🚨 CRITICAL: Only leave the channel. DO NOT call AgoraService().dispose() here!
    // Disposing the singleton here will crash other parts of your app using Agora.
    _leaveChannel();
    super.dispose();
  }

  Future<void> _leaveChannel() async {
    // Safe to call even if _engine is null or not joined
    await AgoraService().leaveCurrent();
  }

  void _onTileTap() async {
    // Stop preview before navigating to the full stream
    setState(() {
      _isPlaying = false;
      _isJoined = false;
    });

    await _leaveChannel();

    if (mounted) {
      context.router.push(LiveStream(broadcastId: widget.broadcast.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTileTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
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
                        canvas: VideoCanvas(
                          uid: _hostUid!,
                          // 🚨 Acts like BoxFit.cover to prevent black bars/stretching
                          // renderMode: VideoRenderMode.renderModeHidden,
                        ),
                        connection: RtcConnection(
                          channelId: widget.broadcast.id.toString(),
                        ),
                      ),
                    ),
                  ),

                // Loading state
                if (_isPlaying && !_isJoined)
                  const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),

                // LIVE Badge
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, color: Colors.white, size: 8),
                        SizedBox(width: 6),
                        Text(
                          'LIVE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
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
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.3),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: _startPreview,
                        icon: const Icon(
                          Icons.play_arrow_rounded,
                          size: 60,
                          color: Colors.white,
                        ),
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
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileImage(
                      userId: widget.broadcast.host.id,
                      username: widget.broadcast.host.username,
                      imageUrl: widget.broadcast.host.image,
                      radius: 12,
                    ),
                    const SizedBox(width: 5),
                    ProfileName(
                      name: widget.broadcast.host.name,
                      username: widget.broadcast.host.username,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  widget.broadcast.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
