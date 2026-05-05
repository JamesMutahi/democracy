import 'package:democracy/app/bloc/services/agora_service.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/core/app_logger.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/meeting/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/meeting/view/widgets/meeting_pop_up_menu.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late int? _count = _meeting.participantsCount;
  List<int> _speakers = [];
  List<int> _muted = [];
  int? _activeSpeaker; // TODO: Highlight
  late User me = context.read<AuthBloc>().state.user!;
  late final bool _isHost = me.id == _meeting.host.id;
  late final bool _isSpeaker = _meeting.speakers.any((s) => s.id == me.id);
  bool _hasRaisedHand = false;

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  void _updateMuteList(int uid, bool isMuted) {
    setState(() {
      if (isMuted) {
        _muted.add(uid);
      } else {
        _muted.remove(uid);
      }
    });
  }

  Future<void> _initAgora() async {
    await [Permission.microphone].request();

    await AgoraService().joinAudioMeeting(
      isBroadcaster: _isHost || _isSpeaker,
      meeting: _meeting,
      onEngineReady: (engine) {
        setState(() {
          _engine = engine;
        });

        _engine.registerEventHandler(
          RtcEngineEventHandler(
            onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
              setState(() => _isJoined = true);
              context.read<MeetingDetailBloc>().add(
                MeetingDetailEvent.subscribe(meeting: widget.meeting),
              );
            },
            onRtcStats: (connection, stats) {
              setState(() => _count = stats.userCount);
            },
            onUserJoined: (RtcConnection connection, int uid, int elapsed) {
              //
            },
            onUserOffline:
                (
                  RtcConnection connection,
                  int uid,
                  UserOfflineReasonType reason,
                ) {
                  setState(() {
                    _muted.remove(uid); // Clean up the mute list
                  });
                },
            onActiveSpeaker: (RtcConnection connection, int uid) {
              setState(() => _activeSpeaker = uid);
            },
            onUserMuteAudio: (RtcConnection connection, int uid, bool muted) {
              _updateMuteList(uid, muted);
            },
            onRemoteAudioStateChanged:
                (
                  RtcConnection connection,
                  int uid,
                  RemoteAudioState state,
                  RemoteAudioStateReason reason,
                  int elapsed,
                ) {
                  // Catching states that onUserMuteAudio might miss
                  if (reason ==
                      RemoteAudioStateReason.remoteAudioReasonRemoteMuted) {
                    _updateMuteList(uid, true);
                  } else if (reason ==
                      RemoteAudioStateReason.remoteAudioReasonRemoteUnmuted) {
                    _updateMuteList(uid, false);
                  }
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

  // Raise Hand Request (send via your Django Channels or Agora RTM)
  void _toggleRaiseHand() {
    setState(() => _hasRaisedHand = !_hasRaisedHand);
    // TODO: Send request to host via WebSocket
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_hasRaisedHand ? "Hand raised ✓" : "Hand lowered"),
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
              case MeetingLoaded(:final meeting):
                if (meeting.id == _meeting.id) {
                  for (var p in state.meeting.participants) {
                    AppLogger.info(p.name);
                  }
                  setState(() {
                    _meeting = meeting;
                  });
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
              : _buildParticipantsList(),
          bottomNavigationBar: !_isJoined
              ? SizedBox.shrink()
              : _buildControls(),
        ),
      ),
    );
  }

  Widget _buildParticipantsList() {
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: _meeting.participants.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        final user = _meeting.participants.toList()[index];
        bool isHost = user.id == _meeting.host.id;
        bool isSpeaker = _meeting.speakers.any((s) => s.id == user.id);
        bool isMuted = _muted.contains(user.id);
        bool isSpeaking = _activeSpeaker == user.id && !isMuted;
        return _ParticipantTile(
          key: ValueKey(user.id),
          isSpeaking: isSpeaking,
          user: user,
          meeting: _meeting,
          isMuted: isMuted,
          isHost: isHost,
          isSpeaker: isSpeaker,
        );
      },
    );
  }

  Widget _buildControls() {
    return BottomAppBar(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Mute Button
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.filledTonal(
                color: _isMuted ? Colors.red : null,
                iconSize: 20,
                icon: Icon(_isMuted ? Icons.mic_off : Icons.mic),
                onPressed: () async {
                  setState(() => _isMuted = !_isMuted);
                  await _engine.muteLocalAudioStream(_isMuted);
                },
              ),
              Text(
                _isMuted ? ' Mic is off ' : ' Mic is on  ',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          if (!_isHost && !_meeting.speakers.contains(me))
            Row(
              children: [
                IconButton.filledTonal(
                  iconSize: 20,
                  icon: Icon(
                    _hasRaisedHand ? Icons.pan_tool : Icons.pan_tool_outlined,
                  ),
                  onPressed: _toggleRaiseHand,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _ParticipantTile extends StatelessWidget {
  const _ParticipantTile({
    super.key,
    required this.isSpeaking,
    required this.user,
    required Meeting meeting,
    required this.isMuted,
    required this.isHost,
    required this.isSpeaker,
  }) : _meeting = meeting;

  final bool isSpeaking;
  final User user;
  final Meeting _meeting;
  final bool isMuted;
  final bool isHost;
  final bool isSpeaker;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 42,
            backgroundColor: isSpeaking ? Colors.blue : Colors.transparent,
            child: ProfileImage(user: user, radius: 40),
          ),
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
                    isMuted ? Icons.mic_off_rounded : Icons.mic_rounded,
                    color: isMuted ? Colors.red : Colors.blue,
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
