import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/chat/view/utils/last_message.dart';
import 'package:democracy/broadcast/view/widgets/meeting_tile.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:democracy/post/view/widgets/post_body.dart';
import 'package:democracy/survey/view/widgets/survey_tile.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.notification});

  final n_.Notification notification;

  @override
  Widget build(BuildContext context) {
    late Icon icon;
    late Widget title;
    late Widget subtitle;
    void Function() onTap;
    String usersText = '';
    List<User> users = notification.users;
    if (users.isNotEmpty) {
      usersText =
          '${users.first.name} ${users.length > 1 ? 'and ${users.length - 1} ${(users.length - 1) == 1 ? 'other' : 'others'} ' : ''}${notification.text}';
    }
    if (notification.isLike) {
      icon = Icon(Symbols.favorite, color: Colors.red, fill: 1);
      title = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _UsersRow(users: users),
          Text(usersText),
        ],
      );
      subtitle = PostBody(post: notification.post!);
      onTap = () {
        context.router.push(PostDetail(postId: notification.post!.id));
      };
    } else if (notification.isFollow) {
      icon = Icon(Symbols.person);
      title = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _UsersRow(users: users),
          Text(usersText),
        ],
      );
      subtitle = SizedBox.shrink();
      onTap = () {
        if (notification.users.length == 1) {
          context.router.push(
            ProfileRoute(userId: notification.users.first.id),
          );
        } else {
          context.router.push(
            UsersRoute(title: 'New followers', users: notification.users),
          );
        }
      };
    } else if (notification.isSupport) {
      icon = Icon(Symbols.person);
      title = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _UsersRow(users: users),
          Text(usersText),
        ],
      );
      subtitle = SizedBox.shrink();
      onTap = () {
        if (notification.users.length == 1) {
          context.router.push(
            ProfileRoute(userId: notification.users.first.id),
          );
        } else {
          context.router.push(
            UsersRoute(title: 'New supporters', users: notification.users),
          );
        }
      };
    } else if (notification.post != null) {
      icon = Icon(Symbols.post_rounded);
      title = Text(notification.text);
      subtitle = PostBody(post: notification.post!);
      onTap = () {
        context.router.push(PostDetail(postId: notification.post!.id));
      };
    } else if (notification.ballot != null) {
      icon = Icon(Symbols.how_to_vote);
      title = Text(notification.text);
      subtitle = Text(
        notification.ballot!.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
      onTap = () {
        context.router.push(BallotDetail(ballotId: notification.ballot!.id));
      };
    } else if (notification.broadcast != null) {
      icon = Icon(Symbols.meeting_room);
      title = Text(notification.text);
      subtitle = Text(
        notification.broadcast!.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
      onTap = () {
        showModalBottomSheet<void>(
          context: context,
          shape: const BeveledRectangleBorder(),
          builder: (BuildContext context) {
            return MeetingBottomSheet(broadcast: notification.broadcast!);
          },
        );
      };
    } else if (notification.survey != null) {
      icon = Icon(Symbols.assignment_rounded);
      title = Text(notification.text);
      subtitle = Text(
        notification.survey!.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
      onTap = () {
        showModalBottomSheet<void>(
          context: context,
          shape: const BeveledRectangleBorder(),
          builder: (BuildContext context) {
            return SurveyBottomSheet(survey: notification.survey!);
          },
        );
      };
    } else if (notification.petition != null) {
      icon = Icon(Symbols.assignment_rounded);
      title = Text(notification.text);
      subtitle = Text(
        notification.petition!.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
      onTap = () {
        context.router.push(
          PetitionDetail(petitionId: notification.petition!.id),
        );
      };
    } else if (notification.chat != null) {
      icon = Icon(Symbols.email_rounded);
      title = Text(notification.text);
      subtitle = Text(
        getLastMessageText(notification.message!, ''),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
      onTap = () {
        context.router.push(ChatDetail(chatId: notification.chat!.id));
      };
    } else {
      icon = Icon(Symbols.info_i_rounded);
      title = Text(notification.text);
      subtitle = Text('Missing info');
      onTap = () {};
    }

    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      leading: Container(margin: EdgeInsets.only(top: 5), child: icon),
      title: title,
      subtitle: subtitle,
      trailing: notification.isRead
          ? SizedBox()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.circle_rounded, size: 7, color: Colors.blue),
              ],
            ),
      onTap: () {
        context.read<NotificationDetailBloc>().add(
          NotificationDetailEvent.markAsRead(notification: notification),
        );
        onTap();
      },
    );
  }
}

class _UsersRow extends StatelessWidget {
  const _UsersRow({required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            ...users.map((user) {
              return Container(
                margin: EdgeInsets.only(left: users.indexOf(user) * 15),
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: Theme.of(context).cardColor,
                  child: CircleAvatar(
                    radius: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(user.image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
