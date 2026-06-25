import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/custom_bottom_sheet.dart';
import 'package:democracy/app/shared/widgets/more_pop_up.dart';
import 'package:democracy/app/shared/widgets/share_bottom_sheet.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/shared/widgets/video_pip.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/geo/view/widgets/geo_chip.dart';
import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          shape: const BeveledRectangleBorder(),
          builder: (BuildContext context) {
            return MeetingBottomSheet(broadcast: broadcast);
          },
        );
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 15,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isDependency
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (broadcast.county != null)
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: GeoChipRow(
                            county: broadcast.county,
                            constituency: broadcast.constituency,
                            ward: broadcast.ward,
                          ),
                        ),
                      Text(
                        broadcast.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      if (!isDependency) SizedBox(height: 10),
                      if (!isDependency) ListenersRow(broadcast: broadcast),
                    ],
                  ),
                ),
                if (!isDependency)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.tertiaryContainer.withValues(alpha: 0.6),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: _HostInfo(broadcast: broadcast),
                  ),
              ],
            ),
          ),
          if (!isDependency)
            Align(
              alignment: Alignment.topRight,
              child: MeetingPopUp(broadcast: broadcast),
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
            context.router.push(PostCreateRoute(broadcast: broadcast));
          case 'Share':
            showModalBottomSheet<void>(
              context: context,
              shape: const BeveledRectangleBorder(),
              builder: (BuildContext context) {
                return ShareBottomSheet(broadcast: broadcast);
              },
            );
        }
      },
      texts: ['Post', 'Share'],
    );
  }
}

class _HostInfo extends StatelessWidget {
  const _HostInfo({required this.broadcast});

  final Broadcast broadcast;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        Row(
          children: [
            ProfileImage(user: broadcast.host),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileName(user: broadcast.host),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text('Host'),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 5),
        if (broadcast.host.bio.isNotEmpty)
          Text(
            broadcast.host.bio,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
      ],
    );
  }
}

class MeetingBottomSheet extends StatelessWidget {
  const MeetingBottomSheet({super.key, required this.broadcast});

  final Broadcast broadcast;

  @override
  Widget build(BuildContext context) {
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
          final snackBar = getSnackBar(
            context: context,
            message: state.error,
            status: SnackBarStatus.failure,
          );
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: CustomBottomSheet(
        title: broadcast.title,
        children: [
          if (broadcast.county != null)
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: GeoChipRow(
                county: broadcast.county,
                constituency: broadcast.constituency,
                ward: broadcast.ward,
              ),
            ),
          Text(broadcast.description),
          SizedBox(height: 5),
          _HostInfo(broadcast: broadcast),
          SizedBox(height: 5),
          ListenersRow(broadcast: broadcast),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.bottomCenter,
            child: OutlinedButton(
              onPressed: () {
                if (broadcast.hasEnded) {
                  context.router.popTop();
                  startPip(url: broadcast.recordingUrl!);
                } else {
                  context.read<BroadcastDetailBloc>().add(
                    BroadcastDetailEvent.retrieve(broadcast: broadcast),
                  );
                }
              },
              child: Text(broadcast.hasEnded ? 'Play recording' : 'Join'),
            ),
          ),
        ],
      ),
    );
  }
}

class ListenersRow extends StatelessWidget {
  const ListenersRow({super.key, required this.broadcast});

  final Broadcast broadcast;

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat.compact(locale: "en_UK");
    final listeners = broadcast.participants.take(5).toList();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            ...listeners.map((user) {
              return Container(
                margin: EdgeInsets.only(left: listeners.indexOf(user) * 15),
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: Theme.of(context).cardColor,
                  child: ProfileImage(user: user, radius: 15),
                ),
              );
            }),
          ],
        ),
        if (broadcast.participantsCount > 0) SizedBox(width: 10),
        Text('${numberFormat.format(broadcast.participantsCount)} listening'),
      ],
    );
  }
}
