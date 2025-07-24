import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:flutter/material.dart';

class PostList extends StatefulWidget {
  const PostList({super.key, required this.posts});

  final List<Post> posts;

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _scrollController = ScrollController();
  late List<Post> _posts = widget.posts.toList();

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
        padding: EdgeInsets.only(bottom: 50),
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          Post post = _posts[index];
          return index >= _posts.length
              ? (_posts.length > 2)
                  ? const BottomLoader()
                  : SizedBox.shrink()
              : PostTile(key: ValueKey(post.id), post: post);
        },
        itemCount: _posts.length,
      ),
    );
  }
}
