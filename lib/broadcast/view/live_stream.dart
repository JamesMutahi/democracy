import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/agora_service.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus, WebSocketService;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/share_bottom_sheet.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/broadcast/bloc/broadcast/broadcast_bloc.dart';
import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class LiveStream extends StatelessWidget {
  const LiveStream({super.key, @PathParam('id') required this.broadcastId});

  final int broadcastId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BroadcastBloc(webSocketService: context.read<WebSocketService>())
            ..add(BroadcastEvent.load(broadcastId: broadcastId)),
      child: BlocBuilder<BroadcastBloc, BroadcastState>(
        buildWhen: (previous, current) => current.broadcastId == broadcastId,
        builder: (context, state) {
          if (state.status == BroadcastStatus.initial ||
              (state.status == BroadcastStatus.loading &&
                  state.broadcast == null)) {
            return BottomLoader();
          }
          if (state.status == BroadcastStatus.failure &&
              state.broadcast == null) {
            return FailureRetryButton(
              onPressed: () {
                context.read<BroadcastBloc>().add(
                  BroadcastEvent.load(broadcastId: broadcastId),
                );
              },
            );
          }
          return _LiveStream(broadcast: state.broadcast!);
        },
      ),
    );
  }
}

class _LiveStream extends StatefulWidget {
  const _LiveStream({required this.broadcast});

  final Broadcast broadcast;

  @override
  State<_LiveStream> createState() => _LiveStreamState();
}

class _LiveStreamState extends State<_LiveStream> {
  final AgoraService _agoraService = AgoraService();
  late RtcEngine _engine;

  bool isDeleted = false;
  bool _isJoined = false;
  bool _isMuted = false;
  bool _isCameraOn = true;
  User get me => context.read<AuthBloc>().state.user!;
  bool get _isHost => me.id == widget.broadcast.host.id;

  // Track remote users (especially the host for audience)
  int? _hostUid; // or main broadcaster UID
  List<int> _remoteUids = []; // For multi-broadcaster if needed

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    if (_isHost) {
      final status = await [Permission.microphone, Permission.camera].request();
      if (status[Permission.microphone] != PermissionStatus.granted ||
          status[Permission.camera] != PermissionStatus.granted) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Microphone and Camera permissions are required'),
            ),
          );
          context.router.popTop();
        }
        return;
      }
    }

    await _agoraService.joinLiveStream(
      isHost: _isHost,
      broadcast: widget.broadcast,
      onEngineReady: (engine) {
        _engine = engine;

        _engine.registerEventHandler(
          RtcEngineEventHandler(
            onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
              setState(() => _isJoined = true);
              if (_isHost) {
                _engine.startPreview(); // Important for host
                context.read<BroadcastDetailBloc>().add(
                  BroadcastDetailEvent.startRecording(
                    broadcast: widget.broadcast,
                  ),
                );
              }
              context.read<BroadcastDetailBloc>().add(
                BroadcastDetailEvent.subscribe(
                  broadcast: widget.broadcast,
                  isMuted: false,
                ),
              );
            },
            onUserJoined: (RtcConnection connection, int uid, int elapsed) {
              // Primarily tracks broadcasters
              setState(() {
                _remoteUids.add(uid);
                if (widget.broadcast.host.id == uid) {
                  setState(() => _hostUid = uid);
                }
              });
            },
            onUserOffline:
                (
                  RtcConnection connection,
                  int uid,
                  UserOfflineReasonType reason,
                ) {
                  setState(() {
                    _remoteUids.remove(uid);
                    if (_hostUid == uid) _hostUid = null;
                  });
                },
          ),
        );

        if (mounted) {
          context.read<BroadcastDetailBloc>().add(
            BroadcastDetailEvent.join(
              engine: _engine,
              broadcast: widget.broadcast,
              user: me,
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _cleanupAgora();
    super.dispose();
  }

  Future<void> _cleanupAgora() async {
    // 🚨 CRITICAL: Only leave the channel. Do NOT call dispose() globally
    // unless the user is completely closing the app.
    await _agoraService.leaveCurrent();

    if (mounted) {
      context.read<BroadcastDetailBloc>().add(
        BroadcastDetailEvent.unsubscribe(broadcast: widget.broadcast),
      );
    }
  }

  Future<void> _leaveChannel() async {
    await _cleanupAgora();
    if (mounted) {
      context.router.popTop(); // Only navigate here
    }
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (context) => _isHost
          /* TODO: End broadcast via bloc + leave */
          ? EndLivestreamDialog(
              onYesPressed: () {
                context.read<BroadcastDetailBloc>().add(
                  BroadcastDetailEvent.stopRecording(
                    broadcast: widget.broadcast,
                  ),
                );
                _leaveChannel();
              },
            )
          : LeaveLivestreamDialog(onYesPressed: _leaveChannel),
    );
  }

  Future<void> _toggleMute() async {
    final newMuteState = !_isMuted;
    setState(() => _isMuted = newMuteState);
    await _engine.muteLocalAudioStream(newMuteState);
  }

  Future<void> _toggleCamera() async {
    final newCameraState = !_isCameraOn;
    setState(() => _isCameraOn = newCameraState);

    await _engine.enableLocalVideo(newCameraState);
    if (newCameraState) {
      await _engine.startPreview();
    } else {
      await _engine.stopPreview();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<BroadcastDetailBloc>().add(
                BroadcastDetailEvent.subscribe(
                  broadcast: widget.broadcast,
                  isMuted: _isMuted,
                ),
              );
            }
          },
        ),
        BlocListener<BroadcastDetailBloc, BroadcastDetailState>(
          listener: (context, state) {
            switch (state) {
              case BroadcastUpdated():
                if (state.broadcast.id == widget.broadcast.id) {
                  context.read<BroadcastBloc>().add(
                    BroadcastEvent.updated(broadcast: state.broadcast),
                  );
                }
              case BroadcastDeleted(:final broadcastId):
                if (broadcastId == widget.broadcast.id) {
                  setState(() => isDeleted = true);
                }
              case BroadcastDetailFailure(:final error):
                final snackBar = getSnackBar(
                  context: context,
                  message: error,
                  status: SnackBarStatus.failure,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      ],
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          _showExitDialog();
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: isDeleted || !widget.broadcast.isActive
              ? const Center(
                  child: Text(
                    'This broadcast has been closed',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              : Stack(
                  children: [
                    // 1. Video Layer (Full Screen)
                    Positioned.fill(
                      child: !_isJoined
                          ? const Center(child: BottomLoader())
                          : _isHost
                          ? _localVideoView()
                          : _remoteVideoView(),
                    ),

                    // 2. UI Overlay Layer
                    Positioned.fill(child: _buildOverlay()),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildOverlay() {
    return Column(
      children: [
        // Top Bar (Back, Viewer Count, Leave)
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.4),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: _showExitDialog,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.broadcast.participantsCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: _showExitDialog,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red.withValues(alpha: 0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    _isHost ? 'End' : 'Leave',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Title & Host Info (Top Left)
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.broadcast.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor:
                              Colors.grey.shade700, // Replace with host image
                          child: const Icon(
                            Icons.person,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.broadcast.host.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const Spacer(),

        // Bottom Controls
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (_isHost) ...[
                    _ControlButton(
                      icon: _isMuted ? Icons.mic_off : Icons.mic,
                      label: _isMuted ? 'Unmute' : 'Mute',
                      isActive: !_isMuted,
                      onPressed: _toggleMute,
                    ),
                    _ControlButton(
                      icon: _isCameraOn ? Icons.videocam : Icons.videocam_off,
                      label: _isCameraOn ? 'Cam Off' : 'Cam On',
                      isActive: _isCameraOn,
                      onPressed: _toggleCamera,
                    ),
                    _ControlButton(
                      icon: Icons.flip_camera_ios,
                      label: 'Flip',
                      isActive: true,
                      onPressed: () => _engine.switchCamera(),
                    ),
                  ] else ...[
                    _ControlButton(
                      icon: Icons.handshake,
                      label: 'Request',
                      isActive: true,
                      onPressed: () {
                        // TODO: Trigger Request to Speak BLoC event
                      },
                    ),
                  ],
                  _ControlButton(
                    icon: Icons.share,
                    label: 'Share',
                    isActive: true,
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                        ),
                        builder: (_) =>
                            ShareBottomSheet(broadcast: widget.broadcast),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20), // Safe area padding
      ],
    );
  }

  Widget _localVideoView() {
    return AgoraVideoView(
      controller: VideoViewController(
        rtcEngine: _engine,
        canvas: const VideoCanvas(uid: 0),
      ),
    );
  }

  Widget _remoteVideoView() {
    if (_hostUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _hostUid!),
          connection: RtcConnection(channelId: widget.broadcast.id.toString()),
        ),
      );
    }

    // Graceful placeholder when waiting for host
    return Container(
      color: Colors.black87,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              'Waiting for ${widget.broadcast.host.name} to start...',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 16),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onPressed;

  const _ControlButton({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isActive
                ? Colors.white.withValues(alpha: 0.2)
                : Colors.red.withValues(alpha: 0.8),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon, color: Colors.white, size: 28),
            onPressed: onPressed,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class EndLivestreamDialog extends StatelessWidget {
  const EndLivestreamDialog({super.key, required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'End livestream',
      content: 'Are you sure you want to end the livestream?',
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        context.router.popTop();
        onYesPressed();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        context.router.popTop();
      },
    );
  }
}

class LeaveLivestreamDialog extends StatelessWidget {
  const LeaveLivestreamDialog({super.key, required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Leave livestream',
      content: 'Are you sure you want to leave the livestream?',
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        context.router.popTop();
        onYesPressed();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        context.router.popTop();
      },
    );
  }
}
