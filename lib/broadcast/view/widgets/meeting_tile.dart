import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/audio_player.dart';
import 'package:democracy/app/shared/widgets/more_pop_up.dart';
import 'package:democracy/app/shared/widgets/share_bottom_sheet.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/shared/widgets/video_pip.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/geo/view/widgets/geo_chip.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class MeetingTile extends StatelessWidget {
  const MeetingTile({
    super.key,
    required this.broadcast,
    required this.isDependency,
  });

  final Broadcast broadcast;
  final bool isDependency;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isEnded = broadcast.hasEnded;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => MeetingBottomSheet(broadcast: broadcast),
        );
      },
      child: Stack(
        children: [
          Card.filled(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isEnded
                              ? colorScheme.errorContainer
                              : colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          isEnded
                              ? Symbols.mic_off_rounded
                              : Symbols.mic_rounded,
                          color: isEnded
                              ? colorScheme.onErrorContainer
                              : colorScheme.onPrimaryContainer,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isEnded ? 'Ended' : 'Live',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isEnded
                                    ? colorScheme.onErrorContainer
                                    : colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!isDependency) MeetingPopUp(broadcast: broadcast),
                    ],
                  ),
                ),

                if (broadcast.county != null) ...[
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GeoChipRow(
                      county: broadcast.county,
                      constituency: broadcast.constituency,
                      ward: broadcast.ward,
                    ),
                  ),
                ],

                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: Text(
                    broadcast.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                if (!isDependency && broadcast.participantsCount > 0) ...[
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListenersRow(broadcast: broadcast),
                  ),
                ],

                if (!isDependency) ...[
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainer,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: _HostInfo(broadcast: broadcast),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MeetingPopUp extends StatelessWidget {
  const MeetingPopUp({super.key, required this.broadcast});

  final Broadcast broadcast;

  @override
  Widget build(BuildContext context) {
    return MorePopUp(
      onSelected: (selected) {
        switch (selected) {
          case 'Post':
            context.router.push(PostCreate(broadcast: broadcast));
          case 'Share':
            showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => ShareBottomSheet(broadcast: broadcast),
            );
        }
      },
      texts: const ['Post', 'Share'],
    );
  }
}

class _HostInfo extends StatelessWidget {
  const _HostInfo({required this.broadcast});

  final Broadcast broadcast;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ProfileImage(
              userId: broadcast.host.id,
              username: broadcast.host.username,
              imageUrl: broadcast.host.image,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileName(
                    name: broadcast.host.name,
                    username: broadcast.host.username,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Symbols.verified_rounded,
                          size: 12,
                          color: colorScheme.onPrimaryContainer,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Host',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onPrimaryContainer,
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
        if (broadcast.host.bio.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            broadcast.host.bio,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}

class MeetingBottomSheet extends StatelessWidget {
  const MeetingBottomSheet({super.key, required this.broadcast});

  final Broadcast broadcast;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<BroadcastDetailBloc, BroadcastDetailState>(
      listener: (context, state) {
        if (state is BroadcastLoaded) {
          if (state.broadcast.id == broadcast.id) {
            context.router.popTop();
            state.broadcast.hasEnded
                ? startPip(url: state.broadcast.recordingUrl!)
                : context.router.push(
                    MeetingDetail(broadcastId: state.broadcast.id),
                  );
          }
        }
        if (state is BroadcastDetailFailure) {
          context.router.popTop();
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            getSnackBar(
              context: context,
              message: state.error,
              status: SnackBarStatus.failure,
            ),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              broadcast.title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // Location
            if (broadcast.county != null) ...[
              GeoChipRow(
                county: broadcast.county,
                constituency: broadcast.constituency,
                ward: broadcast.ward,
              ),
              const SizedBox(height: 16),
            ],

            // Description
            if (broadcast.description.isNotEmpty) ...[
              Text(
                broadcast.description,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 20),
            ],

            // Host Info
            _HostInfo(broadcast: broadcast),

            const SizedBox(height: 20),

            // Listeners
            if (broadcast.participantsCount > 0) ...[
              ListenersRow(broadcast: broadcast),

              const SizedBox(height: 24),
            ],

            // Action Button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  if (broadcast.hasEnded) {
                    context.router.popTop();
                    if (broadcast.recordingUrl != null) {
                      showDialog(
                        context: context,
                        builder: (context) => AudioPlayerWidget(
                          audioUrl: broadcast.recordingUrl!,
                        ),
                      );
                    } else {
                      final snackBar = getSnackBar(
                        context: context,
                        message: "Recording not found",
                        status: SnackBarStatus.failure,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  } else {
                    context.read<BroadcastDetailBloc>().add(
                      BroadcastDetailEvent.retrieve(broadcast: broadcast),
                    );
                  }
                },
                icon: Icon(
                  broadcast.hasEnded
                      ? Symbols.play_arrow_rounded
                      : Symbols.login_rounded,
                ),
                label: Text(
                  broadcast.hasEnded ? 'Play Recording' : 'Join Meeting',
                ),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class ListenersRow extends StatelessWidget {
  const ListenersRow({super.key, required this.broadcast});

  final Broadcast broadcast;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final numberFormat = NumberFormat.compact(locale: "en_US");
    final listeners = broadcast.participants.take(5).toList();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Avatar stack
        SizedBox(
          height: 34,
          width: listeners.isEmpty ? 0 : 20.0 + (listeners.length * 20.0),
          child: Stack(
            children: listeners.asMap().entries.map((entry) {
              final index = entry.key;
              final user = entry.value;
              return Positioned(
                left: index * 20.0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    child: ProfileImage(
                      userId: user.id,
                      username: user.username,
                      imageUrl: user.image,
                      radius: 13,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        if (broadcast.participantsCount > 0) ...[
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Symbols.group_rounded,
                  size: 14,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  '${numberFormat.format(broadcast.participantsCount)} listening',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
