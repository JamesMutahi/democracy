import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPopScope extends StatelessWidget {
  const PostsPopScope({
    super.key,
    required this.user,
    required this.posts,
    required this.child,
  });

  final User user;
  final List<Post> posts;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, __) {
        context.read<WebsocketBloc>().add(
          WebsocketEvent.unsubscribeUserPosts(
            user: user,
            posts: posts,
          ),
        );
      },
      child: child,
    );
  }
}
