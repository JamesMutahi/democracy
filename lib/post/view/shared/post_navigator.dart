import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/bloc/replies/replies_bloc.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/community_note_detail.dart';
import 'package:democracy/post/view/post_create.dart';
import 'package:democracy/post/view/post_detail.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void navigateToPostDetail({
  required BuildContext context,
  required Post post,
  required bool showAsRepost,
  required Post repost,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                RepliesBloc(webSocketService: context.read<WebSocketService>()),
          ),
          BlocProvider(
            create: (context) =>
                ReplyToBloc(webSocketService: context.read<WebSocketService>()),
          ),
        ],
        child: PostDetailPage(
          post: post,
          showAsRepost: showAsRepost,
          repost: repost,
        ),
      ),
    ),
  );
}

void navigateToCommunityNoteDetail({
  required BuildContext context,
  required Post post,
  required bool showAsRepost,
  required Post repost,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                RepliesBloc(webSocketService: context.read<WebSocketService>()),
          ),
          BlocProvider(
            create: (context) =>
                ReplyToBloc(webSocketService: context.read<WebSocketService>()),
          ),
        ],
        child: CommunityNoteDetail(
          communityNote: post,
          showAsRepost: showAsRepost,
          repost: repost,
        ),
      ),
    ),
  );
}

void navigateToPostCreate({
  required BuildContext context,
  Post? replyTo,
  Post? repostOf,
  Ballot? ballot,
  Survey? survey,
  Petition? petition,
  Meeting? meeting,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                RepliesBloc(webSocketService: context.read<WebSocketService>()),
          ),
          BlocProvider(
            create: (context) =>
                ReplyToBloc(webSocketService: context.read<WebSocketService>()),
          ),
        ],
        child: PostCreatePage(
          replyTo: replyTo,
          repostOf: repostOf,
          ballot: ballot,
          survey: survey,
          petition: petition,
          meeting: meeting,
        ),
      ),
    ),
  );
}
