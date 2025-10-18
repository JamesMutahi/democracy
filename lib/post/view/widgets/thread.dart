import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:flutter/material.dart';

class Thread extends StatefulWidget {
  const Thread({super.key, required this.post, required this.showWholeThread});

  final Post post;
  final bool showWholeThread;

  @override
  State<Thread> createState() => _ThreadState();
}

class _ThreadState extends State<Thread> {
  late List<Post> _posts = widget.post.thread.toList();
  late bool showWholeThread = widget.showWholeThread;

  @override
  Widget build(BuildContext context) {
    return PostListener(
      posts: _posts,
      onPostsUpdated: (posts) {
        setState(() {
          _posts = posts;
        });
      },
      child: !showWholeThread
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostTile(
                  key: ValueKey(_posts.first.id),
                  post: _posts.first,
                  showTopThread: true,
                  showBottomThread: _posts.first.thread.isEmpty ? false : true,
                  showThreadedReplies: false,
                  hideBorder: true,
                  showWholeThread: showWholeThread,
                ),
                if (_posts.first.thread.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(left: 27, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showWholeThread = true;
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
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
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                Post post = _posts[index];
                return PostTile(
                  key: ValueKey(post.id),
                  post: post,
                  showTopThread: true,
                  showBottomThread: post.thread.isEmpty ? false : true,
                  showThreadedReplies: post.thread.isEmpty ? false : true,
                  showWholeThread: true,
                  hideBorder: true,
                );
              },
              itemCount: _posts.length,
            ),
    );
  }
}
