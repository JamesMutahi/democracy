import 'package:democracy/ballot/view/ballot_detail.dart';
import 'package:democracy/chat/view/utils/chat_navigator.dart';
import 'package:democracy/meet/view/meeting_tile.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:democracy/petition/view/petition_detail.dart';
import 'package:democracy/post/view/shared/post_navigator.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:democracy/user/view/utils/profile_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.notification});

  final n_.Notification notification;

  @override
  Widget build(BuildContext context) {
    late Icon icon;
    String subtitle = '';
    void Function() onTap;
    if (notification.post != null) {
      bool isLike = notification.text.contains('like');
      icon = Icon(
        isLike ? Symbols.favorite : Symbols.post_rounded,
        color: isLike ? Colors.red : null,
        fill: isLike ? 1 : 0,
      );
      subtitle = notification.post!.body;
      onTap = () {
        bool showAsRepost =
            notification.post!.body.isEmpty &&
            notification.post!.repostOf != null;
        navigateToPostDetail(
          context: context,
          post: showAsRepost
              ? notification.post!.repostOf!
              : notification.post!,
          showAsRepost: showAsRepost,
          repost: notification.post!,
        );
      };
    } else if (notification.ballot != null) {
      icon = Icon(Symbols.how_to_vote);
      subtitle = notification.ballot!.title;
      onTap = () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BallotDetail(ballot: notification.ballot!),
          ),
        );
      };
    } else if (notification.meeting != null) {
      icon = Icon(Symbols.meeting_room);
      subtitle = notification.meeting!.title;
      onTap = () {
        showModalBottomSheet<void>(
          context: context,
          shape: const BeveledRectangleBorder(),
          builder: (BuildContext context) {
            return MeetingBottomSheet(meeting: notification.meeting!);
          },
        );
      };
    } else if (notification.survey != null) {
      icon = Icon(Symbols.assignment_rounded);
      subtitle = notification.survey!.title;
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
      subtitle = notification.petition!.title;
      onTap = () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                PetitionDetail(petition: notification.petition!),
          ),
        );
      };
    } else if (notification.chat != null) {
      icon = Icon(Symbols.email_rounded);
      subtitle = notification.chat!.lastMessage!.text;
      onTap = () {
        navigateToChatDetail(context: context, chat: notification.chat!);
      };
    } else if (notification.user != null) {
      icon = Icon(Symbols.person);
      subtitle = notification.user!.name;
      onTap = () {
        navigateToProfilePage(context: context, user: notification.user!);
      };
    } else {
      icon = Icon(Symbols.info_i_rounded);
      subtitle = 'Missing info';
      onTap = () {};
    }

    return ListTile(
      leading: icon,
      title: Text(notification.text),
      subtitle: Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: notification.isRead
          ? SizedBox()
          : Icon(Icons.circle_rounded, size: 7, color: Colors.green),
      onTap: () {
        context.read<NotificationDetailBloc>().add(
          NotificationDetailEvent.markAsRead(notification: notification),
        );
        onTap();
      },
    );
  }
}
