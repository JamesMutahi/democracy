import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/ballot/view/ballot_detail.dart';
import 'package:democracy/chat/view/chat_detail.dart';
import 'package:democracy/notification/models/notification.dart' as n_;
import 'package:democracy/post/view/post_detail.dart';
import 'package:democracy/survey/view/survey_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.notification});

  final n_.Notification notification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        notification.post != null
            ? Symbols.post_rounded
            : notification.ballot != null
            ? Symbols.how_to_vote
            : notification.survey != null
            ? Symbols.assignment_rounded
            : notification.chat != null
            ? Symbols.email_rounded
            : Symbols.info_i_rounded,
      ),
      title: Text(notification.text),
      subtitle: Text(
        notification.post != null
            ? notification.post!.body
            : notification.ballot != null
            ? notification.ballot!.title
            : notification.survey != null
            ? notification.survey!.name
            : notification.chat != null
            ? notification.chat!.lastMessage!.text
            : '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing:
          notification.isRead
              ? SizedBox()
              : Icon(Icons.circle_rounded, size: 7, color: Colors.green),
      onTap: () {
        context.read<WebsocketBloc>().add(
          WebsocketEvent.markNotificationAsRead(notification: notification),
        );
        if (notification.post != null) {
          bool showAsRepost =
              notification.post!.body.isEmpty &&
              notification.post!.repostOf != null;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder:
                  (context) => PostDetail(
                    post:
                        showAsRepost
                            ? notification.post!.repostOf!
                            : notification.post!,
                    showAsRepost: showAsRepost,
                    repost: notification.post!,
                  ),
            ),
          );
        }
        if (notification.ballot != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BallotDetail(ballot: notification.ballot!),
            ),
          );
        }
        if (notification.survey != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SurveyDetail(survey: notification.survey!),
            ),
          );
        }
        if (notification.chat != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChatDetail(chat: notification.chat!),
            ),
          );
        }
      },
    );
  }
}
