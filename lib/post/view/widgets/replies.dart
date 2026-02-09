import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:flutter/material.dart';

class Replies extends StatelessWidget {
  const Replies({super.key, required this.replies});

  final List<Post> replies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        Post post = replies[index];
        return PostTile(
          key: ValueKey(post.id),
          post: post,
          checkVisibility: true,
          showThreadedReplies: post.thread.isEmpty ? false : true,
          showBottomThread: post.thread.isEmpty ? false : true,
        );
      },
      itemCount: replies.length,
    );
  }
}
