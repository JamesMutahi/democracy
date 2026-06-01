import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/repository/api/api_repository.dart';
import 'package:democracy/app/bloc/services/agora_service.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/custom_bottom_sheet.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/meeting/bloc/listeners/listeners_bloc.dart';
import 'package:democracy/meeting/bloc/meeting/meeting_bloc.dart';
import 'package:democracy/meeting/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meeting/bloc/participants/participants_bloc.dart';
import 'package:democracy/meeting/bloc/speaker_detail/speaker_detail_bloc.dart';
import 'package:democracy/meeting/bloc/speaker_requests/speaker_requests_bloc.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/meeting/view/widgets/participant/tile.dart';
import 'package:democracy/meeting/view/widgets/participant/tabs/index.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class MeetingDetail extends StatelessWidget {
  const MeetingDetail({super.key, @PathParam('id') required this.meetingId});

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
          return _MeetingDetail(meeting: state.meeting!);
        },
      ),
    );
  }
}

class _MeetingDetail extends StatefulWidget {
  const _MeetingDetail({required this.meeting});

  final Meeting meeting;

  @override
  State<_MeetingDetail> createState() => _MeetingDetailState();
}

class _MeetingDetailState extends State<_MeetingDetail> {
  late RtcEngine _engine;
  late int? _count = widget.meeting.participantsCount;
  bool _isJoined = false;
  int? _activeSpeaker;
  bool _hasRequestedToSpeak = false;
  bool isDeleted = false;

  // Reactively synced via Getters (Evaluated fresh on every UI rebuild)
  List<int> get _speakers => widget.meeting.speakers.map((s) => s.id).toList();
  List<int> get _muted => widget.meeting.muted;

  // User & Role Getters (Instantly react when _meeting changes)
  User get me => context.read<AuthBloc>().state.user!;
  bool get _isHost => me.id == widget.meeting.host.id;
  bool get _isCoHost => widget.meeting.coHosts.any((c) => c.id == me.id);
  bool get _isSpeaker => widget.meeting.speakers.any((s) => s.id == me.id);
  bool get _isMuted => widget.meeting.muted.any((id) => id == me.id);

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    await [Permission.microphone].request();

    await AgoraService().joinAudioMeeting(
      isBroadcaster: _isHost || _isCoHost || _isSpeaker,
      meeting: widget.meeting,
      onEngineReady: (engine) {
        setState(() {
          _engine = engine;
        });

        _engine.registerEventHandler(
          RtcEngineEventHandler(
            onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
              setState(() => _isJoined = true);
              context.read<MeetingDetailBloc>().add(
                MeetingDetailEvent.subscribe(
                  meeting: widget.meeting,
                  isMuted: _isHost || _isCoHost || _isSpeaker,
                ),
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
                  if (reason ==
                      UserOfflineReasonType.userOfflineBecomeAudience) {
                    setState(() => _speakers.remove(uid));
                  }
                  //
                },
            onActiveSpeaker: (RtcConnection connection, int uid) {
              setState(() => _activeSpeaker = uid);
            },
            onUserMuteAudio: (RtcConnection connection, int uid, bool muted) {
              //
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
                    //
                  } else if (reason ==
                      RemoteAudioStateReason.remoteAudioReasonRemoteUnmuted) {
                    //
                  }
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
    return BlocProvider(
      create: (context) => SpeakerDetailBloc(
        webSocketService: context.read<WebSocketService>(),
        apiRepository: context.read<APIRepository>(),
      ),
      child: MultiBlocListener(
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
            listener: (context, state) async {
              switch (state) {
                case MeetingLoaded(:final meeting):
                  if (meeting.id == widget.meeting.id) {
                    context.read<MeetingBloc>().add(
                      MeetingEvent.updated(meeting: state.meeting),
                    );
                    setState(() {
                      _count = meeting.participantsCount;
                    });
                  }
                case MeetingUpdated(:final meeting):
                  if (meeting.id == widget.meeting.id) {
                    final isCoHost = state.meeting.coHosts.any(
                      (c) => c.id == me.id,
                    );
                    final isSpeaker = state.meeting.speakers.any(
                      (s) => s.id == me.id,
                    );
                    final isNewCoHost =
                        (isCoHost == true) && (_isCoHost == false);
                    final isNewSpeaker =
                        (isSpeaker == true) && (_isSpeaker == false);
                    final isBroadcaster = isCoHost || isSpeaker;
                    if (isBroadcaster != (_isCoHost || _isSpeaker)) {
                      await _engine.setClientRole(
                        role: isBroadcaster
                            ? ClientRoleType.clientRoleBroadcaster
                            : ClientRoleType.clientRoleAudience,
                      );
                    }
                    final isMuted = state.meeting.muted.any((m) => m == me.id);
                    if (isMuted && !_isMuted) {
                      await _engine.muteLocalAudioStream(isMuted);
                    }

                    if (context.mounted) {
                      context.read<MeetingBloc>().add(
                        MeetingEvent.updated(meeting: state.meeting),
                      );
                    }

                    if (isNewCoHost || isNewSpeaker) {
                      String message = 'You are now a co-host';
                      if (isNewSpeaker) message = 'You are now a speaker';
                      if (context.mounted) {
                        final snackBar = getSnackBar(
                          context: context,
                          message: message,
                          status: SnackBarStatus.info,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
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
          BlocListener<ChatDetailBloc, ChatDetailState>(
            listener: (context, state) {
              if (state is ChatCreated) {
                context.router.push(ChatDetail(chatId: state.chat.id));
              }
            },
          ),
          BlocListener<SpeakerDetailBloc, SpeakerDetailState>(
            listener: (context, state) async {
              switch (state) {
                case RequestedToSpeak():
                  setState(() => _hasRequestedToSpeak = true);
                case SpeakerRequestCreated(:final request):
                  if (_isHost || _isCoHost) {
                    final snackBar = getSnackBar(
                      context: context,
                      message: '${request.user.name} requests to speak',
                      status: SnackBarStatus.info,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                case SpeakerRequestUpdated(:final request):
                  if (request.user.id == me.id && request.isApproved != null) {
                    setState(() => _hasRequestedToSpeak = false);
                    await _engine.setClientRole(
                      role: request.isApproved!
                          ? ClientRoleType.clientRoleBroadcaster
                          : ClientRoleType.clientRoleAudience,
                    );
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
              leading: IconButton(
                onPressed: () {
                  //  TODO: Minimize
                },
                icon: Icon(Icons.keyboard_arrow_down_rounded),
              ),
              actions: [
                TextButton(
                  onPressed: _showExitDialog,
                  child: Text('Leave', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
            body: isDeleted || !widget.meeting.isActive
                ? Center(child: Text('This meeting has been closed'))
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Text(
                            widget.meeting.title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Text(widget.meeting.description),
                        ),
                        !_isJoined
                            ? SliverToBoxAdapter(child: BottomLoader())
                            : _buildParticipantsList(),
                      ],
                    ),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniStartFloat,
            floatingActionButton: _isJoined && (_isHost || _isCoHost)
                ? FilledButton.tonal(
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      context.read<SpeakerDetailBloc>().add(
                        MuteEveryone(meeting: widget.meeting),
                      );
                    },
                    child: Text('Mute everyone'),
                  )
                : null,
            bottomNavigationBar: _buildControls(),
          ),
        ),
      ),
    );
  }

  Widget _buildParticipantsList() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 0.6,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final user = widget.meeting.participants.toList()[index];
        bool isHost = user.id == widget.meeting.host.id;
        bool isCoHost = widget.meeting.coHosts.any((c) => c.id == user.id);
        bool isSpeaker = widget.meeting.speakers.any((s) => s.id == user.id);
        bool isMuted = _muted.contains(user.id);
        bool isSpeaking = _activeSpeaker == user.id && !isMuted;
        return ParticipantTile(
          key: ValueKey(user.id),
          me: me,
          user: user,
          engine: _engine,
          meeting: widget.meeting,
          canManageCoHosts: _isHost,
          canManageSpeakers: _isHost || _isCoHost,
          isMuted: isMuted,
          isHost: isHost,
          isCoHost: isCoHost,
          isSpeaker: isSpeaker,
          isSpeaking: isSpeaking,
        );
      }, childCount: widget.meeting.participants.length),
    );
  }

  Widget _buildControls() {
    bool isBroadcaster = _isHost || _isCoHost || _isSpeaker;
    return BottomAppBar(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: !_isJoined
          ? SizedBox.shrink()
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton.filledTonal(
                        padding: EdgeInsets.all(10),
                        color: isBroadcaster
                            ? _isMuted
                                  ? Colors.red
                                  : Colors.green
                            : Colors.amber,
                        iconSize: 30,
                        icon: Icon(
                          isBroadcaster
                              ? _isMuted
                                    ? Symbols.mic_off_rounded
                                    : Symbols.mic_rounded
                              : Symbols.mic_rounded,
                          fill: isBroadcaster
                              ? _isMuted
                                    ? 0
                                    : 1
                              : 0,
                        ),
                        onPressed: isBroadcaster
                            ? () async {
                                context.read<SpeakerDetailBloc>().add(
                                  ChangeMuteStatus(
                                    meeting: widget.meeting,
                                    isMuted: !_isMuted,
                                  ),
                                );
                              }
                            : _hasRequestedToSpeak
                            ? null
                            : () {
                                context.read<SpeakerDetailBloc>().add(
                                  RequestToSpeak(meeting: widget.meeting),
                                );
                              },
                      ),
                      SizedBox(height: 5),
                      Text(
                        isBroadcaster
                            ? _isMuted
                                  ? 'Mic is off'
                                  : 'Mic is on'
                            : _hasRequestedToSpeak
                            ? 'Requested'
                            : 'Request',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton.filledTonal(
                      iconSize: 20,
                      icon: Icon(Symbols.people_rounded),
                      onPressed: () {
                        final bloc = context.read<SpeakerDetailBloc>();
                        showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          builder: (_) => BlocProvider.value(
                            value: bloc,
                            child: MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (context) => ParticipantsBloc(
                                    webSocketService: context
                                        .read<WebSocketService>(),
                                  ),
                                ),
                                BlocProvider(
                                  create: (context) => ListenersBloc(
                                    webSocketService: context
                                        .read<WebSocketService>(),
                                  ),
                                ),
                              ],
                              child: _ParticipantsBottomSheet(
                                meeting: widget.meeting,
                                isHost: _isHost || _isCoHost,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 10),
                    IconButton.filledTonal(
                      iconSize: 20,
                      icon: Icon(Symbols.share_rounded),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          builder: (_) =>
                              ShareBottomSheet(meeting: widget.meeting),
                        );
                      },
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

const List<Tab> tabs = <Tab>[
  Tab(text: 'All'),
  Tab(text: 'Speakers'),
  Tab(text: 'Listeners'),
];

const List<Tab> hostTabs = <Tab>[
  Tab(text: 'All'),
  Tab(text: 'Requests'),
  Tab(text: 'Speakers'),
  Tab(text: 'Listeners'),
];

class _ParticipantsBottomSheet extends StatelessWidget {
  const _ParticipantsBottomSheet({required this.meeting, required this.isHost});

  final Meeting meeting;
  final bool isHost;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpeakerRequestsBloc(
        webSocketService: context.read<WebSocketService>(),
      ),
      child: DefaultTabController(
        length: isHost ? hostTabs.length : tabs.length,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              CustomSearchBar(hintText: 'Search'),
              TabBar(isScrollable: false, tabs: isHost ? hostTabs : tabs),
              Expanded(
                child: TabBarView(
                  children: [
                    AllTab(meeting: meeting),
                    if (isHost) RequestsTab(meeting: meeting),
                    SpeakersTab(meeting: meeting),
                    ListenersTab(meeting: meeting),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
