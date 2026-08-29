import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({super.key, required this.name, required this.username});

  final String name;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      maxLines: 1,
      style: TextStyle(overflow: TextOverflow.ellipsis),
      TextSpan(
        children: [
          TextSpan(
            text: name,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: ' @$username',
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
        ],
      ),
    );
  }
}
