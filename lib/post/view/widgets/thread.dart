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
  final Function(Post) onExpand;
  final Function(Post) onThreadUpdated;

  @override
  Widget build(BuildContext context) {
    List<Post> replies = reply.thread.toList();

    return PostListener(
      posts: replies,
      onPostsUpdated: (posts) {
        var newReply = reply.copyWith(thread: posts);
        onThreadUpdated(newReply);
      },
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          Post post = replies[index];
          return Column(
            children: [
              PostTile(
                key: ValueKey(post.id),
                post: post,
                showTopThread: true,
                showBottomThread: replies.length != index + 1,
                hideBorder: true,
              ),
              if (!isExpanded && replies.length > 1)
                Container(
                  margin: EdgeInsets.only(left: 22, bottom: 10),
                  child: InkWell(
                    onTap: () {
                      onExpand(reply);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.more_vert,
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 17),
                          child: Text(
                            'Show more',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
        itemCount: isExpanded ? replies.length : replies.take(1).length,
      ),
    );
  }
}
