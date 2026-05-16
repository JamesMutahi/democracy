import 'package:cached_network_image/cached_network_image.dart';
import 'package:democracy/app/bloc/repository/api/api_repository.dart';
import 'package:democracy/app/bloc/services/agora_service.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus, WebSocketService;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/custom_bottom_sheet.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/no_results.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/chat/view/utils/chat_navigator.dart';
import 'package:democracy/meeting/bloc/listeners/listeners_bloc.dart';
import 'package:democracy/meeting/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meeting/bloc/participants/participants_bloc.dart';
import 'package:democracy/meeting/bloc/speaker_detail/speaker_detail_bloc.dart';
import 'package:democracy/meeting/bloc/speaker_requests/speaker_requests_bloc.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/meeting/models/speaker_request.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/utils/profile_navigator.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:democracy/user/view/widgets/user_tile.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

void navigateToMeetingDetail({
  required BuildContext context,
  required Meeting meeting,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => SpeakerDetailBloc(
          webSocketService: context.read<WebSocketService>(),
          apiRepository: context.read<APIRepository>(),
        ),
        child: MeetingDetail(meeting: meeting),
      ),
    ),
  );
}

class MeetingDetail extends StatefulWidget {
  const MeetingDetail({super.key, required this.meeting});

  final Meeting meeting;

  @override
  State<MeetingDetail> createState() => _MeetingDetailState();
}

class _MeetingDetailState extends State<MeetingDetail> {
  late Meeting _meeting = widget.meeting;
  late RtcEngine _engine;
  late int? _count = widget.meeting.participantsCount;
  bool _isJoined = false;
  int? _activeSpeaker;
  bool _hasRequestedToSpeak = false;
  bool isDeleted = false;

  // Reactively synced via Getters (Evaluated fresh on every UI rebuild)
  List<int> get _speakers => _meeting.speakers.map((s) => s.id).toList();
  List<int> get _muted => _meeting.muted;

  // User & Role Getters (Instantly react when _meeting changes)
  User get me => context.read<AuthBloc>().state.user!;
  bool get _isHost => me.id == _meeting.host.id;
  bool get _isCoHost => _meeting.coHosts.any((c) => c.id == me.id);
  bool get _isSpeaker => _meeting.speakers.any((s) => s.id == me.id);
  bool get _isMuted => _meeting.muted.any((id) => id == me.id);

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    await [Permission.microphone].request();

    await AgoraService().joinAudioMeeting(
      isBroadcaster: _isHost || _isCoHost || _isSpeaker,
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
                  setState(() {
                    _meeting = meeting;
                    _count = meeting.participantsCount;
                  });
                }
              case MeetingUpdated(:final meeting):
                if (meeting.id == _meeting.id) {
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
        BlocListener<ChatDetailBloc, ChatDetailState>(
          listener: (context, state) {
            if (state is ChatCreated) {
              navigateToChatDetail(context: context, chat: state.chat);
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
              case SpeakerDecision(:final userId):
                if (me.id == userId) {
                  setState(() => _hasRequestedToSpeak = false);
                  await _engine.setClientRole(
                    role: state.isApproved
                        ? ClientRoleType.clientRoleBroadcaster
                        : ClientRoleType.clientRoleAudience,
                  );
                }
              case MuteStatusChanged(:final isMuted):
                await _engine.muteLocalAudioStream(isMuted);
              case MuteCommand(:final userId, :final isMuted):
                await _engine.muteRemoteAudioStream(uid: userId, mute: isMuted);
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
          body: isDeleted || !_meeting.isActive
              ? Center(child: Text('This meeting has been closed'))
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Text(
                          _meeting.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SliverToBoxAdapter(child: Text(_meeting.description)),
                      !_isJoined
                          ? SliverToBoxAdapter(child: BottomLoader())
                          : _buildParticipantsList(),
                    ],
                  ),
                ),
          bottomNavigationBar: !_isJoined
              ? SizedBox.shrink()
              : _buildControls(),
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
        final user = _meeting.participants.toList()[index];
        bool isHost = user.id == _meeting.host.id;
        bool isCoHost = _meeting.coHosts.any((c) => c.id == user.id);
        bool isSpeaker = _meeting.speakers.any((s) => s.id == user.id);
        bool isMuted = _muted.contains(user.id);
        bool isSpeaking = _activeSpeaker == user.id && !isMuted;
        return _ParticipantTile(
          key: ValueKey(user.id),
          isSpeaking: isSpeaking,
          user: user,
          meeting: _meeting,
          isMuted: isMuted,
          isHost: isHost || isCoHost,
          isSpeaker: isSpeaker,
          engine: _engine,
        );
      }, childCount: _meeting.participants.length),
    );
  }

  Widget _buildControls() {
    return BottomAppBar(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton.filledTonal(
                  color: _isMuted ? Colors.red : null,
                  iconSize: 30,
                  icon: Icon(
                    _isHost || _isCoHost || _isSpeaker
                        ? _isMuted
                              ? Symbols.mic_off_rounded
                              : Symbols.mic_rounded
                        : Symbols.mic_off_rounded,
                  ),
                  onPressed: _isHost || _isCoHost || _isSpeaker
                      ? () async {
                          context.read<SpeakerDetailBloc>().add(
                            ChangeMuteStatus(
                              meeting: _meeting,
                              isMuted: !_isMuted,
                            ),
                          );
                        }
                      : _hasRequestedToSpeak
                      ? null
                      : () {
                          context.read<SpeakerDetailBloc>().add(
                            RequestToSpeak(meeting: _meeting),
                          );
                        },
                ),
                SizedBox(height: 5),
                Text(
                  _isHost || _isCoHost || _isSpeaker
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
                          meeting: _meeting,
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
                    builder: (_) => ShareBottomSheet(meeting: _meeting),
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

class _ParticipantTile extends StatelessWidget {
  const _ParticipantTile({
    super.key,
    required this.isSpeaking,
    required this.user,
    required this.meeting,
    required this.isMuted,
    required this.isHost,
    required this.isSpeaker,
    required this.engine,
  });

  final bool isSpeaking;
  final User user;
  final Meeting meeting;
  final bool isMuted;
  final bool isHost;
  final bool isSpeaker;
  final RtcEngine engine;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          builder: (_) => _Profile(
            meeting: meeting,
            user: user,
            engine: engine,
            isMuted: isMuted,
          ),
        );
      },
      child: Center(
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
                if (isHost)
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

class _Profile extends StatelessWidget {
  const _Profile({
    required this.meeting,
    required this.user,
    required this.engine,
    required this.isMuted,
  });

  final Meeting meeting;
  final User user;
  final RtcEngine engine;
  final bool isMuted;

  @override
  Widget build(BuildContext context) {
    double coverPhotoHeight = MediaQuery.of(context).size.height / 7;
    double profilePicHeight = MediaQuery.of(context).size.height / 10;

    return SafeArea(
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: coverPhotoHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      user.coverPhoto,
                      cacheKey: 'cover ${user.id}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Theme.of(context).disabledColor.withAlpha(30),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        context.read<ChatDetailBloc>().add(
                          ChatDetailEvent.create(user: user),
                        );
                      },
                      leading: Icon(Symbols.mail_rounded),
                      title: Text('Send Direct Message'),
                    ),
                    ListTile(
                      onTap: () async {
                        //   TODO:
                      },
                      leading: Icon(Symbols.close_rounded),
                      title: Text('Remove from speakers'),
                    ),
                    ListTile(
                      onTap: () {
                        context.read<SpeakerDetailBloc>().add(
                          MuteSpeaker(
                            meeting: meeting,
                            user: user,
                            isMuted: true,
                          ),
                        );
                      },
                      leading: Icon(
                        isMuted ? Symbols.mic_off_rounded : Symbols.mic_rounded,
                      ),
                      title: Text(
                        isMuted ? 'Unmute their mic' : 'Mute their mic',
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        //   TODO: Know when blocked
                        context.read<UserDetailBloc>().add(
                          UserDetailEvent.block(user: user),
                        );
                      },
                      leading: Icon(Symbols.block_rounded, color: Colors.red),
                      title: Text('Block', style: TextStyle(color: Colors.red)),
                    ),
                    ListTile(
                      onTap: () {
                        //   TODO:
                      },
                      leading: Icon(Symbols.report_rounded, color: Colors.red),
                      title: Text(
                        'Report',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: profilePicHeight,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: CircleAvatar(
                    radius: 42,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            user.image,
                            cacheKey: 'profile ${user.id}',
                          ),
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '@${user.username}',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
                    _AllTab(meeting: meeting),
                    if (isHost) _RequestsTab(meeting: meeting),
                    _SpeakersTab(meeting: meeting),
                    _ListenersTab(meeting: meeting),
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

class _AllTab extends StatefulWidget {
  const _AllTab({required this.meeting});

  final Meeting meeting;

  @override
  State<_AllTab> createState() => _AllTabState();
}

class _AllTabState extends State<_AllTab> with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<ParticipantsBloc>().add(
      ParticipantsEvent.get(meeting: widget.meeting),
    );
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ParticipantsBloc, ParticipantsState>(
      builder: (context, state) {
        final users = state.users.toList();

        if (state.status == ParticipantsStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == ParticipantsStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }
        return UsersListView(
          users: users,
          loading: state.status == ParticipantsStatus.initial,
          failure: state.users.isNotEmpty
              ? false
              : state.status == ParticipantsStatus.failure,
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: state.hasNext,
          showProfileButtons: true,
          onUsersUpdated: (users) {
            context.read<ParticipantsBloc>().add(
              ParticipantsEvent.update(users: users),
            );
          },
          onUserTap: (user) {
            navigateToProfilePage(context: context, user: user);
          },
          onRefresh: () {
            context.read<ParticipantsBloc>().add(
              ParticipantsEvent.get(meeting: widget.meeting),
            );
          },
          onLoading: () {
            context.read<ParticipantsBloc>().add(
              ParticipantsEvent.get(
                meeting: widget.meeting,
                lastUser: users.last,
              ),
            );
          },
          onFailure: () {
            context.read<ParticipantsBloc>().add(
              ParticipantsEvent.get(meeting: widget.meeting),
            );
          },
        );
      },
    );
  }
}

class _RequestsTab extends StatefulWidget {
  const _RequestsTab({required this.meeting});

  final Meeting meeting;

  @override
  State<_RequestsTab> createState() => _RequestsTabState();
}

class _RequestsTabState extends State<_RequestsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    _getRequests();
    super.initState();
  }

  void _getRequests() {
    context.read<SpeakerRequestsBloc>().add(
      SpeakerRequestsEvent.get(meeting: widget.meeting),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<SpeakerDetailBloc, SpeakerDetailState>(
      listener: (context, state) {
        if (state is SpeakerRequestCreated) {
          context.read<SpeakerRequestsBloc>().add(
            SpeakerRequestsEvent.add(request: state.request),
          );
        }
        if (state is SpeakerRequestUpdated) {
          context.read<SpeakerRequestsBloc>().add(
            SpeakerRequestsEvent.update(request: state.request),
          );
        }
        if (state is SpeakerRequestDeleted) {
          context.read<SpeakerRequestsBloc>().add(
            SpeakerRequestsEvent.remove(requestId: state.requestId),
          );
        }
      },
      child: BlocListener<WebsocketBloc, WebsocketState>(
        listener: (context, state) {
          if (state.status == WebsocketStatus.connected) {
            _getRequests();
          }
        },
        child: BlocBuilder<SpeakerRequestsBloc, SpeakerRequestsState>(
          builder: (context, state) {
            final requests = state.requests.toList();

            if (state.status == SpeakerRequestsStatus.initial ||
                (state.status == SpeakerRequestsStatus.loading &&
                    requests.isEmpty)) {
              return const BottomLoader();
            }

            if (state.status == SpeakerRequestsStatus.failure) {
              return FailureRetryButton(
                onPressed: () => context.read<SpeakerRequestsBloc>().add(
                  SpeakerRequestsEvent.get(meeting: widget.meeting),
                ),
              );
            }

            return requests.isEmpty
                ? NoResults(text: 'No requests')
                : ListView.builder(
                    itemCount: requests.length,
                    itemBuilder: (context, index) {
                      SpeakerRequest request = requests[index];
                      return ListTile(
                        key: ValueKey(request),
                        leading: ProfileImage(user: request.user),
                        title: Text(
                          request.user.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          '@${request.user.username}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                        trailing: request.isApproved == null
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton.outlined(
                                    onPressed: () {
                                      _handleRequest(request, true);
                                    },
                                    icon: Icon(Icons.check),
                                    color: Colors.green,
                                    style: IconButton.styleFrom(
                                      side: BorderSide(color: Colors.green),
                                    ),
                                  ),
                                  IconButton.outlined(
                                    onPressed: () {
                                      _handleRequest(request, false);
                                    },
                                    icon: Icon(Icons.close_rounded),
                                    color: Colors.red,
                                    style: IconButton.styleFrom(
                                      side: const BorderSide(color: Colors.red),
                                    ),
                                  ),
                                ],
                              )
                            : request.isApproved!
                            ? Text(
                                'Approved',
                                style: TextStyle(color: Colors.blue),
                              )
                            : Text(
                                'Declined',
                                style: TextStyle(color: Colors.red),
                              ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }

  void _handleRequest(SpeakerRequest request, bool isApproved) {
    context.read<SpeakerDetailBloc>().add(
      HandleSpeakerRequest(request: request, isApproved: isApproved),
    );
  }
}

class _SpeakersTab extends StatefulWidget {
  const _SpeakersTab({required this.meeting});

  final Meeting meeting;

  @override
  State<_SpeakersTab> createState() => _SpeakersTabState();
}

class _SpeakersTabState extends State<_SpeakersTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final me = context.read<AuthBloc>().state.user!;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: UserTile(
            user: widget.meeting.host,
            me: me,
            showProfileButtons: true,
            selectedUsers: [],
            onTap: () {
              navigateToProfilePage(
                context: context,
                user: widget.meeting.host,
              );
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((
            BuildContext context,
            int index,
          ) {
            User user = widget.meeting.coHosts[index];
            return UserTile(
              user: user,
              me: me,
              showProfileButtons: true,
              selectedUsers: [],
              onTap: () {
                navigateToProfilePage(context: context, user: user);
              },
            );
          }, childCount: widget.meeting.coHosts.length),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((
            BuildContext context,
            int index,
          ) {
            User user = widget.meeting.speakers[index];
            return UserTile(
              user: user,
              me: me,
              showProfileButtons: true,
              selectedUsers: [],
              onTap: () {
                navigateToProfilePage(context: context, user: user);
              },
            );
          }, childCount: widget.meeting.speakers.length),
        ),
      ],
    );
  }
}

class _ListenersTab extends StatefulWidget {
  const _ListenersTab({required this.meeting});

  final Meeting meeting;

  @override
  State<_ListenersTab> createState() => _ListenersTabState();
}

class _ListenersTabState extends State<_ListenersTab>
    with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<ListenersBloc>().add(
      ListenersEvent.get(meeting: widget.meeting),
    );
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ListenersBloc, ListenersState>(
      builder: (context, state) {
        final users = state.users.toList();

        if (state.status == ListenersStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == ListenersStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }
        return UsersListView(
          users: users,
          loading: state.status == ListenersStatus.initial,
          failure: state.users.isNotEmpty
              ? false
              : state.status == ListenersStatus.failure,
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: state.hasNext,
          emptyListText: 'No listeners',
          showProfileButtons: true,
          onUsersUpdated: (users) {
            context.read<ListenersBloc>().add(
              ListenersEvent.update(users: users),
            );
          },
          onUserTap: (user) {
            navigateToProfilePage(context: context, user: user);
          },
          onRefresh: () {
            context.read<ListenersBloc>().add(
              ListenersEvent.get(meeting: widget.meeting),
            );
          },
          onLoading: () {
            context.read<ListenersBloc>().add(
              ListenersEvent.get(meeting: widget.meeting, lastUser: users.last),
            );
          },
          onFailure: () {
            context.read<ListenersBloc>().add(
              ListenersEvent.get(meeting: widget.meeting),
            );
          },
        );
      },
    );
  }
}
