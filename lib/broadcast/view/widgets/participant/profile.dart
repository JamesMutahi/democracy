import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebSocketService;
import 'package:democracy/app/core/app_logger.dart';
import 'package:democracy/app/shared/widgets/dialog_container.dart';
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
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/foundation.dart';
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
  final webSocketService = context.read<WebSocketService>();

  Widget buildProfileContent(BuildContext overlayContext) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: broadcastBloc),
        BlocProvider(
          create: (_) =>
              ProfileBloc(webSocketService: webSocketService)
                ..add(ProfileEvent.load(username: user.username)),
        ),
      ],
      child: ParticipantProfile(broadcast: broadcast, user: user),
    );
  }

  if (kIsWeb) {
    showDialog(
      context: context,
      builder: (dialogContext) =>
          DialogContainer(children: [buildProfileContent(dialogContext)]),
    );
  } else {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => buildProfileContent(sheetContext),
    );
  }
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
  Widget build(BuildContext context) {
    final me = context.read<AuthBloc>().state.user!;
    final colorScheme = Theme.of(context).colorScheme;

    return MultiBlocListener(
      listeners: [
        BlocListener<UserDetailBloc, UserDetailState>(
          listener: (context, state) {
            if (state is UserUpdated) {
              if (state.user.id == widget.user.id) {
                context.read<ProfileBloc>().add(
                  ProfileEvent.updated(user: state.user),
                );
              }
            }
          },
        ),
        BlocListener<ChatDetailBloc, ChatDetailState>(
          listener: (context, state) {
            if (state is ChatCreated) {
              AppLogger.info(state.chat.users.first.username);
              if (state.userId == widget.user.id) {
                context.router.push(ChatDetail(chatId: state.chat.id));
              }
            }
          },
        ),
      ],
      child: BlocBuilder<BroadcastBloc, BroadcastState>(
        buildWhen: (previous, current) =>
            current.broadcastId == widget.broadcast.id,
        builder: (context, state) {
          final broadcast = state.broadcast!;
          final isHost = broadcast.host.id == widget.user.id;
          final isCoHost = broadcast.coHosts.any((c) => c.id == widget.user.id);
          final isSpeaker = broadcast.speakers.any(
            (s) => s.id == widget.user.id,
          );
          final isMuted = broadcast.muted.any((id) => id == widget.user.id);

          final canManageCoHosts = broadcast.host.id == me.id;
          final canManageSpeakers =
              broadcast.host.id == me.id ||
              broadcast.coHosts.any((c) => c.id == me.id);

          final inviteIsPending = broadcast.speakerInvites.any(
            (i) => i.userId == widget.user.id && i.isAccepted == null,
          );
          final hasRejectedInvite = broadcast.speakerInvites.any(
            (i) => i.userId == widget.user.id && i.isAccepted == false,
          );

          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Drag Handle
                  Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 8),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  // Header
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        ProfileImage(
                          userId: widget.user.id,
                          username: widget.user.username,
                          imageUrl: widget.user.image,
                          radius: 32,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.user.name,
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '@${widget.user.username}',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            if (kIsWeb) {
                              Navigator.pop(context);
                            }
                            context.router.push(
                              ProfileRoute(username: widget.user.username),
                            );
                          },
                          child: const Text('View Profile'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),

                  // Meeting Controls Section
                  if (canManageSpeakers || canManageCoHosts || isSpeaker) ...[
                    if (canManageSpeakers &&
                        !isHost &&
                        !isSpeaker &&
                        !isCoHost &&
                        !inviteIsPending)
                      _ProfileActionTile(
                        icon: Icons.mic_rounded,
                        iconColor: colorScheme.primary,
                        title: 'Invite to speak',
                        subtitle: hasRejectedInvite
                            ? '(Previously declined)'
                            : null,
                        onTap: () => _showDialog(
                          context,
                          InviteSpeakerDialog(
                            broadcast: broadcast,
                            user: widget.user,
                          ),
                        ),
                      ),
                    if (canManageSpeakers && inviteIsPending)
                      _ProfileActionTile(
                        icon: Icons.hourglass_empty_rounded,
                        iconColor: colorScheme.outline,
                        title: 'Invite pending',
                        trailing: TextButton(
                          onPressed: () {
                            final invite = broadcast.speakerInvites.firstWhere(
                              (i) => i.userId == widget.user.id,
                            );
                            _showDialog(
                              context,
                              CancelInviteDialog(invite: invite),
                            );
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    if (canManageSpeakers && isSpeaker)
                      _ProfileActionTile(
                        icon: Icons.person_remove_rounded,
                        iconColor: colorScheme.error,
                        title: 'Remove from speakers',
                        onTap: () => _showDialog(
                          context,
                          RemoveSpeakerDialog(
                            broadcast: broadcast,
                            user: widget.user,
                          ),
                        ),
                      ),
                    if (canManageCoHosts && isSpeaker && !inviteIsPending)
                      _ProfileActionTile(
                        icon: Icons.star_rounded,
                        iconColor: colorScheme.tertiary,
                        title: 'Invite to co-host',
                        onTap: () => _showDialog(
                          context,
                          InviteCoHostDialog(
                            broadcast: broadcast,
                            user: widget.user,
                          ),
                        ),
                      ),
                    if (canManageCoHosts && isCoHost)
                      _ProfileActionTile(
                        icon: Icons.person_remove_rounded,
                        iconColor: colorScheme.error,
                        title: 'Remove from co-hosts',
                        onTap: () => _showDialog(
                          context,
                          RemoveCoHostDialog(
                            broadcast: broadcast,
                            user: widget.user,
                          ),
                        ),
                      ),
                    if ((canManageCoHosts && isCoHost) ||
                        (canManageSpeakers && isSpeaker))
                      _ProfileActionTile(
                        icon: isMuted
                            ? Icons.mic_off_rounded
                            : Icons.volume_down_rounded,
                        iconColor: isMuted
                            ? colorScheme.error
                            : colorScheme.onSurface,
                        title: isMuted
                            ? 'Unmute participant'
                            : 'Mute participant',
                        enabled: !isMuted,
                        onTap: () => _showDialog(
                          context,
                          MuteSpeakerDialog(
                            broadcast: broadcast,
                            user: widget.user,
                          ),
                        ),
                      ),
                    if (isSpeaker && me.id == widget.user.id)
                      _ProfileActionTile(
                        icon: isMuted
                            ? Icons.mic_off_rounded
                            : Icons.mic_rounded,
                        iconColor: isMuted
                            ? colorScheme.error
                            : colorScheme.primary,
                        title: isMuted ? 'Unmute myself' : 'Mute myself',
                        enabled: !isMuted,
                        onTap: () {
                          context.read<SpeakerDetailBloc>().add(
                            SpeakerDetailEvent.toggleMute(
                              broadcast: broadcast,
                              isMuted: !isMuted,
                            ),
                          );
                        },
                      ),
                    const SizedBox(height: 8),
                  ],

                  _ProfileActionTile(
                    icon: Icons.mail_rounded,
                    iconColor: colorScheme.primary,
                    title: 'Send Direct Message',
                    onTap: () {
                      context.read<ChatDetailBloc>().add(
                        ChatDetailEvent.create(user: widget.user),
                      );
                    },
                  ),
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
                            state.user!.isBlocked
                                ? context.read<UserDetailBloc>().add(
                                    UserDetailEvent.block(user: widget.user),
                                  )
                                : showDialog(
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
                            ? Text(state.user!.isBlocked ? 'Unblock' : 'Block')
                            : SpinKitThreeBounce(size: 20, color: Colors.red),
                      );
                    },
                  ),
                  _ProfileActionTile(
                    icon: Icons.flag_rounded,
                    iconColor: colorScheme.error,
                    title: 'Report',
                    textColor: colorScheme.error,
                    onTap: () {
                      // TODO: Implement report logic
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showDialog(BuildContext context, Widget dialog) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => dialog,
    );

    // If the user confirmed the action, close
    if (confirmed == true && context.mounted) {
      Navigator.of(context).pop();
    }
  }
}

class _ProfileActionTile extends StatelessWidget {
  const _ProfileActionTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    this.subtitle,
    this.textColor,
    this.trailing,
    this.enabled = true,
    this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final Color? textColor;
  final Widget? trailing;
  final bool enabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: enabled,
      onTap: onTap,
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(color: textColor)),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            )
          : null,
      trailing: trailing,
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
