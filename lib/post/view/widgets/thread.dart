import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:flutter/material.dart';

class Thread extends StatefulWidget {
  const Thread({super.key, required this.post});

  final Post post;

  @override
  State<Thread> createState() => _ThreadState();
}

class _ThreadState extends State<Thread> {
  late List<Post> _posts = widget.post.thread.toList();

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
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          Post post = _posts[index];
          return Stack(
            children: [
              Positioned(
                // 23 -> circle avatar radius, 15 -> margin
                left: 23 + 15,
                top: 0,
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 10,
                  width: 2,
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
              PostTile(post: post, showThread: true, hideBorder: true),
            ],
          );
        },
        itemCount: _posts.length,
      ),
    );
  }
}
