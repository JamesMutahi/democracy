import 'package:democracy/post/bloc/replies/replies_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Replies extends StatelessWidget {
  const Replies({super.key, required this.replies});

  final List<Post> replies;

  @override
  Widget build(BuildContext context) {
    return PostListener(
      posts: replies,
      onPostsUpdated: (List<Post> posts) {
        context.read<RepliesBloc>().add(RepliesEvent.update(posts: posts));
      },
      child: SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          Post reply = replies[index];
          return PostTile(
            key: ValueKey(reply.id),
            post: reply,
            checkVisibility: true,
            showThreadedReplies: reply.thread.isNotEmpty,
            showBottomThread: reply.thread.isNotEmpty,
          );
        }, childCount: replies.length),
      ),
    );
  }
}
