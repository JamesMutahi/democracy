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
import 'package:democracy/meeting/bloc/meeting/meeting_bloc.dart';
import 'package:democracy/meeting/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/meeting/view/widgets/meeting_pop_up_menu.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class LiveStream extends StatelessWidget {
  const LiveStream({super.key, @PathParam('id') required this.meetingId});

  final int meetingId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MeetingBloc(webSocketService: context.read<WebSocketService>())
            ..add(MeetingEvent.load(meetingId: meetingId)),
      child: BlocBuilder<MeetingBloc, MeetingState>(
        buildWhen: (previous, current) => current.meetingId == meetingId,
        builder: (context, state) {
          if (state.status == MeetingStatus.initial ||
              (state.status == MeetingStatus.loading &&
                  state.meeting == null)) {
            return BottomLoader();
          }
          if (state.status == MeetingStatus.failure && state.meeting == null) {
            return FailureRetryButton(
              onPressed: () {
                context.read<MeetingBloc>().add(
                  MeetingEvent.load(meetingId: meetingId),
                );
              },
            );
          }
          return _LiveStream(meeting: state.meeting!);
        },
      ),
    );
  }
}

class _LiveStream extends StatefulWidget {
  const _LiveStream({required this.meeting});

  final Meeting meeting;

  @override
  State<_LiveStream> createState() => _LiveStreamState();
}

class _LiveStreamState extends State<_LiveStream> {
  bool isDeleted = false;
  late RtcEngine _engine;
  bool _isJoined = false;
  bool _isMuted = false;
  late User me = context.read<AuthBloc>().state.user!;
  late final bool _isHost = me.id == widget.meeting.host.id;

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
      meeting: widget.meeting,
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
              context.read<MeetingDetailBloc>().add(
                MeetingDetailEvent.subscribe(
                  meeting: widget.meeting,
                  isMuted: false,
                ),
              );
            },
            onUserJoined: (RtcConnection connection, int uid, int elapsed) {
              // Primarily tracks broadcasters
              setState(() {
                _remoteUids.add(uid);
                if (widget.meeting.host.id == uid) {
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

        context.read<MeetingDetailBloc>().add(
          MeetingDetailEvent.join(
            engine: _engine,
            meeting: widget.meeting,
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
      context.read<MeetingDetailBloc>().add(
        MeetingDetailEvent.unsubscribe(meeting: widget.meeting),
      );
      context.router.popTop();
    }
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (context) => ExitMeetingDialog(onYesPressed: _leaveChannel),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<MeetingDetailBloc>().add(
                MeetingDetailEvent.subscribe(
                  meeting: widget.meeting,
                  isMuted: _isMuted,
                ),
              );
            }
          },
        ),
        BlocListener<MeetingDetailBloc, MeetingDetailState>(
          listener: (context, state) {
            switch (state) {
              case MeetingLoaded(:final meeting):
                if (meeting.id == widget.meeting.id) {
                  context.read<MeetingBloc>().add(
                    MeetingEvent.updated(meeting: state.meeting),
                  );
                }
              case MeetingUpdated():
                if (state.meeting.id == widget.meeting.id) {
                  context.read<MeetingBloc>().add(
                    MeetingEvent.updated(meeting: state.meeting),
                  );
                }
              case MeetingDeleted(:final meetingId):
                if (meetingId == widget.meeting.id) {
                  setState(() => isDeleted = true);
                }
              case MeetingDetailFailure(:final error):
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
            leading: MeetingPopUpMenu(meeting: widget.meeting),
            centerTitle: true,
            title: Text(
              widget.meeting.title,
              style: TextStyle(overflow: TextOverflow.fade),
            ),
            actions: [
              TextButton(
                onPressed: _showExitDialog,
                child: Text('Leave', style: TextStyle(color: Colors.red)),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(10.0),
              child: Text(widget.meeting.description),
            ),
          ),
          body: isDeleted || !widget.meeting.isActive
              ? Center(child: Text('This meeting has been closed'))
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
          connection: RtcConnection(channelId: widget.meeting.id.toString()),
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
          // End stream (host)
          if (_isHost)
            IconButton(
              icon: const Icon(Icons.call_end, color: Colors.red),
              onPressed: () {
                /* TODO: End meeting via bloc + leave */
              },
            ),
          // Leave for audience
        ],
      ),
    );
  }
}

class ExitMeetingDialog extends StatelessWidget {
  const ExitMeetingDialog({super.key, required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Leave meeting',
      content: 'Are you sure you want to leave the meeting?',
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
