import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/post/bloc/replies/replies_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_list.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Replies extends StatelessWidget {
  const Replies({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepliesCubit, RepliesState>(
      builder: (context, state) {
        switch (state) {
          case RepliesLoaded():
            List<Post> posts = state.posts.toList();
            return PostList(posts: posts);
          case RepliesFailure():
            return FailureRetryButton(
              onPressed: () {
                context.read<RepliesCubit>().retryButtonPressed();
                context.read<WebsocketBloc>().add(
                  WebsocketEvent.getReplies(post: post),
                );
              },
            );
          default:
            return const LoadingIndicator();
        }
      },
    );
  }
}
