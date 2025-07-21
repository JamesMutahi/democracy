import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/poll/bloc/poll_detail/poll_detail_cubit.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
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
                String message =
                    state.post.status == PostStatus.published
                        ? state.post.replyTo == null
                            ? 'Posted'
                            : 'Reply sent'
                        : 'Post saved as draft';
                final snackBar = getSnackBar(
                  context: context,
                  message: message,
                  status: SnackBarStatus.success,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // Update posts if post created is a repost
                if (_posts.any((element) => element.id == post.repostOf?.id)) {
                  setState(() {
                    _posts[_posts.indexWhere(
                          (element) => element.id == post.repostOf!.id,
                        )] =
                        post.repostOf!;
                  });
                }
                // Update posts if post created is a reply
                if (_posts.any((element) => element.id == post.replyTo?.id)) {
                  setState(() {
                    _posts[_posts.indexWhere(
                          (element) => element.id == post.replyTo!.id,
                        )] =
                        post.replyTo!;
                  });
                }
                // Update reposts if post created is a repost
                if (_posts.any(
                  (element) => element.repostOf?.id == post.repostOf?.id,
                )) {
                  setState(() {
                    for (Post p
                        in _posts
                            .where(
                              (e) => e.repostOf?.id == state.post.repostOf?.id,
                            )
                            .toList()) {
                      _posts[_posts.indexOf(p)] = p.copyWith(
                        repostOf: state.post.repostOf,
                      );
                    }
                  });
                }
                // Update reposts if post created in reply to
                if (_posts.any(
                  (element) => element.repostOf?.id == post.replyTo?.id,
                )) {
                  setState(() {
                    for (Post p
                        in _posts
                            .where(
                              (e) => e.repostOf?.id == state.post.replyTo?.id,
                            )
                            .toList()) {
                      _posts[_posts.indexOf(p)] = p.copyWith(
                        repostOf: state.post.replyTo,
                      );
                    }
                  });
                }
              case PostUpdated(post: final post):
              // Update posts
                if (_posts.any((element) => element.id == post.id)) {
                  setState(() {
                    _posts[_posts.indexWhere(
                          (element) => element.id == post.id,
                        )] =
                        post;
                  });
                }
                // Update reposts
                if (_posts.any((element) => element.repostOf?.id == post.id)) {
                  setState(() {
                    for (Post p
                        in _posts
                            .where((e) => e.repostOf?.id == state.post.id)
                            .toList()) {
                      _posts[_posts.indexOf(p)] = p.copyWith(
                        repostOf: state.post,
                      );
                    }
                  });
                }
              case PostDeleted(:final postId):
              // Remove post
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
              // Update posts
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
        BlocListener<PollDetailCubit, PollDetailState>(
          listener: (context, state) {
            if (state is PollUpdated) {
              // Update posts
              if (_posts.any((element) => element.poll?.id == state.poll.id)) {
                setState(() {
                  for (Post p
                      in _posts
                          .where((e) => e.poll?.id == state.poll.id)
                          .toList()) {
                    _posts[_posts.indexOf(p)] = p.copyWith(poll: state.poll);
                  }
                });
              }
              // Update reposts
              if (_posts.any(
                (element) => element.repostOf?.poll?.id == state.poll.id,
              )) {
                setState(() {
                  for (Post p
                      in _posts
                          .where((e) => e.repostOf?.poll?.id == state.poll.id)
                          .toList()) {
                    Post repost = p.repostOf!.copyWith(poll: state.poll);
                    _posts[_posts.indexOf(p)] = p.copyWith(repostOf: repost);
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
