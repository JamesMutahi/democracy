import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:flutter/material.dart';

class Thread extends StatelessWidget {
  const Thread({
    super.key,
    required this.reply,
    required this.isExpanded,
    required this.onExpand,
    required this.onThreadUpdated,
  });

  final Post reply;
  final bool isExpanded;
  final Function(Post)? onExpand;
  final Function(Post) onThreadUpdated;

  @override
  Widget build(BuildContext context) {
    return PostListener(
      posts: reply.thread.toList(),
      onPostsUpdated: (posts) {
        var newReply = reply.copyWith(thread: posts);
        onThreadUpdated(newReply);
      },
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          Post post = reply.thread[index];
          return PostTile(
            key: ValueKey(post.id),
            post: post,
            showTopThread: true,
            showBottomThread: reply.thread.length != index + 1,
            hideBorder: true,
          );
        },
        itemCount: reply.thread.length,
      ),
    );
  }
}
