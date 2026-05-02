import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/meeting/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meeting/bloc/meeting_join/meeting_join_bloc.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

class MeetingDetail extends StatefulWidget {
  const MeetingDetail({super.key, required this.meeting});

  final Meeting meeting;

  @override
  State<MeetingDetail> createState() => _MeetingDetailState();
}

class _MeetingDetailState extends State<MeetingDetail> {
  late Meeting _meeting = widget.meeting;
  bool isDeleted = false;
  late RtcEngine _engine;
  bool _isJoined = false;
  bool _isMuted = false;
  List<int> _speakers = [];
  int? _activeSpeaker; // TODO: Highlight speaker/host
  late bool isHost =
      context.read<AuthBloc>().state.user?.id == _meeting.host.id;

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    await [Permission.microphone].request();

    _engine = createAgoraRtcEngine();
    await _engine.initialize(RtcEngineContext(appId: dotenv.env['AGORA_ID']));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          setState(() => _isJoined = true);
          context.read<MeetingDetailBloc>().add(
            MeetingDetailEvent.subscribe(meeting: widget.meeting),
          );
        },
        onUserJoined: (RtcConnection connection, int uid, int elapsed) {
          setState(() => _speakers.add(uid));
        },
        onUserOffline:
            (RtcConnection connection, int uid, UserOfflineReasonType reason) {
              setState(() => _speakers.remove(uid));
            },
        onActiveSpeaker: (RtcConnection connection, int uid) {
          setState(() => _activeSpeaker = uid);
        },
        onUserMuteAudio: (RtcConnection connection, int uid, muted) {},
      ),
    );

    await _engine.enableAudio();
    await _engine.setChannelProfile(
      ChannelProfileType.channelProfileLiveBroadcasting,
    );
    await _engine.setClientRole(
      role: isHost
          ? ClientRoleType.clientRoleBroadcaster
          : ClientRoleType.clientRoleAudience,
    );
    if (mounted) {
      context.read<MeetingJoinBloc>().add(
        MeetingJoinEvent.join(
          engine: _engine,
          meeting: _meeting,
          user: context.read<AuthBloc>().state.user!,
        ),
      );
    }
  }

  @override
  void dispose() {
    _engine.leaveChannel();
    _engine.release();
    super.dispose();
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (context) => ExitMeetingDialog(
        onYesPressed: () {
          context.read<MeetingDetailBloc>().add(
            MeetingDetailEvent.leave(meeting: _meeting),
          );
          Navigator.pop(context);
        },
      ),
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
              case MeetingUpdated(:final meeting):
                if (meeting.id == _meeting.id) {
                  setState(() {
                    _meeting = meeting;
                  });
                }
              case MeetingDeleted(:final meetingId):
                if (meetingId == _meeting.id) {
                  setState(() {
                    isDeleted = true;
                  });
                }
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
            automaticallyImplyLeading: false,
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
              : Column(children: [_buildParticipantsList(), _buildControls()]),
        ),
      ),
    );
  }

  Widget _buildParticipantsList() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: _meeting.listeners.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          final user = _meeting.listeners[index];
          bool isHost = user.id == _meeting.host.id;
          bool isSpeaker = _meeting.speakers.any((s) => s.id == user.id);
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileImage(user: user, radius: 40),
                SizedBox(height: 5),
                ProfileName(user: user),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (user.id == _meeting.host.id)
                      Container(
                        margin: EdgeInsets.only(right: 2),
                        child: Icon(
                          _speakers.contains(user.id)
                              ? Icons.mic_rounded
                              : Icons.mic_off_rounded,
                          color: _speakers.contains(user.id)
                              ? Colors.green
                              : Colors.red,
                          size: 17,
                        ),
                      ),
                    Text(
                      isHost
                          ? "Host"
                          : isSpeaker
                          ? "Speaker"
                          : "Listener",
                      style: TextStyle(color: Theme.of(context).disabledColor),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildControls() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(_isMuted ? Icons.mic_off : Icons.mic),
            onPressed: () async {
              setState(() => _isMuted = !_isMuted);
              await _engine.muteLocalAudioStream(_isMuted);
            },
          ),
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
