import 'package:democracy/app/bloc/services/agora_service.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/meeting/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/meeting/view/widgets/meeting_pop_up_menu.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

void navigateToLiveStream({
  required BuildContext context,
  required Meeting meeting,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LiveStream(meeting: meeting)),
  );
}

class LiveStream extends StatefulWidget {
  const LiveStream({super.key, required this.meeting});

  final Meeting meeting;

  @override
  State<LiveStream> createState() => _LiveStreamState();
}

class _LiveStreamState extends State<LiveStream> {
  late Meeting _meeting = widget.meeting;
  bool isDeleted = false;
  late RtcEngine _engine;
  bool _isJoined = false;
  bool _isMuted = false;
  late User me = context.read<AuthBloc>().state.user!;
  late final bool _isHost = me.id == _meeting.host.id;

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
      meeting: _meeting,
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
                MeetingDetailEvent.subscribe(meeting: _meeting),
              );
            },
            onUserJoined: (RtcConnection connection, int uid, int elapsed) {
              // Primarily tracks broadcasters
              setState(() {
                _remoteUids.add(uid);
                if (_meeting.host.id == uid) {
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
          MeetingDetailEvent.join(engine: _engine, meeting: _meeting, user: me),
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
        MeetingDetailEvent.unsubscribe(meeting: _meeting),
      );
      Navigator.pop(context);
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
                MeetingDetailEvent.subscribe(meeting: widget.meeting),
              );
            }
          },
        ),
        BlocListener<MeetingDetailBloc, MeetingDetailState>(
          listener: (context, state) {
            switch (state) {
              case MeetingLoaded(:final meeting):
                if (meeting.id == _meeting.id) {
                  setState(() => _meeting = meeting);
                }
              case MeetingUpdated():
                if (state.meeting.id == _meeting.id) {
                  setState(() => _meeting = state.meeting);
                }
              case MeetingDeleted(:final meetingId):
                if (meetingId == _meeting.id) {
                  setState(() => isDeleted = true);
                }
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
            leading: MeetingPopUpMenu(meeting: _meeting),
            centerTitle: true,
            title: Text(
              _meeting.title,
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
              child: Text(_meeting.description),
            ),
          ),
          body: isDeleted || !_meeting.isActive
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
          connection: RtcConnection(channelId: _meeting.id.toString()),
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
        Navigator.pop(context);
        onYesPressed();
      },
      button2Text: 'No',
      onButton2Pressed: () {
        Navigator.pop(context);
      },
    );
  }
}
