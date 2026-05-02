import 'package:democracy/app/shared/widgets/custom_bottom_sheet.dart';
import 'package:democracy/app/shared/widgets/more_pop_up.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/geo/view/widgets/geo_chip.dart';
import 'package:democracy/meeting/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/meeting/view/meeting_detail.dart';
import 'package:democracy/post/view/shared/post_navigator.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MeetingTile extends StatelessWidget {
  const MeetingTile({
    super.key,
    required this.meeting,
    required this.isDependency,
  });

  final Meeting meeting;
  final bool isDependency;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          shape: const BeveledRectangleBorder(),
          builder: (BuildContext context) {
            return MeetingBottomSheet(meeting: meeting);
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
                      if (meeting.county != null)
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: GeoChipRow(
                            county: meeting.county,
                            constituency: meeting.constituency,
                            ward: meeting.ward,
                          ),
                        ),
                      Row(
                        children: [
                          Icon(Icons.mic_rounded),
                          SizedBox(width: 5),
                          Text(
                            'LIVE',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        meeting.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      if (!isDependency) SizedBox(height: 10),
                      if (!isDependency) ListenersRow(meeting: meeting),
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
                    child: _HostInfo(meeting: meeting),
                  ),
              ],
            ),
          ),
          if (!isDependency)
            Align(
              alignment: Alignment.topRight,
              child: MeetingPopUp(meeting: meeting),
            ),
        ],
      ),
    );
  }
}

class MeetingPopUp extends StatelessWidget {
  const MeetingPopUp({super.key, required this.meeting});

  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    return MorePopUp(
      onSelected: (selected) {
        switch (selected) {
          case 'Post':
            navigateToPostCreate(context: context, meeting: meeting);
          case 'Share':
            showModalBottomSheet<void>(
              context: context,
              shape: const BeveledRectangleBorder(),
              builder: (BuildContext context) {
                return ShareBottomSheet(meeting: meeting);
              },
            );
        }
      },
      texts: ['Post', 'Share'],
    );
  }
}

class _HostInfo extends StatelessWidget {
  const _HostInfo({required this.meeting});

  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        Row(
          children: [
            ProfileImage(user: meeting.host),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileName(user: meeting.host),
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
        if (meeting.host.bio.isNotEmpty)
          Text(meeting.host.bio, maxLines: 2, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}

class MeetingBottomSheet extends StatelessWidget {
  const MeetingBottomSheet({super.key, required this.meeting});

  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MeetingDetailBloc, MeetingDetailState>(
      listener: (context, state) {
        if (state is MeetingLoaded) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MeetingDetail(meeting: state.meeting),
            ),
          );
        }
        if (state is MeetingDetailFailure) {
          Navigator.pop(context);
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
        title: meeting.title,
        children: [
          if (meeting.county != null)
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: GeoChipRow(
                county: meeting.county,
                constituency: meeting.constituency,
                ward: meeting.ward,
              ),
            ),
          Text(meeting.description),
          SizedBox(height: 5),
          _HostInfo(meeting: meeting),
          SizedBox(height: 5),
          ListenersRow(meeting: meeting),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.bottomCenter,
            child: OutlinedButton(
              onPressed: () {
                context.read<MeetingDetailBloc>().add(
                  MeetingDetailEvent.retrieve(meeting: meeting),
                );
              },
              child: Text('Join'),
            ),
          ),
        ],
      ),
    );
  }
}

class ListenersRow extends StatelessWidget {
  const ListenersRow({super.key, required this.meeting});

  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat.compact(locale: "en_UK");
    final listeners = meeting.participants.take(5).toList();
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
                  child: ProfileImage(user: user, radius: 15,),
                ),
              );
            }),
          ],
        ),
        if (meeting.participantsCount > 0) SizedBox(width: 10),
        Text('${numberFormat.format(meeting.participantsCount)} listening'),
      ],
    );
  }
}
