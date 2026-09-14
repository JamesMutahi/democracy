import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/view/widgets/meeting_tile.dart';
import 'package:democracy/chat/view/utils/last_message.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:democracy/post/view/widgets/post_body.dart';
import 'package:democracy/survey/view/widgets/survey_tile.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.notification});

  final n_.Notification notification;

  @override
  Widget build(BuildContext context) {
    final content = _getContent(context);
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: colorScheme.surfaceContainerHighest,
        child: SvgPicture.asset(
          content.asset,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            colorScheme.onPrimaryContainer,
            BlendMode.srcIn,
          ),
        ),
      ),
      title: content.title,
      subtitle: content.subtitle,
      trailing: notification.isRead
          ? null
          : Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
      onTap: () {
        // Only mark as read if it's actually unread to save unnecessary Bloc events
        if (!notification.isRead) {
          context.read<NotificationDetailBloc>().add(
            NotificationDetailEvent.markAsRead(notification: notification),
          );
        }
        content.onTap();
      },
    );
  }

  _NotificationContent _getContent(BuildContext context) {
    final users = notification.users;
    final String usersText = users.isNotEmpty
        ? '${users.first.name} ${users.length > 1 ? 'and ${users.length - 1} ${(users.length - 1) == 1 ? 'other' : 'others'} ' : ''}${notification.text}'
        : notification.text;

    final titleStyle = Theme.of(context).textTheme.bodyMedium;
    final subtitleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );

    if (notification.type == n_.NotificationType.like) {
      return _NotificationContent(
        asset: 'assets/icons/heart.svg',
        iconColor: Colors.red,
        iconFilled: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (users.isNotEmpty) _UsersRow(users: users),
            Text(
              usersText,
              style: titleStyle?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        subtitle: PostBody(post: notification.post!),
        onTap: () =>
            context.router.push(PostDetail(postId: notification.post!.id)),
      );
    }

    if (notification.type == n_.NotificationType.follow) {
      return _NotificationContent(
        asset: 'assets/icons/person-add.svg',
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (users.isNotEmpty) _UsersRow(users: users),
            Text(
              usersText,
              style: titleStyle?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        subtitle: const SizedBox.shrink(),
        onTap: () {
          if (users.length == 1) {
            context.router.push(ProfileRoute(username: users.first.username));
          } else {
            context.router.push(
              UsersRoute(title: 'New followers', users: users),
            );
          }
        },
      );
    }

    if (notification.type == n_.NotificationType.support) {
      return _NotificationContent(
        asset: 'assets/icons/digital-signature.svg',
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (users.isNotEmpty) _UsersRow(users: users),
            Text(
              usersText,
              style: titleStyle?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        subtitle: const SizedBox.shrink(),
        onTap: () {
          if (users.length == 1) {
            context.router.push(ProfileRoute(username: users.first.username));
          } else {
            context.router.push(
              UsersRoute(title: 'New supporters', users: users),
            );
          }
        },
      );
    }

    if (notification.post != null) {
      return _NotificationContent(
        asset: 'assets/icons/document-add.svg',
        title: Text(
          notification.text,
          style: titleStyle?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: PostBody(post: notification.post!),
        onTap: () =>
            context.router.push(PostDetail(postId: notification.post!.id)),
      );
    }

    if (notification.ballot != null) {
      return _NotificationContent(
        asset: 'assets/icons/vote.svg',
        title: Text(
          notification.text,
          style: titleStyle?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          notification.ballot!.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: subtitleStyle,
        ),
        onTap: () => context.router.push(
          BallotDetail(ballotId: notification.ballot!.id),
        ),
      );
    }

    if (notification.broadcast != null) {
      return _NotificationContent(
        asset: notification.broadcast!.type == BroadcastType.livestream
            ? 'assets/icons/video.svg'
            : 'assets/icons/microphone.svg',
        title: Text(
          notification.text,
          style: titleStyle?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          notification.broadcast!.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: subtitleStyle,
        ),
        onTap: () => showMeetingInfo(context, notification.broadcast!),
      );
    }

    if (notification.survey != null) {
      return _NotificationContent(
        asset: 'assets/icons/clipboard.svg',
        title: Text(
          notification.text,
          style: titleStyle?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          notification.survey!.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: subtitleStyle,
        ),
        onTap: () {
          if (notification.survey!.hasEnded) {
            context.router.push(
              SurveyDetail(surveyId: notification.survey!.id),
            );
          } else {
            showSurveyInfo(context, notification.survey!);
          }
        },
      );
    }

    if (notification.petition != null) {
      return _NotificationContent(
        asset: 'assets/icons/digital-signature.svg',
        title: Text(
          notification.text,
          style: titleStyle?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          notification.petition!.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: subtitleStyle,
        ),
        onTap: () => context.router.push(
          PetitionDetail(petitionId: notification.petition!.id),
        ),
      );
    }

    if (notification.chat != null) {
      return _NotificationContent(
        asset: 'assets/icons/chat.svg',
        title: Text(
          notification.text,
          style: titleStyle?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          getLastMessageText(notification.message!, ''),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: subtitleStyle,
        ),
        onTap: () =>
            context.router.push(ChatDetail(chatId: notification.chat!.id)),
      );
    }

    // Fallback
    return _NotificationContent(
      asset: 'assets/icons/search.svg',
      title: Text(notification.text, style: titleStyle),
      subtitle: const Text('Missing info'),
      onTap: () {},
    );
  }
}

class _NotificationContent {
  final String asset;
  final Color? iconColor;
  final bool iconFilled;
  final Widget title;
  final Widget subtitle;
  final VoidCallback onTap;

  const _NotificationContent({
    required this.asset,
    this.iconColor,
    this.iconFilled = false,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}

class _UsersRow extends StatelessWidget {
  const _UsersRow({required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...users.asMap().entries.map((entry) {
          final index = entry.key;
          final user = entry.value;
          return Transform.translate(
            offset: Offset(index * -12.0, 0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: CircleAvatar(
                radius: 14,
                backgroundImage: CachedNetworkImageProvider(user.image),
              ),
            ),
          );
        }),
        const SizedBox(width: 12),
      ],
    );
  }
}
