import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/meeting/bloc/speaker_detail/speaker_detail_bloc.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/meeting/view/widgets/participant/profile.dart';
import 'package:democracy/user/bloc/profile/profile_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParticipantTile extends StatelessWidget {
  const ParticipantTile({
    super.key,
    required this.me,
    required this.user,
    required this.engine,
    required this.meeting,
    required this.canManageCoHosts,
    required this.canManageSpeakers,
    required this.isMuted,
    required this.isHost,
    required this.isCoHost,
    required this.isSpeaker,
    required this.isSpeaking,
  });

  final User me;
  final User user;
  final RtcEngine engine;
  final Meeting meeting;
  final bool canManageCoHosts;
  final bool canManageSpeakers;
  final bool isMuted;
  final bool isHost;
  final bool isCoHost;
  final bool isSpeaker;
  final bool isSpeaking;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SpeakerDetailBloc>();
    return GestureDetector(
      onTap: user.id == me.id
          ? null
          : () {
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
                    BlocProvider.value(value: bloc),
                    BlocProvider(
                      create: (context) => ProfileBloc(
                        webSocketService: context.read<WebSocketService>(),
                      ),
                    ),
                  ],
                  child: ParticipantProfile(
                    me: me,
                    canManageCoHosts: canManageCoHosts,
                    canManageSpeakers: canManageSpeakers,
                    meeting: meeting,
                    user: user,
                    engine: engine,
                    isHost: isHost,
                    isCoHost: isCoHost,
                    isSpeaker: isSpeaker,
                    isMuted: isMuted,
                  ),
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
