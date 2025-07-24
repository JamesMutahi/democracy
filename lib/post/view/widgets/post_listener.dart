import 'package:democracy/poll/bloc/poll_detail/poll_detail_cubit.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostListener extends StatelessWidget {
  const PostListener({
    super.key,
    required this.posts,
    required this.onPostsUpdated,
    required this.child,
  });

  final List<Post> posts;
  final void Function(List<Post>) onPostsUpdated;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PostDetailCubit, PostDetailState>(
          listener: (context, state) {
            switch (state) {
              case PostUpdated(post: final post):
                // Update posts
                if (posts.any((element) => element.id == post.id)) {
                  posts[posts.indexWhere((element) => element.id == post.id)] =
                      post;
                  onPostsUpdated(posts);
                }
                // Update reposts
                if (posts.any((element) => element.repostOf?.id == post.id)) {
                  for (Post p
                      in posts
                          .where((e) => e.repostOf?.id == state.post.id)
                          .toList()) {
                    posts[posts.indexOf(p)] = p.copyWith(repostOf: state.post);
                  }
                  onPostsUpdated(posts);
                }
              case PostDeleted(:final postId):
                // Remove post
                if (posts.any((element) => element.id == postId)) {
                  posts.removeWhere((element) => element.id == postId);
                  onPostsUpdated(posts);
                }
            }
          },
        ),
        BlocListener<UserDetailCubit, UserDetailState>(
          listener: (context, state) {
            if (state is UserUpdated) {
              // Update posts
              List<Post> userPosts =
                  posts
                      .where((post) => post.author.id == state.user.id)
                      .toList();
              if (userPosts.isNotEmpty) {
                for (Post post in userPosts) {
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(author: state.user);
                }
                onPostsUpdated(posts);
              }
              //   Update reposts
              List<Post> userReposts =
                  posts
                      .where(
                        (post) => post.repostOf?.author.id == state.user.id,
                      )
                      .toList();
              if (userReposts.isNotEmpty) {
                for (Post post in userReposts) {
                  Post updated = post.repostOf!.copyWith(author: state.user);
                  posts[posts.indexWhere((p) => p.id == post.id)] = updated;
                }
                onPostsUpdated(posts);
              }
            }
          },
        ),
        BlocListener<PollDetailCubit, PollDetailState>(
          listener: (context, state) {
            if (state is PollUpdated) {
              // Update posts
              if (posts.any((element) => element.poll?.id == state.poll.id)) {
                List<Post> updatedPosts =
                    posts
                        .where((element) => element.poll?.id == state.poll.id)
                        .toList();
                for (Post post in updatedPosts) {
                  post = post.copyWith(poll: state.poll);
                }
                onPostsUpdated(posts);
              }
              // Update reposts
              List<Post> updatedPosts =
                  posts
                      .where((post) => post.repostOf?.poll?.id == state.poll.id)
                      .toList();
              if (updatedPosts.isNotEmpty) {
                for (Post post in updatedPosts) {
                  Post updated = post.repostOf!.copyWith(poll: state.poll);
                  posts[posts.indexWhere((p) => p.id == post.id)] = updated;
                }
                onPostsUpdated(posts);
              }
            }
          },
        ),
      ],
      child: child,
    );
  }
}
