import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/profile.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.user, this.onTap});

  final User user;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      onTap:
          onTap ??
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage(user: user)),
          ),
      child: CircleAvatar(
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
      ),
    );
  }
}
