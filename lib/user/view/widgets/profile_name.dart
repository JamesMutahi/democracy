import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      maxLines: 1,
      style: TextStyle(overflow: TextOverflow.ellipsis),
      TextSpan(
        children: [
          TextSpan(
            text: user.name,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: ' @${user.username}',
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
        ],
      ),
    );
  }
}
