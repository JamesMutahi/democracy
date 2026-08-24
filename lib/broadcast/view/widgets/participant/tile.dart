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
    return GestureDetector(
      onTap: user.id == me.id
          ? null
          : () {
              showParticipantProfile(
                context: context,
                broadcast: broadcast,
                user: user,
              );
            },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<SpeakingIndicatorBloc, SpeakingState>(
              buildWhen: (previous, current) {
                return previous.isSpeaking(user.id) !=
                    current.isSpeaking(user.id);
              },
              builder: (context, state) {
                final isSpeaking = state.isSpeaking(user.id);

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSpeaking ? Colors.green : Colors.transparent,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ProfileImage(
                    userId: user.id,
                    username: user.username,
                    imageUrl: user.image,
                    radius: 40,
                  ),
                );
              },
            ),
            SizedBox(height: 5),
            Text(user.name, style: TextStyle(fontWeight: FontWeight.w500)),
            Text(
              '@${user.username}',
              style: TextStyle(color: Theme.of(context).hintColor),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isHost || isCoHost || isSpeaker)
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
                      : isCoHost
                      ? "Co-host"
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
