import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/live/view/rooms.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';

class LivePage extends StatefulWidget {
  const LivePage({super.key, required this.user, required this.notifications});

  final User user;
  final int notifications;

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
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
                hintText: 'Search rooms',
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
      body: Rooms(),
    );
  }
}
