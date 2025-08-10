import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPostsPopScope extends StatelessWidget {
  const UserPostsPopScope({
    super.key,
    this.user,
    required this.posts,
    required this.child,
  });

  final User? user;
  final List<Post> posts;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        late User currentUser;
        if (state is Authenticated) {
          currentUser = state.user;
        }
        return PopScope(
          canPop: true,
          onPopInvokedWithResult: (_, __) {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.unsubscribeUserPosts(
                user: user ?? currentUser,
                posts: posts,
              ),
            );
          },
          child: child,
        );
      },
    );
  }
}
