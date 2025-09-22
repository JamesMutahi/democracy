import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_cubit.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
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
        BlocListener<PostDetailBloc, PostDetailState>(
          listener: (context, state) {
            switch (state) {
              case PostLoaded(:final post):
                // Update posts
                if (posts.any((element) => element.id == post.id)) {
                  int postIndex = posts.indexWhere(
                    (element) => element.id == state.post.id,
                  );
                  posts[postIndex] = post;
                  onPostsUpdated(posts);
                }
                // Update reposts
                List<Post> reposts =
                    posts
                        .where((e) => e.repostOf?.id == state.post.id)
                        .toList();
                if (posts.any((element) => element.repostOf?.id == post.id)) {
                  for (Post p in reposts) {
                    posts[posts.indexOf(p)] = p.copyWith(repostOf: post);
                  }
                  onPostsUpdated(posts);
                }
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
                    isReposted: state.isReposted,
                    isQuoted: state.isQuoted,
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
                      isReposted: state.isReposted,
                      isQuoted: state.isQuoted,
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
        BlocListener<BallotDetailCubit, BallotDetailState>(
          listener: (context, state) {
            if (state is BallotUpdated) {
              // Update posts
              List<Post> ballotPosts =
                  posts
                      .where((post) => post.ballot?.id == state.ballot.id)
                      .toList();
              if (ballotPosts.isNotEmpty) {
                for (Post post in ballotPosts) {
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(ballot: state.ballot);
                }
                onPostsUpdated(posts);
              }
              //   Update reposts
              List<Post> ballotReposts =
                  posts
                      .where(
                        (post) => post.repostOf?.ballot?.id == state.ballot.id,
                      )
                      .toList();
              if (ballotReposts.isNotEmpty) {
                for (Post post in ballotReposts) {
                  Post repostOf = post.repostOf!.copyWith(ballot: state.ballot);
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
