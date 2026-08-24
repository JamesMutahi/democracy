import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus, WebSocketService;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/broadcast/bloc/broadcast/broadcast_bloc.dart';
import 'package:democracy/broadcast/models/speaker_invite.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/broadcast/bloc/speaker_detail/speaker_detail_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/user/bloc/profile/profile_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:material_symbols_icons/symbols.dart';

void showParticipantProfile({
  required BuildContext context,
  required Broadcast broadcast,
  required User user,
}) {
  final broadcastBloc = context.read<BroadcastBloc>();
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider.value(value: broadcastBloc),
        BlocProvider(
          create: (context) =>
              ProfileBloc(webSocketService: context.read<WebSocketService>()),
        ),
      ],
      child: ParticipantProfile(broadcast: broadcast, user: user),
    ),
  );
}

class ParticipantProfile extends StatefulWidget {
  const ParticipantProfile({
    super.key,
    required this.broadcast,
    required this.user,
  });

  final Broadcast broadcast;
  final User user;

  @override
  State<ParticipantProfile> createState() => _ParticipantProfileState();
}

class _ParticipantProfileState extends State<ParticipantProfile> {
  @override
  void initState() {
    super.initState();
    _subscribe();
  }

  void _subscribe() {
    // subscribe and get user
    context.read<ProfileBloc>().add(
      ProfileEvent.load(username: widget.user.username),
    );
  }

  @override
  Widget build(BuildContext context) {
    User me = context.read<AuthBloc>().state.user!;
    double coverPhotoHeight = MediaQuery.of(context).size.height / 7;
    double profilePicHeight = MediaQuery.of(context).size.height / 10;

    return MultiBlocListener(
      listeners: [
        BlocListener<UserDetailBloc, UserDetailState>(
          listener: (context, state) {
            if (state is UserUpdated) {
              context.read<ProfileBloc>().add(
                ProfileEvent.updated(user: state.user),
              );
            }
          },
        ),
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              _subscribe();
            }
          },
        ),
      ],
      child: PopScope(
        onPopInvokedWithResult: (_, _) {
          context.read<UserDetailBloc>().add(
            UserDetailEvent.unsubscribe(user: widget.user),
          );
        },
        child: BlocBuilder<BroadcastBloc, BroadcastState>(
          buildWhen: (previous, current) =>
              current.broadcastId == widget.broadcast.id,
          builder: (context, state) {
            bool canManageCoHosts = state.broadcast!.host.id == me.id;
            bool canManageSpeakers =
                state.broadcast!.host.id == me.id ||
                state.broadcast!.coHosts.any((c) => c.id == me.id);

            bool isHost = state.broadcast!.host.id == widget.user.id;

            bool isCoHost = state.broadcast!.coHosts.any(
              (c) => c.id == widget.user.id,
            );

            bool isSpeaker = state.broadcast!.speakers.any(
              (s) => s.id == widget.user.id,
            );
            bool isMuted = state.broadcast!.muted.any(
              (id) => id == widget.user.id,
            );
            bool inviteIsPending = state.broadcast!.speakerInvites.any(
              (invite) =>
                  invite.userId == widget.user.id && invite.isAccepted == null,
            );
            bool hasRejectedInvite = state.broadcast!.speakerInvites.any(
              (invite) =>
                  invite.userId == widget.user.id && invite.isAccepted == false,
            );
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
                              widget.user.coverPhoto,
                              cacheKey: 'cover ${widget.user.id}',
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
                              color: Theme.of(
                                context,
                              ).disabledColor.withAlpha(30),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                context.read<ChatDetailBloc>().add(
                                  ChatDetailEvent.create(user: widget.user),
                                );
                              },
                              leading: Icon(Symbols.mail_rounded),
                              title: Text('Send Direct Message'),
                            ),
                            if (canManageSpeakers &&
                                !isHost &&
                                !isSpeaker &&
                                !isCoHost &&
                                !inviteIsPending)
                              ListTile(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return InviteSpeakerDialog(
                                        broadcast: widget.broadcast,
                                        user: widget.user,
                                      );
                                    },
                                  );
                                },
                                leading: Icon(
                                  Symbols.mic_rounded,
                                  color: Colors.blue,
                                ),
                                title: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: 'Invite to speak'),
                                      TextSpan(
                                        text: hasRejectedInvite
                                            ? ' (Declined)'
                                            : '',
                                        style: TextStyle(
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            if (canManageSpeakers && inviteIsPending)
                              ListTile(
                                onTap: () {},
                                leading: Icon(Icons.hourglass_empty_rounded),
                                title: Text('Invite pending...'),
                                trailing: TextButton(
                                  onPressed: () {
                                    final invite = state
                                        .broadcast!
                                        .speakerInvites
                                        .firstWhere(
                                          (invite) =>
                                              invite.userId == widget.user.id,
                                        );
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return CancelInviteDialog(
                                          invite: invite,
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),

                            if (canManageSpeakers && isSpeaker)
                              ListTile(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return RemoveSpeakerDialog(
                                        broadcast: widget.broadcast,
                                        user: widget.user,
                                      );
                                    },
                                  );
                                },
                                leading: Icon(Symbols.close_rounded),
                                title: Text('Remove from speakers'),
                              ),

                            if (canManageCoHosts &&
                                isSpeaker &&
                                !inviteIsPending)
                              ListTile(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return InviteCoHostDialog(
                                        broadcast: widget.broadcast,
                                        user: widget.user,
                                      );
                                    },
                                  );
                                },
                                leading: Icon(
                                  Symbols.mic_rounded,
                                  color: Colors.blue,
                                ),
                                title: Text('Invite to co-host'),
                              ),

                            if (canManageCoHosts && isCoHost)
                              ListTile(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return RemoveCoHostDialog(
                                        broadcast: widget.broadcast,
                                        user: widget.user,
                                      );
                                    },
                                  );
                                },
                                leading: Icon(Symbols.close_rounded),
                                title: Text('Remove from co-hosts'),
                              ),

                            if ((canManageCoHosts && isCoHost) ||
                                (canManageSpeakers && isSpeaker))
                              ListTile(
                                onTap: isMuted
                                    ? null
                                    : () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) {
                                            return MuteSpeakerDialog(
                                              broadcast: widget.broadcast,
                                              user: widget.user,
                                            );
                                          },
                                        );
                                      },
                                leading: Icon(
                                  isMuted
                                      ? Symbols.mic_off_rounded
                                      : Symbols.volume_down_rounded,
                                ),
                                title: Text(
                                  isMuted ? 'Muted' : 'Mute their mic',
                                ),
                              )
                            else if (isSpeaker && me.id == widget.user.id)
                              ListTile(
                                onTap: isMuted
                                    ? null
                                    : () {
                                        context.read<SpeakerDetailBloc>().add(
                                          SpeakerDetailEvent.toggleMute(
                                            broadcast: widget.broadcast,
                                            isMuted: !isMuted,
                                          ),
                                        );
                                      },
                                leading: Icon(
                                  isMuted
                                      ? Symbols.mic_off_rounded
                                      : Symbols.mic_rounded,
                                ),
                                title: Text(
                                  isMuted ? 'Muted' : 'Mute their mic',
                                ),
                              ),

                            /// Blocked status is host's data not the current user (me)
                            BlocBuilder<ProfileBloc, ProfileState>(
                              buildWhen: (previous, current) {
                                return current.user?.id == widget.user.id;
                              },
                              builder: (context, state) {
                                return ListTile(
                                  iconColor: Colors.red,
                                  textColor: Colors.red,
                                  onTap: () {
                                    if (state.status == ProfileStatus.success) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return BlockDialog(user: widget.user);
                                        },
                                      );
                                    }
                                  },
                                  leading: Icon(Symbols.block_rounded),
                                  title: state.status == ProfileStatus.success
                                      ? Text(
                                          state.user!.isBlocked
                                              ? 'Unblock'
                                              : 'Block',
                                        )
                                      : SpinKitThreeBounce(
                                          size: 20,
                                          color: Colors.red,
                                        ),
                                );
                              },
                            ),
                            ListTile(
                              onTap: () {
                                //   TODO:
                              },
                              leading: Icon(
                                Symbols.report_rounded,
                                color: Colors.red,
                              ),
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
                          backgroundColor: Theme.of(
                            context,
                          ).scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 42,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    widget.user.image,
                                    cacheKey: 'profile ${widget.user.id}',
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
                                widget.user.name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                '@${widget.user.username}',
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
                  Positioned(
                    top: 15,
                    right: 15,
                    child: OutlinedButton(
                      onPressed: () {
                        context.router.push(
                          ProfileRoute(username: widget.user.username),
                        );
                      },
                      child: Text("Profile"),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class InviteSpeakerDialog extends StatelessWidget {
  const InviteSpeakerDialog({
    super.key,
    required this.broadcast,
    required this.user,
  });

  final User user;
  final Broadcast broadcast;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Invite speaker?',
      content: 'They will be added as a speaker to the meeting.',
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        context.read<BroadcastDetailBloc>().add(
          BroadcastDetailEvent.inviteToSpeak(broadcast: broadcast, user: user),
        );
        context.router.popTop();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        context.router.popTop();
      },
    );
  }
}

class CancelInviteDialog extends StatelessWidget {
  const CancelInviteDialog({super.key, required this.invite});

  final SpeakerInvite invite;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Cancel Invite',
      content: 'Are you sure you want to cancel this invite?',
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        context.read<BroadcastDetailBloc>().add(
          BroadcastDetailEvent.cancelInvite(invite: invite),
        );
        context.router.popTop();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        context.router.popTop();
      },
    );
  }
}

class RemoveSpeakerDialog extends StatelessWidget {
  const RemoveSpeakerDialog({
    super.key,
    required this.broadcast,
    required this.user,
  });

  final User user;
  final Broadcast broadcast;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Remove Speaker?',
      content: 'They will be removed as a speaker from the meeting.',
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        context.read<SpeakerDetailBloc>().add(
          SpeakerDetailEvent.removeSpeaker(broadcast: broadcast, user: user),
        );
        context.router.popTop();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        context.router.popTop();
      },
    );
  }
}

class InviteCoHostDialog extends StatelessWidget {
  const InviteCoHostDialog({
    super.key,
    required this.broadcast,
    required this.user,
  });

  final User user;
  final Broadcast broadcast;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Invite co-host?',
      content:
          'They will be added as a co-host to the meeting.\nThey will be able to add and remove speakers.',
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        context.read<BroadcastDetailBloc>().add(
          BroadcastDetailEvent.inviteToCoHost(broadcast: broadcast, user: user),
        );
        context.router.popTop();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        context.router.popTop();
      },
    );
  }
}

class RemoveCoHostDialog extends StatelessWidget {
  const RemoveCoHostDialog({
    super.key,
    required this.broadcast,
    required this.user,
  });

  final User user;
  final Broadcast broadcast;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Remove Co-host?',
      content: 'They will be removed as a co-host from the meeting.',
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        context.read<SpeakerDetailBloc>().add(
          SpeakerDetailEvent.removeCoHost(broadcast: broadcast, user: user),
        );
        context.router.popTop();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        context.router.popTop();
      },
    );
  }
}

class MuteSpeakerDialog extends StatelessWidget {
  const MuteSpeakerDialog({
    super.key,
    required this.broadcast,
    required this.user,
  });

  final User user;
  final Broadcast broadcast;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Mute?',
      content: 'They will not be able to speak until they unmute themselves.',
      elevatedButtonText: 'Yes',
      onElevatedButtonPressed: () {
        context.read<SpeakerDetailBloc>().add(
          MuteSpeaker(broadcast: broadcast, user: user),
        );
        context.router.popTop();
      },
      textButtonText: 'No',
      onTextButtonPressed: () {
        context.router.popTop();
      },
    );
  }
}
