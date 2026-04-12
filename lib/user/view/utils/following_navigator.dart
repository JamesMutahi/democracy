import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/user/bloc/followers/followers_bloc.dart';
import 'package:democracy/user/bloc/following/following_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/pages/following.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void navigateToFollowingPage({
  required BuildContext context,
  required User user,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FollowingBloc(
              webSocketService: context.read<WebSocketService>(),
            ),
          ),
          BlocProvider(
            create: (context) => FollowersBloc(
              webSocketService: context.read<WebSocketService>(),
            ),
          ),
        ],
        child: FollowingPage(user: user),
      ),
    ),
  );
}
