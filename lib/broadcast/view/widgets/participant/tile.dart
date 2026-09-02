import 'package:democracy/broadcast/bloc/speaking_indicator/speaking_indicator_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/view/widgets/participant/profile.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParticipantTile extends StatelessWidget {
  const ParticipantTile({
    super.key,
    required this.me,
    required this.user,
    required this.broadcast,
    required this.isMuted,
    required this.isHost,
    required this.isCoHost,
    required this.isSpeaker,
  });

  final User me;
  final User user;
  final Broadcast broadcast;
  final bool isMuted;
  final bool isHost;
  final bool isCoHost;
  final bool isSpeaker;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isMe = user.id == me.id;

    return GestureDetector(
      onTap: isMe
          ? null
          : () => showParticipantProfile(
              context: context,
              broadcast: broadcast,
              user: user,
            ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<SpeakingIndicatorBloc, SpeakingState>(
            buildWhen: (previous, current) =>
                previous.isSpeaking(user.id) != current.isSpeaking(user.id),
            builder: (context, state) {
              final isSpeaking = state.isSpeaking(user.id);
              return Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSpeaking
                            ? colorScheme.primary
                            : Colors.transparent,
                        width: isSpeaking ? 3 : 0,
                      ),
                      boxShadow: isSpeaking
                          ? [
                              BoxShadow(
                                color: colorScheme.primary.withValues(
                                  alpha: 0.4,
                                ),
                                blurRadius: 8,
                                spreadRadius: 2,
                              ),
                            ]
                          : null,
                    ),
                    child: ProfileImage(
                      userId: user.id,
                      username: user.username,
                      imageUrl: user.image,
                      radius: 36, // Optimized for grid
                    ),
                  ),
                  // Role / Mute Badge
                  if (isHost || isCoHost || isSpeaker)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: isHost
                              ? colorScheme.errorContainer
                              : (isCoHost
                                    ? colorScheme.tertiaryContainer
                                    : colorScheme.primaryContainer),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: colorScheme.surface,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          isMuted
                              ? Icons.mic_off_rounded
                              : (isHost
                                    ? Icons.star_rounded
                                    : Icons.mic_rounded),
                          color: isHost
                              ? colorScheme.onErrorContainer
                              : (isCoHost
                                    ? colorScheme.onTertiaryContainer
                                    : colorScheme.onPrimaryContainer),
                          size: 14,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 8),
          Text(
            isMe ? 'You' : user.name,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: isMe ? colorScheme.primary : colorScheme.onSurface,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          if (!isMe)
            Text(
              isHost
                  ? 'Host'
                  : isCoHost
                  ? 'Co-host'
                  : isSpeaker
                  ? 'Speaker'
                  : 'Listener',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      ),
    );
  }
}
