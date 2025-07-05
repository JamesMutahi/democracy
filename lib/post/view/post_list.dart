import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_tile.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostList extends StatefulWidget {
  const PostList({super.key, required this.posts});

  final List<Post> posts;

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _scrollController = ScrollController();
  late final List<Post> _posts = widget.posts.toList();

  void _setPostState(post) {
    if (_posts.any((element) => element.id == post.id)) {
      setState(() {
        _posts[_posts.indexWhere((element) => element.id == post.id)] = post;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostDetailCubit, PostDetailState>(
      listener: (context, state) {
        switch (state) {
          case PostUpdated(post: final post):
            _setPostState(post);
        }
      },
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 50),
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return index >= _posts.length
              ? (_posts.length > 2)
                  ? const BottomLoader()
                  : SizedBox.shrink()
              : PostTile(key: ValueKey(index), post: _posts[index]);
        },
        itemCount: _posts.length,
      ),
    );
  }
}
