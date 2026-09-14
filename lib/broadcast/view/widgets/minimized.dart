import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/agora_service.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/broadcast/bloc/broadcast_view/broadcast_view_cubit.dart';
import 'package:democracy/broadcast/bloc/speaker_detail/speaker_detail_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MinimizedBroadcastBar extends StatelessWidget {
  final Broadcast broadcast;

  const MinimizedBroadcastBar({super.key, required this.broadcast});

  @override
  Widget build(BuildContext context) {
    final me = context.read<AuthBloc>().state.user!;
    bool isMuted = broadcast.muted.any((id) => id == me.id);
    bool isHost = me.id == broadcast.host.id;
    bool isCoHost = broadcast.coHosts.any((c) => c.id == me.id);
    bool isSpeaker = broadcast.speakers.any((s) => s.id == me.id);

    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<BroadcastDetailBloc>().add(
                BroadcastDetailEvent.subscribe(
                  broadcast: broadcast,
                  isMuted: isMuted,
                ),
              );
            }
          },
        ),
        BlocListener<BroadcastDetailBloc, BroadcastDetailState>(
          listener: (context, state) async {
            switch (state) {
              case BroadcastUpdated():
                if (state.broadcast.id == broadcast.id) {
                  final justCoHost = state.broadcast.coHosts.any(
                    (c) => c.id == me.id,
                  );
                  final justSpeaker = state.broadcast.speakers.any(
                    (s) => s.id == me.id,
                  );
                  final isNewCoHost = justCoHost && !isCoHost;
                  final isNewSpeaker = justSpeaker && !isSpeaker;
                  final engine = await AgoraService().getEngine();
                  if (!isHost) {
                    final wasBroadcaster = isCoHost || isSpeaker;
                    final isBroadcaster = justCoHost || justSpeaker;
                    if (isBroadcaster != wasBroadcaster) {
                      if (!isBroadcaster) {
                        await engine.muteLocalAudioStream(true);
                      }
                      await engine.setClientRole(
                        role: isBroadcaster
                            ? ClientRoleType.clientRoleBroadcaster
                            : ClientRoleType.clientRoleAudience,
                      );
                    }
                  }
                  final justMuted = state.broadcast.muted.any(
                    (m) => m == me.id,
                  );
                  if (justMuted != isMuted) {
                    await engine.muteLocalAudioStream(justMuted);
                  }

                  if (context.mounted) {
                    context.read<BroadcastViewCubit>().minimized(
                      broadcast: state.broadcast,
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
                if (broadcastId == broadcast.id) {
                  context.read<BroadcastViewCubit>().maximized();
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
      ],
      child: SafeArea(
        child: Container(
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).colorScheme.surface,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                // 🚨 Expand back to full screen
                context.read<BroadcastViewCubit>().maximized();
                context.router.push(MeetingDetail(broadcastId: broadcast.id));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  children: [
                    // Live Indicator / Avatar
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.mic,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Text Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            broadcast.title,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Live • ${broadcast.participantsCount} listening',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                          ),
                        ],
                      ),
                    ),

                    if (isHost || isCoHost || isSpeaker)
                      IconButton(
                        icon: Icon(
                          isMuted ? Icons.mic_off : Icons.mic,
                          color: isMuted ? null : Colors.green,
                          size: 20,
                        ),
                        onPressed: () {
                          context.read<SpeakerDetailBloc>().add(
                            SpeakerDetailEvent.toggleMute(
                              broadcast: broadcast,
                              isMuted: !isMuted,
                            ),
                          );
                        },
                      ),

                    // Leave Button
                    IconButton(
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.red,
                        size: 24,
                      ),
                      onPressed: () {
                        context.read<BroadcastViewCubit>().maximized();
                        context.read<BroadcastDetailBloc>().add(
                          BroadcastDetailEvent.end(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
