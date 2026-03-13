import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_widget_selector.dart';
import 'package:flutter/material.dart';

class ReplyTos extends StatelessWidget {
  const ReplyTos({super.key, required this.replyTos});

  final List<Post> replyTos;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        Post post = replyTos[index];
        return PostWidgetSelector(
          key: ValueKey(post.id),
          post: post,
          showTopThread: post.replyTo != null || post.communityNoteOf != null,
          showBottomThread: true,
          hideBorder: true,
        );
      }, childCount: replyTos.length),
    );
  }
}
