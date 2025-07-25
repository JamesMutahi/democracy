import 'package:democracy/poll/bloc/poll_detail/poll_detail_cubit.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_cubit.dart';
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
              case PostUpdated():
                // Update posts
                if (posts.any((element) => element.id == state.postId)) {
                  int postIndex = posts.indexWhere(
                    (element) => element.id == state.postId,
                  );
                  posts[postIndex] = posts[postIndex].copyWith(
                    body: state.body,
                    likes: state.likes,
                    isLiked: state.isLiked,
                    bookmarks: state.bookmarks,
                    isBookmarked: state.isBookmarked,
                    views: state.views,
                    replies: state.replies,
                    reposts: state.reposts,
                    isEdited: state.isEdited,
                    isDeleted: state.isDeleted,
                    isActive: state.isActive,
                  );
                  onPostsUpdated(posts);
                }
                // Update reposts
                if (posts.any(
                  (element) => element.repostOf?.id == state.postId,
                )) {
                  for (Post p
                      in posts
                          .where((e) => e.repostOf?.id == state.postId)
                          .toList()) {
                    Post repost = p.repostOf!.copyWith(
                      body: state.body,
                      likes: state.likes,
                      isLiked: state.isLiked,
                      bookmarks: state.bookmarks,
                      isBookmarked: state.isBookmarked,
                      views: state.views,
                      replies: state.replies,
                      reposts: state.reposts,
                      isEdited: state.isEdited,
                      isDeleted: state.isDeleted,
                      isActive: state.isActive,
                    );
                    posts[posts.indexOf(p)] = p.copyWith(repostOf: repost);
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
                  Post repostOf = post.repostOf!.copyWith(author: state.user);
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(repostOf: repostOf);
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
              List<Post> pollPosts =
                  posts
                      .where((post) => post.poll?.id == state.poll.id)
                      .toList();
              if (pollPosts.isNotEmpty) {
                for (Post post in pollPosts) {
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(poll: state.poll);
                }
                onPostsUpdated(posts);
              }
              //   Update reposts
              List<Post> pollReposts =
                  posts
                      .where((post) => post.repostOf?.poll?.id == state.poll.id)
                      .toList();
              if (pollReposts.isNotEmpty) {
                for (Post post in pollReposts) {
                  Post repostOf = post.repostOf!.copyWith(poll: state.poll);
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(repostOf: repostOf);
                }
                onPostsUpdated(posts);
              }
            }
          },
        ),
        BlocListener<SurveyDetailCubit, SurveyDetailState>(
          listener: (context, state) {
            if (state is SurveyUpdated) {
              // Update posts
              List<Post> surveyPosts =
                  posts
                      .where((post) => post.survey?.id == state.survey.id)
                      .toList();
              if (surveyPosts.isNotEmpty) {
                for (Post post in surveyPosts) {
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(survey: state.survey);
                }
                onPostsUpdated(posts);
              }
              //   Update reposts
              List<Post> surveyReposts =
                  posts
                      .where(
                        (post) => post.repostOf?.survey?.id == state.survey.id,
                      )
                      .toList();
              if (surveyPosts.isNotEmpty) {
                for (Post post in surveyReposts) {
                  Post repostOf = post.repostOf!.copyWith(survey: state.survey);
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(repostOf: repostOf);
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
