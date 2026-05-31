import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/user/models/user.dart';
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
          ? () => context.router.push(ProfileRoute(userId: user.id))
          : null,
      child: CircleAvatar(
        radius: radius,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: user.image,
            cacheKey: 'profile_${user.id}',
            fit: BoxFit.cover,
            width: radius * 2,
            height: radius * 2,
            placeholder: (context, url) => _buildPlaceholder(),
            errorWidget: (context, url, error) => _buildErrorWidget(),
            fadeInDuration: const Duration(milliseconds: 200),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[300],
      child: Icon(Icons.person, size: 24, color: Colors.grey[600]),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      color: Colors.grey[300],
      child: Icon(
        Icons.broken_image_rounded,
        size: 24,
        color: Colors.grey[600],
      ),
    );
  }
}
