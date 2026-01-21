import 'package:democracy/app/utils/custom_bottom_sheet.dart';
import 'package:democracy/app/utils/more_pop_up.dart';
import 'package:democracy/meet/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/meet/view/meeting_detail.dart';
import 'package:democracy/post/view/post_create.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              color: Theme.of(
                context,
              ).colorScheme.secondaryContainer.withValues(alpha: 0.7),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostCreate(meeting: meeting),
              ),
            );
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
        if (state is MeetingJoined) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MeetingDetail(meeting: meeting),
            ),
          );
        }
      },
      child: CustomBottomSheet(
        title: 'Meeting',
        children: [
          Text(meeting.title, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 5),
          Text(meeting.description),
          SizedBox(height: 5),
          ListenersRow(meeting: meeting),
          _HostInfo(meeting: meeting),
          SizedBox(height: 5),
          OutlinedButton(
            onPressed: () {
              context.read<MeetingDetailBloc>().add(
                MeetingDetailEvent.join(meeting: meeting),
              );
            },
            child: Text('Join'),
          ),
        ],
      ),
    );
  }
}
