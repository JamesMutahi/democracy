import 'package:cached_network_image/cached_network_image.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/utils/profile_navigator.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.user,
    this.navigateToProfile = false,
    this.radius = 20,
  });

  final User user;
  final bool navigateToProfile;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      onTap: navigateToProfile
          ? () => navigateToProfilePage(context: context, user: user)
          : null,
      child: CircleAvatar(
        radius: radius,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                user.image,
                cacheKey: 'profile ${user.id}',
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
