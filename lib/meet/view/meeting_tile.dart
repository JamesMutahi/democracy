import 'package:democracy/app/utils/custom_bottom_sheet.dart';
import 'package:democracy/app/utils/more_pop_up.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/meet/view/meeting_detail.dart';
import 'package:democracy/post/view/post_create.dart';
import 'package:flutter/material.dart';

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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MeetingDetail(meeting: meeting),
          ),
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
            child: Text(meeting.title),
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
