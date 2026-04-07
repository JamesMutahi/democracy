import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/petition/bloc/user_petitions/user_petitions_bloc.dart';
import 'package:democracy/post/bloc/likes/likes_bloc.dart';
import 'package:democracy/post/bloc/user_community_notes/user_community_notes_bloc.dart';
import 'package:democracy/post/bloc/user_posts/user_posts_bloc.dart';
import 'package:democracy/post/bloc/user_replies/user_replies_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void navigateToProfilePage({
  required BuildContext context,
  required User user,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserPostsBloc(
              webSocketService: context.read<WebSocketService>(),
            ),
          ),
          BlocProvider(
            create: (context) => UserRepliesBloc(
              webSocketService: context.read<WebSocketService>(),
            ),
          ),
          BlocProvider(
            create: (context) =>
                LikesBloc(webSocketService: context.read<WebSocketService>()),
          ),
          BlocProvider(
            create: (context) => UserCommunityNotesBloc(
              webSocketService: context.read<WebSocketService>(),
            ),
          ),
          BlocProvider(
            create: (context) => UserPetitionsBloc(
              webSocketService: context.read<WebSocketService>(),
            ),
          ),
        ],
        child: ProfilePage(user: user),
      ),
    ),
  );
}
