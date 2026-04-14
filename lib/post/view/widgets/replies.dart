import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/shared/add_post_view.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:flutter/material.dart';

class Replies extends StatelessWidget {
  const Replies({
    super.key,
    required this.replies,
    required this.expandedReplies,
    required this.onExpand,
    required this.onRepliesUpdated,
    required this.onThreadUpdated,
  });

  final List<Post> replies;
  final List<int> expandedReplies;
  final Function(Post) onExpand;
  final Function(List<Post>) onRepliesUpdated;
  final Function(Post) onThreadUpdated;

  @override
  Widget build(BuildContext context) {
    return PostListener(
      posts: replies,
      onPostsUpdated: onRepliesUpdated,
      child: SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          Post reply = replies[index];
          return PostTile(
            key: ValueKey(reply.id),
            post: reply,
            checkVisibility: true,
            showThreadedReplies: reply.thread.isNotEmpty,
            showBottomThread: reply.thread.isNotEmpty,
            onViewed: () {
              addPostView(context, 'Replies', reply);
            },
            isExpanded: expandedReplies.contains(reply.id),
            onExpand: onExpand,
            onThreadUpdated: onThreadUpdated,
          );
        }, childCount: replies.length),
      ),
    );
  }
}
