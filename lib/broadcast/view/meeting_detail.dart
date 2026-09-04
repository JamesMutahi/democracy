import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/agora_service.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/share_bottom_sheet.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/broadcast/bloc/broadcast_view/broadcast_view_cubit.dart';
import 'package:democracy/broadcast/bloc/comments/comments_bloc.dart';
import 'package:democracy/broadcast/bloc/speaking_indicator/speaking_indicator_bloc.dart';
import 'package:democracy/broadcast/models/speaker_invite.dart';
import 'package:democracy/broadcast/view/widgets/comments.dart';
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
import 'package:material_symbols_icons/symbols.dart';
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
              return const Center(child: BottomLoader());
            }
            if (state.status == BroadcastStatus.failure &&
                state.broadcast == null) {
              return Center(
                child: FailureRetryButton(
                  onPressed: () {
                    context.read<BroadcastBloc>().add(
                      BroadcastEvent.load(broadcastId: broadcastId),
                    );
                  },
                ),
              );
            }

            if (!state.broadcast!.isActive || state.broadcast!.hasEnded) {
              return const Center(child: Text('This meeting has been closed'));
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

  // Reactively synced via Getters
  List<int> get _muted => widget.broadcast.muted;
  User get me => context.read<AuthBloc>().state.user!;
  bool get _isHost => me.id == widget.broadcast.host.id;
  bool get _isCoHost => widget.broadcast.coHosts.any((c) => c.id == me.id);
  bool get _isSpeaker => widget.broadcast.speakers.any((s) => s.id == me.id);
  bool get _isMuted => widget.broadcast.muted.any((id) => id == me.id);
  bool get _isBroadcaster => _isHost || _isCoHost || _isSpeaker;

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
                  final isCoHost = broadcast.coHosts.any((c) => c.id == me.id);
                  final isSpeaker = broadcast.speakers.any(
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

                  final isMuted = broadcast.muted.any((m) => m == me.id);
                  if (isMuted != _isMuted) {
                    await _engine.muteLocalAudioStream(isMuted);
                  }

                  if (broadcast.speakerInvites.any(
                    (invite) =>
                        invite.userId == me.id && invite.isAccepted == null,
                  )) {
                    _showInvitationDialog(
                      invite: broadcast.speakerInvites.firstWhere(
                        (invite) =>
                            invite.userId == me.id && invite.isAccepted == null,
                      ),
                    );
                  }

                  if (context.mounted) {
                    context.read<BroadcastBloc>().add(
                      BroadcastEvent.updated(broadcast: broadcast),
                    );
                  }

                  if ((isNewCoHost || isNewSpeaker) && context.mounted) {
                    final message = isNewSpeaker
                        ? 'You are now a speaker'
                        : 'You are now a co-host';
                    ScaffoldMessenger.of(context).showSnackBar(
                      getSnackBar(
                        context: context,
                        message: message,
                        status: SnackBarStatus.info,
                      ),
                    );
                  }
                }
              case BroadcastDeleted(:final broadcastId):
                if (broadcastId == widget.broadcast.id) {
                  setState(() => isDeleted = true);
                }
              case BroadcastDetailFailure(:final error):
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    getSnackBar(
                      context: context,
                      message: error,
                      status: SnackBarStatus.failure,
                    ),
                  );
                }
            }
          },
        ),
        BlocListener<SpeakerDetailBloc, SpeakerDetailState>(
          listener: (context, state) async {
            switch (state) {
              case RequestedToSpeak():
                if (context.mounted) {
                  setState(() => _hasRequestedToSpeak = true);
                }
              case SpeakerRequestCreated(:final request):
                if ((_isHost || _isCoHost) && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    getSnackBar(
                      context: context,
                      message: '${request.user.name} requests to speak',
                      status: SnackBarStatus.info,
                    ),
                  );
                }
              case SpeakerRequestUpdated(:final request):
                if (request.user.id == me.id && request.isApproved != null) {
                  if (context.mounted) {
                    setState(() => _hasRequestedToSpeak = false);
                  }
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
          if (didPop) return;
          _showExitDialog();
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 28),
              onPressed: _minimize,
              tooltip: 'Minimize',
            ),
            actions: [
              TextButton.icon(
                onPressed: _showExitDialog,
                icon: Icon(
                  _isHost ? Icons.call_end : Icons.exit_to_app,
                  color: Colors.red,
                  size: 20,
                ),
                label: Text(
                  _isHost ? 'End' : 'Leave',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red.withValues(alpha: 0.1),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          body: isDeleted
              ? const Center(child: Text('This meeting has been deleted'))
              : Column(
                  children: [
                    // Meeting Info Header
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.broadcast.title,
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.people_outline, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                '${widget.broadcast.participantsCount} participant${widget.broadcast.participantsCount == 1 ? '' : 's'}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),

                    // Participants Grid
                    Expanded(
                      child: !_isJoined
                          ? const Center(child: BottomLoader())
                          : _buildParticipantsList(),
                    ),
                  ],
                ),

          // Floating Bottom Controls
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: _isJoined
              ? _buildControls()
              : const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget _buildParticipantsList() {
    final participants = widget.broadcast.participants.toList();
    participants.sort((a, b) {
      int getRolePriority(User user) {
        if (user.id == widget.broadcast.host.id) return 0;
        if (widget.broadcast.coHosts.any((c) => c.id == user.id)) return 1;
        if (widget.broadcast.speakers.any((s) => s.id == user.id)) return 2;
        return 3;
      }

      int priorityCompare = getRolePriority(a).compareTo(getRolePriority(b));
      return priorityCompare == 0 ? a.name.compareTo(b.name) : priorityCompare;
    });

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: participants.length,
      itemBuilder: (context, index) {
        final user = participants[index];
        return ParticipantTile(
          key: ValueKey(user.id),
          me: me,
          user: user,
          broadcast: widget.broadcast,
          isMuted: _muted.contains(user.id),
          isHost: user.id == widget.broadcast.host.id,
          isCoHost: widget.broadcast.coHosts.any((c) => c.id == user.id),
          isSpeaker: widget.broadcast.speakers.any((s) => s.id == user.id),
        );
      },
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
                                await _requestMicPermissionWithRationale();
                                if (mounted) {
                                  context.read<SpeakerDetailBloc>().add(
                                    SpeakerDetailEvent.toggleMute(
                                      broadcast: widget.broadcast,
                                      isMuted: !_isMuted,
                                    ),
                                  );
                                }
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
    if (_isBroadcaster) await _requestMicPermissionWithRationale();

    await agoraService.joinMeeting(
      isBroadcaster: _isBroadcaster,
      broadcast: widget.broadcast,
      onEngineReady: (engine) {
        if (!mounted) {
          engine.leaveChannel();
          return;
        }
        _engine = engine;

        _engine.registerEventHandler(
          RtcEngineEventHandler(
            onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
              if (!mounted) return;
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
                ScaffoldMessenger.of(context).showSnackBar(
                  getSnackBar(
                    context: context,
                    message: 'Error: $err - $message',
                    status: SnackBarStatus.failure,
                  ),
                );
              }
            },
            onAudioVolumeIndication:
                (connection, speakers, speakerNumber, totalVolume) {
                  if (!mounted) return;

                  final previousState = context
                      .read<SpeakingIndicatorBloc>()
                      .state;
                  final newSpeakingUids = speakers
                      .where((s) => s.uid != null && (s.volume ?? 0) > 30)
                      .map((s) => s.uid!)
                      .toSet();

                  final previousSpeakingUids = previousState.speakingUserIds;

                  if (!_setEquals(newSpeakingUids, previousSpeakingUids)) {
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

  /// Requests microphone permission with user-friendly rationale dialogs.
  /// Returns `true` if permission is granted, `false` otherwise.
  Future<bool> _requestMicPermissionWithRationale() async {
    var status = await Permission.microphone.status;

    // Already granted
    if (status.isGranted) return true;

    // Permanently denied (User previously selected "Don't ask again")
    if (status.isPermanentlyDenied) {
      _showMicSettingsDialog();
      return false;
    }

    // Trigger the actual OS permission prompt
    status = await Permission.microphone.request();

    if (status.isGranted) return true;

    // If they denied the OS prompt, check if it's permanently denied now
    if (status.isPermanentlyDenied) {
      _showMicSettingsDialog();
    }

    return false;
  }

  /// If permission was permanently denied -> App Settings
  void _showMicSettingsDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Permission Required'),
        content: const Text(
          'Microphone access is required to speak in this meeting. '
          'Please enable it in your device settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  Future<void> _leaveChannel() async {
    context.read<BroadcastDetailBloc>().add(
      BroadcastDetailEvent.unsubscribe(broadcast: widget.broadcast),
    );

    await agoraService.leaveCurrent();

    if (mounted) {
      context.router.popTop();
    }
  }

  void _subscribe() {
    context.read<BroadcastDetailBloc>().add(
      BroadcastDetailEvent.subscribe(
        broadcast: widget.broadcast,
        isMuted: _isBroadcaster,
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
          onTextButtonPressed: () => context.router.popTop(),
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

bool _setEquals(Set<int> a, Set<int> b) {
  if (a.length != b.length) return false;
  for (final item in a) {
    if (!b.contains(item)) return false;
  }
  return true;
}
