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
    return InkWell(
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
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color:
                      isDependency
                          ? Colors.transparent
                          : Theme.of(context).disabledColor.withAlpha(30),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.mic_rounded),
                    SizedBox(width: 5),
                    Text('LIVE'),
                  ],
                ),
                SizedBox(height: 5),
                Text(meeting.title),
                SizedBox(height: 5),
                if (!isDependency) ListenersRow(meeting: meeting),
                if (!isDependency) HostInfo(meeting: meeting),
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

class HostInfo extends StatelessWidget {
  const HostInfo({super.key, required this.meeting});

  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Row(
            children: [
              ProfileImage(user: meeting.host),
              ProfileName(user: meeting.host),
            ],
          ),
          SizedBox(height: 5),
          Text(meeting.host.bio, maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
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
          HostInfo(meeting: meeting),
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
