import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/models/room.dart';
import 'package:flutter/material.dart';

class RoomDetail extends StatelessWidget {
  const RoomDetail({
    super.key,
    required this.title,
    required this.room,
    required this.otherUser,
  });

  final String title;
  final Room room;
  final User otherUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ProfileImage(user: otherUser),
            SizedBox(width: 10),
            Text(title),
          ],
        ),
      ),
      body: Placeholder(),
    );
  }
}
