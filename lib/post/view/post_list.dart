import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_tile.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PostDetailCubit, PostDetailState>(
          listener: (context, state) {
            switch (state) {
              case PostCreated(post: final post):
                if (_posts.any((element) => element.id == post.repostOf?.id)) {
                  setState(() {
                    _posts[_posts.indexWhere(
                          (element) => element.id == post.repostOf!.id,
                        )] =
                        post.repostOf!;
                  });
                }
                if (_posts.any((element) => element.id == post.replyTo?.id)) {
                  setState(() {
                    _posts[_posts.indexWhere(
                          (element) => element.id == post.replyTo!.id,
                        )] =
                        post.replyTo!;
                  });
                }
              case PostUpdated(post: final post):
                if (_posts.any((element) => element.id == post.id)) {
                  setState(() {
                    _posts[_posts.indexWhere(
                          (element) => element.id == post.id,
                        )] =
                        post;
                  });
                }
              case PostDeleted(:final postId):
                if (_posts.any((element) => element.id == postId)) {
                  setState(() {
                    _posts.removeWhere((element) => element.id == postId);
                  });
                }
            }
          },
        ),
        BlocListener<UserDetailCubit, UserDetailState>(
          listener: (context, state) {
            if (state is UserUpdated) {
              List<Post> userPosts =
                  _posts
                      .where((post) => post.author.id == state.user.id)
                      .toList();
              if (userPosts.isNotEmpty) {
                setState(() {
                  for (Post post in userPosts) {
                    _posts[_posts.indexWhere((p) => p.id == post.id)] = post
                        .copyWith(author: state.user);
                  }
                });
              }
            }
          },
        ),
      ],
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
