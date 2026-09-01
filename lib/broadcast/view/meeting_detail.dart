import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/agora_service.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/share_bottom_sheet.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/broadcast/bloc/broadcast_view/broadcast_view_cubit.dart';
import 'package:democracy/broadcast/bloc/comments/comments_bloc.dart';
import 'package:democracy/broadcast/bloc/speaking_indicator/speaking_indicator_bloc.dart';
import 'package:democracy/broadcast/models/speaker_invite.dart';
import 'package:democracy/broadcast/view/widgets/comments.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/broadcast/bloc/listeners/listeners_bloc.dart';
import 'package:democracy/broadcast/bloc/broadcast/broadcast_bloc.dart';
import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/broadcast/bloc/participants/participants_bloc.dart';
import 'package:democracy/broadcast/bloc/speaker_detail/speaker_detail_bloc.dart';
import 'package:democracy/broadcast/bloc/speaker_requests/speaker_requests_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/view/widgets/participant/tile.dart';
import 'package:democracy/broadcast/view/widgets/participant/tabs/index.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class MeetingDetail extends StatelessWidget {
  const MeetingDetail({super.key, @PathParam('id') required this.broadcastId});

  final int broadcastId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BroadcastBloc(webSocketService: context.read<WebSocketService>())
                ..add(BroadcastEvent.load(broadcastId: broadcastId)),
        ),
        BlocProvider(
          create: (context) =>
              CommentsBloc(webSocketService: context.read<WebSocketService>()),
        ),
        BlocProvider(create: (_) => SpeakingIndicatorBloc()),
      ],
      child: Scaffold(
        body: BlocBuilder<BroadcastBloc, BroadcastState>(
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

            if (!state.broadcast!.isActive || state.broadcast!.hasEnded) {
              return Center(child: Text('This meeting has been closed'));
            }

            return _MeetingDetail(broadcast: state.broadcast!);
          },
        ),
      ),
    );
  }
}

class _MeetingDetail extends StatefulWidget {
  const _MeetingDetail({required this.broadcast});

  final Broadcast broadcast;

  @override
  State<_MeetingDetail> createState() => _MeetingDetailState();
}

class _MeetingDetailState extends State<_MeetingDetail> {
  final AgoraService agoraService = AgoraService();
  late RtcEngine _engine;
  bool _isJoined = false;
  bool _hasRequestedToSpeak = false;
  bool isDeleted = false;

  // Reactively synced via Getters (Evaluated fresh on every UI rebuild)
  List<int> get _muted => widget.broadcast.muted;

  // User & Role Getters (Instantly react when _broadcast changes)
  User get me => context.read<AuthBloc>().state.user!;
  bool get _isHost => me.id == widget.broadcast.host.id;
  bool get _isCoHost => widget.broadcast.coHosts.any((c) => c.id == me.id);
  bool get _isSpeaker => widget.broadcast.speakers.any((s) => s.id == me.id);
  bool get _isMuted => widget.broadcast.muted.any((id) => id == me.id);

  @override
  void initState() {
    super.initState();
    if (agoraService.currentBroadcast == widget.broadcast.id) {
      _subscribe();
      setState(() => _isJoined = true);
    } else {
      _initAgora();
    }
  }

  void _minimize() {
    context.read<BroadcastViewCubit>().minimized(broadcast: widget.broadcast);

    // Navigate away. The widget will dispose, but the Singleton engine survives.
    context.router.popTop();
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
          listener: (context, state) async {
            switch (state) {
              case BroadcastUpdated(:final broadcast):
                if (broadcast.id == widget.broadcast.id) {
                  final isCoHost = state.broadcast.coHosts.any(
                    (c) => c.id == me.id,
                  );
                  final isSpeaker = state.broadcast.speakers.any(
                    (s) => s.id == me.id,
                  );
                  final isNewCoHost = isCoHost && !_isCoHost;
                  final isNewSpeaker = isSpeaker && !_isSpeaker;
                  if (!_isHost) {
                    final wasBroadcaster = _isCoHost || _isSpeaker;
                    final isBroadcaster = isCoHost || isSpeaker;
                    if (isBroadcaster != wasBroadcaster) {
                      if (!isBroadcaster) {
                        await _engine.muteLocalAudioStream(true);
                      }
                      await _engine.setClientRole(
                        role: isBroadcaster
                            ? ClientRoleType.clientRoleBroadcaster
                            : ClientRoleType.clientRoleAudience,
                      );
                    }
                  }
                  final isMuted = state.broadcast.muted.any((m) => m == me.id);
                  if (isMuted != _isMuted) {
                    await _engine.muteLocalAudioStream(isMuted);
                  }

                  if (state.broadcast.speakerInvites.any(
                    (invite) =>
                        invite.userId == me.id && invite.isAccepted == null,
                  )) {
                    _showInvitationDialog(
                      invite: state.broadcast.speakerInvites.firstWhere(
                        (invite) =>
                            invite.userId == me.id && invite.isAccepted == null,
                      ),
                    );
                  }

                  if (context.mounted) {
                    context.read<BroadcastBloc>().add(
                      BroadcastEvent.updated(broadcast: state.broadcast),
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
              onPressed: _minimize,
              icon: Icon(Icons.keyboard_arrow_down_rounded),
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
          ),
          body: isDeleted
              ? Center(child: Text('This meeting has been deleted'))
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Text(
                          widget.broadcast.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: widget.broadcast.description.isNotEmpty,
                              child: Text(widget.broadcast.description),
                            ),
                            Text(
                              'Participants: ${widget.broadcast.participantsCount}',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
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
                      MuteEveryone(broadcast: widget.broadcast),
                    );
                  },
                  child: Text('Mute everyone'),
                )
              : null,
          bottomNavigationBar: _buildControls(),
        ),
      ),
    );
  }

  Widget _buildParticipantsList() {
    final participants = widget.broadcast.participants.toList();
    participants.sort((a, b) {
      // Define a helper function to get the role priority (lower number = higher priority)
      int getRolePriority(User user) {
        if (user.id == widget.broadcast.host.id) return 0;
        if (widget.broadcast.coHosts.any((c) => c.id == user.id)) return 1;
        if (widget.broadcast.speakers.any((s) => s.id == user.id)) return 2;
        return 3; // Default for regular audience members
      }

      int priorityCompare = getRolePriority(a).compareTo(getRolePriority(b));

      // Sort alphabetically by name if roles are the same
      if (priorityCompare == 0) {
        return a.name.compareTo(b.name);
      }

      return priorityCompare;
    });

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 0.6,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final user = participants[index];
        bool isHost = user.id == widget.broadcast.host.id;
        bool isCoHost = widget.broadcast.coHosts.any((c) => c.id == user.id);
        bool isSpeaker = widget.broadcast.speakers.any((s) => s.id == user.id);
        bool isMuted = _muted.contains(user.id);
        return ParticipantTile(
          key: ValueKey(user.id),
          me: me,
          user: user,
          broadcast: widget.broadcast,
          isMuted: isMuted,
          isHost: isHost,
          isCoHost: isCoHost,
          isSpeaker: isSpeaker,
        );
      }, childCount: widget.broadcast.participants.length),
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
                                  SpeakerDetailEvent.toggleMute(
                                    broadcast: widget.broadcast,
                                    isMuted: !_isMuted,
                                  ),
                                );
                              }
                            : _hasRequestedToSpeak
                            ? null
                            : () {
                                _showRequestToSpeakDialog();
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
                    Stack(
                      children: [
                        IconButton.filledTonal(
                          iconSize: 20,
                          icon: Transform.flip(
                            flipX: true,
                            child: SvgPicture.asset(
                              'assets/icons/chat.svg',
                              width: 20,
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          tooltip: 'Comments',
                          onPressed: () {
                            showComments(
                              context: context,
                              broadcast: widget.broadcast,
                            );
                          },
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Visibility(
                            visible: widget.broadcast.commentsCount > 0,
                            child: Badge(
                              backgroundColor: Theme.of(
                                context,
                              ).scaffoldBackgroundColor,
                              label: Text(
                                widget.broadcast.commentsCount.toString(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    IconButton.filledTonal(
                      iconSize: 20,
                      icon: Icon(Symbols.people_rounded),
                      tooltip: 'Participants',
                      onPressed: () {
                        final broadcastBloc = context.read<BroadcastBloc>();
                        showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          builder: (_) => MultiBlocProvider(
                            providers: [
                              BlocProvider.value(value: broadcastBloc),
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
                              broadcast: widget.broadcast,
                              isHost: _isHost || _isCoHost,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 10),
                    IconButton.filledTonal(
                      iconSize: 20,
                      icon: Icon(Symbols.share_rounded),
                      tooltip: 'Share',
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
                              ShareBottomSheet(broadcast: widget.broadcast),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  Future<void> _initAgora() async {
    await [Permission.microphone].request();

    await agoraService.joinMeeting(
      isBroadcaster: _isHost || _isCoHost || _isSpeaker,
      broadcast: widget.broadcast,
      onEngineReady: (engine) {
        _engine = engine;

        _engine.registerEventHandler(
          RtcEngineEventHandler(
            onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
              setState(() => _isJoined = true);
              if (widget.broadcast.recordingStatus == null && _isHost) {
                context.read<BroadcastDetailBloc>().add(
                  BroadcastDetailEvent.startRecording(
                    broadcast: widget.broadcast,
                  ),
                );
              }
              _subscribe();
            },
            onError: (ErrorCodeType err, String message) {
              if (mounted) {
                final snackBar = getSnackBar(
                  context: context,
                  message: 'Error: $err - $message',
                  status: SnackBarStatus.failure,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            onRtcStats: (connection, stats) {
              // setState(() => _count = stats.userCount);
            },
            onAudioVolumeIndication:
                (
                  RtcConnection connection,
                  List<AudioVolumeInfo> speakers,
                  int speakerNumber,
                  int totalVolume,
                ) {
                  if (mounted) {
                    context.read<SpeakingIndicatorBloc>().add(
                      UpdateSpeakingUsers(speakers: speakers),
                    );
                  }
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

  Future<void> _leaveChannel() async {
    context.read<BroadcastDetailBloc>().add(
      BroadcastDetailEvent.unsubscribe(broadcast: widget.broadcast),
    );
    await agoraService.leaveCurrent();
    await agoraService.dispose();
    if (mounted) {
      context.router.popTop(); // Only navigate here
    }
  }

  void _subscribe() {
    context.read<BroadcastDetailBloc>().add(
      BroadcastDetailEvent.subscribe(
        broadcast: widget.broadcast,
        isMuted: _isHost || _isCoHost || _isSpeaker,
      ),
    );
  }

  void _showRequestToSpeakDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: 'Request To Speak?',
          content: 'A request will be sent to speak in the meeting',
          elevatedButtonText: 'Yes',
          onElevatedButtonPressed: () {
            context.read<SpeakerDetailBloc>().add(
              RequestToSpeak(broadcast: widget.broadcast),
            );
            context.router.popTop();
          },
          textButtonText: 'No',
          onTextButtonPressed: () {
            context.router.popTop();
          },
        );
      },
    );
  }

  void _showInvitationDialog({required SpeakerInvite invite}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomDialog(
          title: invite.role == SpeakerRole.speaker
              ? 'Speaker Invitation'
              : 'Co-Host Invitation',
          content: invite.role == SpeakerRole.speaker
              ? 'You have been invited to speak. Do you want to accept?'
              : 'You have been invited to co-host. Do you want to accept?',
          textButtonText: 'Decline',
          onTextButtonPressed: () {
            context.read<BroadcastDetailBloc>().add(
              BroadcastDetailEvent.respondToInvite(
                invite: invite,
                isAccepted: false,
              ),
            );
            Navigator.of(context).pop(false);
          },
          elevatedButtonText: 'Accept',
          onElevatedButtonPressed: () {
            context.read<BroadcastDetailBloc>().add(
              BroadcastDetailEvent.respondToInvite(
                invite: invite,
                isAccepted: true,
              ),
            );
            Navigator.of(context).pop(true);
          },
        );
      },
    );
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (context) => _isHost
          ? EndMeetingDialog(
              onYesPressed: () {
                context.read<BroadcastDetailBloc>().add(
                  BroadcastDetailEvent.stopRecording(
                    broadcast: widget.broadcast,
                  ),
                );
                _leaveChannel();
              },
            )
          : ExitMeetingDialog(onYesPressed: _leaveChannel),
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
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        Navigator.of(context).pop();
        onYesPressed();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}

class EndMeetingDialog extends StatelessWidget {
  const EndMeetingDialog({super.key, required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'End meeting',
      content: 'Are you sure you want to end the meeting?',
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        Navigator.of(context).pop();
        onYesPressed();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        Navigator.of(context).pop();
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
  const _ParticipantsBottomSheet({
    required this.broadcast,
    required this.isHost,
  });

  final Broadcast broadcast;
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
                    AllTab(broadcast: broadcast),
                    if (isHost) RequestsTab(broadcast: broadcast),
                    SpeakersTab(broadcast: broadcast),
                    ListenersTab(broadcast: broadcast),
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
