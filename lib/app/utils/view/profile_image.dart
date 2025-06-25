import 'package:democracy/auth/models/user.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(user.image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
