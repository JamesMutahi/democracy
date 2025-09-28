import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/meet/view/meetings.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';

class MeetingsPage extends StatefulWidget {
  const MeetingsPage({super.key, required this.user, required this.notifications});

  final User user;
  final int notifications;

  @override
  State<MeetingsPage> createState() => _MeetingsPageState();
}

class _MeetingsPageState extends State<MeetingsPage> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, bool innerBoxIsScrolled) {
        return [
          CustomAppBar(
            user: widget.user,
            notifications: widget.notifications,
            middle: [
              AppBarSearchBar(
                hintText: 'Search meetings',
                onChanged: (value) {
                  //TODO:
                },
                showFilterIcon: true,
                onFilterTap: () {
                  //   TODO:
                },
              ),
            ],
          ),
        ];
      },
      body: Meetings(),
    );
  }
}
