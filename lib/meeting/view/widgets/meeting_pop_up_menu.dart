import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/post/view/shared/post_navigator.dart'
    show navigateToPostCreate;
import 'package:flutter/material.dart';

class MeetingPopUpMenu extends StatelessWidget {
  const MeetingPopUpMenu({super.key, required this.meeting});

  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      menuPadding: EdgeInsets.zero,
      onSelected: (selected) {
        switch (selected) {
          case 'Post':
            navigateToPostCreate(context: context, meeting: meeting);
        }
      },
      borderRadius: BorderRadius.circular(50),
      itemBuilder: (BuildContext context) => [
        ...['Post'].map((text) {
          return PopupMenuItem<String>(
            value: text,
            child: Text(text, textAlign: TextAlign.center),
          );
        }),
      ],
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Icon(Icons.keyboard_arrow_down),
      ),
    );
  }
}
