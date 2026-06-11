import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/agora_service.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus, WebSocketService;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/broadcast/bloc/broadcast/broadcast_bloc.dart';
import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/view/widgets/broadcast_pop_up_menu.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
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
  bool isDeleted = false;
  late RtcEngine _engine;
  bool _isJoined = false;
  bool _isMuted = false;
  late User me = context.read<AuthBloc>().state.user!;
  late final bool _isHost = me.id == widget.broadcast.host.id;

  // Track remote users (especially the host for audience)
  int? _hostUid; // or main broadcaster UID
  List<int> _remoteUids = []; // For multi-broadcaster if needed
  int? _count;

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    if (_isHost) {
      await [Permission.microphone, Permission.camera].request();
    }
    await AgoraService().joinLiveStream(
      isHost: _isHost,
      broadcast: widget.broadcast,
      onEngineReady: (engine) {
        setState(() {
          _engine = engine;
        });

        _engine.registerEventHandler(
          RtcEngineEventHandler(
            onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
              setState(() => _isJoined = true);
              if (_isHost) {
                _engine.startPreview(); // Important for host
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
            onRtcStats: (connection, stats) {
              setState(() => _count = stats.userCount);
            },
          ),
        );

        context.read<BroadcastDetailBloc>().add(
          BroadcastDetailEvent.join(
            engine: _engine,
            broadcast: widget.broadcast,
            user: me,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _leaveChannel();
    super.dispose();
  }

  Future<void> _leaveChannel() async {
    await AgoraService().leaveCurrent();
    await AgoraService().dispose();
    if (mounted) {
      context.read<BroadcastDetailBloc>().add(
        BroadcastDetailEvent.unsubscribe(broadcast: widget.broadcast),
      );
      context.router.popTop();
    }
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (context) => _isHost
      /* TODO: End broadcast via bloc + leave */
          ? EndLivestreamDialog(onYesPressed: _leaveChannel)
          : LeaveLivestreamDialog(onYesPressed: _leaveChannel),
    );
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
              case BroadcastLoaded(:final broadcast):
                if (broadcast.id == widget.broadcast.id) {
                  context.read<BroadcastBloc>().add(
                    BroadcastEvent.updated(broadcast: state.broadcast),
                  );
                }
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
        BlocListener<UserDetailBloc, UserDetailState>(
          listener: (context, state) {
            if (state is UserRetrieved) {
              //
            }
          },
        ),
      ],
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          _showExitDialog();
        },
        child: Scaffold(
          appBar: AppBar(
            leading: BroadcastPopUpMenu(broadcast: widget.broadcast),
            centerTitle: true,
            title: Text(
              widget.broadcast.title,
              style: TextStyle(overflow: TextOverflow.fade),
            ),
            actions: [
              TextButton(
                onPressed: _showExitDialog,
                child: Text(
                  _isHost ? 'End' : 'Leave',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(10.0),
              child: Text(widget.broadcast.description),
            ),
          ),
          body: isDeleted || !widget.broadcast.isActive
              ? Center(child: Text('This broadcast has been closed'))
              : !_isJoined
              ? BottomLoader()
              : _buildLiveStream(),
          bottomNavigationBar: !_isJoined
              ? SizedBox.shrink()
              : _buildHostControls(),
        ),
      ),
    );
  }

  Widget _buildLiveStream() {
    return Stack(
      children: [
        // Main video area
        Center(
          child: _isHost
              ? _localVideoView() // Host sees their own preview
              : _remoteVideoView(), // Audience sees host
        ),
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
    return const Center(
      child: Text('Waiting for host...', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildHostControls() {
    return BottomAppBar(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Mute
          IconButton(
            icon: Icon(_isMuted ? Icons.mic_off : Icons.mic),
            onPressed: () async {
              setState(() => _isMuted = !_isMuted);
              await _engine.muteLocalAudioStream(_isMuted);
            },
          ),
          // Camera switch (host only)
          if (_isHost)
            IconButton(
              icon: const Icon(Icons.flip_camera_ios),
              onPressed: () => _engine.switchCamera(),
            ),
          // Leave for audience
        ],
      ),
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
      button1Text: 'Yes',
      onButton1Pressed: () {
        context.router.popTop();
        onYesPressed();
      },
      button2Text: 'No',
      onButton2Pressed: () {
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
      button1Text: 'Yes',
      onButton1Pressed: () {
        context.router.popTop();
        onYesPressed();
      },
      button2Text: 'No',
      onButton2Pressed: () {
        context.router.popTop();
      },
    );
  }
}
