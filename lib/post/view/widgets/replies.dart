import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:flutter/material.dart';

class Replies extends StatelessWidget {
  const Replies({super.key, required this.replies});

  final List<Post> replies;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        Post reply = replies[index];
        return PostTile(
          key: ValueKey(reply.id),
          post: reply,
          checkVisibility: true,
          showThreadedReplies: reply.thread.isEmpty ? false : true,
          showBottomThread: reply.thread.isEmpty ? false : true,
        );
      }, childCount: replies.length),
    );
  }
}
