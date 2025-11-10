import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:flutter/material.dart';

class ReplyToThread extends StatefulWidget {
  const ReplyToThread({super.key, required this.post});

  final Post post;

  @override
  State<ReplyToThread> createState() => _ReplyToThreadState();
}

class _ReplyToThreadState extends State<ReplyToThread> {
  late List<Post> _posts = [];

  @override
  void initState() {
    _posts.add(widget.post.replyTo!);
    _posts.addAll(getReplyTo(widget.post.replyTo!));
    super.initState();
  }

  List<Post> getReplyTo(Post post) {
    List<Post> posts = [];
    if (post.replyTo != null) {
      posts.add(post.replyTo!);
      posts.addAll(getReplyTo(post.replyTo!));
    }
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return PostListener(
      posts: _posts,
      onPostsUpdated: (posts) {
        setState(() {
          _posts = posts;
        });
      },
      child: ListView.builder(
        shrinkWrap: true,
        reverse: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          Post post = _posts[index];
          return PostTile(
            key: ValueKey(post.id),
            post: post,
            showTopThread: post.replyTo != null,
            showBottomThread: true,
            hideBorder: true,
          );
        },
        itemCount: _posts.length,
      ),
    );
  }
}
