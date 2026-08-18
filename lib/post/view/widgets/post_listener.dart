import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_bloc.dart';
import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/post/bloc/post_create/post_create_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
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
        BlocListener<PostCreateBloc, PostCreateState>(
          listener: (context, state) {
            if (state.status == PostCreateStatus.success) {
              bool updatePosts = false;
              final post = state.post!;
              // Update repostOf
              if (post.repostOf != null) {
                if (posts.any((element) => element.id == post.repostOf!.id)) {
                  int postIndex = posts.indexWhere(
                    (element) => element.id == post.repostOf!.id,
                  );
                  posts[postIndex] = post.repostOf!;
                  updatePosts = true;
                }
              }
              // Update replyTo
              if (post.replyTo != null) {
                if (posts.any((element) => element.id == post.replyTo!.id)) {
                  int postIndex = posts.indexWhere(
                    (element) => element.id == post.replyTo!.id,
                  );
                  posts[postIndex] = post.replyTo!;
                  updatePosts = true;
                }
              }
              if (updatePosts) {
                onPostsUpdated(posts);
              }
            }
          },
        ),
        BlocListener<PostDetailBloc, PostDetailState>(
          listener: (context, state) {
            bool updatePosts = false;
            switch (state) {
              case PostLoaded(:final post):
                // Update posts
                if (posts.any((element) => element.id == post.id)) {
                  int postIndex = posts.indexWhere(
                    (element) => element.id == state.post.id,
                  );
                  posts[postIndex] = post;
                  updatePosts = true;
                }
                // Update reposts
                List<Post> reposts = posts
                    .where((e) => e.repostOf?.id == state.post.id)
                    .toList();
                if (posts.any((element) => element.repostOf?.id == post.id)) {
                  for (Post p in reposts) {
                    posts[posts.indexOf(p)] = p.copyWith(repostOf: post);
                  }
                  updatePosts = true;
                }
              case PostUpdated():
                // Update posts
                if (posts.any((element) => element.id == state.postId)) {
                  int postIndex = posts.indexWhere(
                    (element) => element.id == state.postId,
                  );
                  posts[postIndex] = posts[postIndex].copyWith(
                    likes: state.likes,
                    bookmarks: state.bookmarks,
                    views: state.views,
                    replies: state.replies,
                    reposts: state.reposts,
                    communityNote: state.communityNote,
                    upvotes: state.upvotes,
                    downvotes: state.downvotes,
                    isDeleted: state.isDeleted,
                    isActive: state.isActive,
                  );
                  updatePosts = true;
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
                      likes: state.likes,
                      bookmarks: state.bookmarks,
                      views: state.views,
                      replies: state.replies,
                      reposts: state.reposts,
                      communityNote: state.communityNote,
                      upvotes: state.upvotes,
                      downvotes: state.downvotes,
                      isDeleted: state.isDeleted,
                      isActive: state.isActive,
                    );
                    posts[posts.indexOf(p)] = p.copyWith(repostOf: repost);
                  }
                  updatePosts = true;
                }
              case PostLiked():
                if (posts.any((element) => element.id == state.postId)) {
                  int postIndex = posts.indexWhere(
                    (element) => element.id == state.postId,
                  );
                  posts[postIndex] = posts[postIndex].copyWith(
                    likes: state.likes,
                    isLiked: state.isLiked,
                  );
                  updatePosts = true;
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
                      likes: state.likes,
                      isLiked: state.isLiked,
                    );
                    posts[posts.indexOf(p)] = p.copyWith(repostOf: repost);
                  }
                  updatePosts = true;
                }
              case PostMuted():
                if (posts.any((element) => element.id == state.postId)) {
                  int postIndex = posts.indexWhere(
                    (element) => element.id == state.postId,
                  );
                  posts[postIndex] = posts[postIndex].copyWith(
                    isMuted: state.isMuted,
                  );
                  updatePosts = true;
                }
              case PostPinned():
                final int postIndex = posts.indexWhere(
                  (element) => element.id == state.postId,
                );

                if (postIndex != -1) {
                  // If pinning a new post, unpin all others inside the existing list
                  if (state.isPinned) {
                    for (int i = 0; i < posts.length; i++) {
                      if (posts[i].isPinned) {
                        posts[i] = posts[i].copyWith(isPinned: false);
                      }
                    }
                  }

                  // Update the target post
                  posts[postIndex] = posts[postIndex].copyWith(
                    isPinned: state.isPinned,
                  );

                  updatePosts = true;
                }
              case PostBookmarked():
                if (posts.any((element) => element.id == state.postId)) {
                  int postIndex = posts.indexWhere(
                    (element) => element.id == state.postId,
                  );
                  posts[postIndex] = posts[postIndex].copyWith(
                    bookmarks: state.bookmarks,
                    isBookmarked: state.isBookmarked,
                  );
                  updatePosts = true;
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
                      bookmarks: state.bookmarks,
                      isBookmarked: state.isBookmarked,
                    );
                    posts[posts.indexOf(p)] = p.copyWith(repostOf: repost);
                  }
                  updatePosts = true;
                }
              case PostUpvoted():
                if (posts.any((element) => element.id == state.postId)) {
                  int postIndex = posts.indexWhere(
                    (element) => element.id == state.postId,
                  );
                  posts[postIndex] = posts[postIndex].copyWith(
                    isUpvoted: state.isUpvoted,
                    upvotes: state.upvotes,
                    isDownvoted: state.isDownvoted,
                    downvotes: state.downvotes,
                  );
                  updatePosts = true;
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
                      isUpvoted: state.isUpvoted,
                      upvotes: state.upvotes,
                      isDownvoted: state.isDownvoted,
                      downvotes: state.downvotes,
                    );
                    posts[posts.indexOf(p)] = p.copyWith(repostOf: repost);
                  }
                  updatePosts = true;
                }
              case PostDownvoted():
                if (posts.any((element) => element.id == state.postId)) {
                  int postIndex = posts.indexWhere(
                    (element) => element.id == state.postId,
                  );
                  posts[postIndex] = posts[postIndex].copyWith(
                    isUpvoted: state.isUpvoted,
                    upvotes: state.upvotes,
                    isDownvoted: state.isDownvoted,
                    downvotes: state.downvotes,
                  );
                  updatePosts = true;
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
                      isDownvoted: state.isDownvoted,
                      downvotes: state.downvotes,
                    );
                    posts[posts.indexOf(p)] = p.copyWith(repostOf: repost);
                  }
                  updatePosts = true;
                }
              case PostDeleted(:final postId):
                // Remove post
                if (posts.any((element) => element.id == postId)) {
                  posts.removeWhere((element) => element.id == postId);
                  updatePosts = true;
                }
                // Update repostOf
                if (posts.any((element) => element.repostOf?.id == postId)) {
                  for (Post p
                      in posts
                          .where((e) => e.repostOf?.id == postId)
                          .toList()) {
                    Post repost = p.repostOf!.copyWith(isDeleted: true);
                    posts[posts.indexOf(p)] = p.copyWith(repostOf: repost);
                  }
                  updatePosts = true;
                }
              case RepostDeleted(:final postId):
                // Update post
                if (posts.any((element) => element.id == postId)) {
                  int postIndex = posts.indexWhere(
                    (element) => element.id == state.postId,
                  );
                  posts[postIndex] = posts[postIndex].copyWith(
                    isReposted: false,
                    reposts: state.reposts,
                  );
                }
                // Remove repost
                if (posts.any((element) => element.id == state.repostId)) {
                  posts.removeWhere((element) => element.id == state.repostId);
                }
                updatePosts = true;
            }
            if (updatePosts) {
              onPostsUpdated(posts);
            }
          },
        ),
        BlocListener<UserDetailBloc, UserDetailState>(
          listener: (context, state) {
            if (state is UserUpdated) {
              bool updatePosts = false;
              // Update posts
              List<Post> userPosts = posts
                  .where((post) => post.author.id == state.user.id)
                  .toList();
              if (userPosts.isNotEmpty) {
                for (Post post in userPosts) {
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(author: state.user);
                }
                updatePosts = true;
              }
              //   Update reposts
              List<Post> userReposts = posts
                  .where((post) => post.repostOf?.author.id == state.user.id)
                  .toList();
              if (userReposts.isNotEmpty) {
                for (Post post in userReposts) {
                  Post repostOf = post.repostOf!.copyWith(author: state.user);
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(repostOf: repostOf);
                }
                updatePosts = true;
              }
              if (updatePosts) {
                onPostsUpdated(posts);
              }
            }
          },
        ),
        BlocListener<BallotDetailBloc, BallotDetailState>(
          listener: (context, state) {
            if (state is BallotUpdated) {
              bool updatePosts = false;
              // Update posts
              List<Post> ballotPosts = posts
                  .where((post) => post.ballot?.id == state.ballotId)
                  .toList();
              if (ballotPosts.isNotEmpty) {
                for (Post post in ballotPosts) {
                  final ballot = post.ballot?.copyWith(
                    title: state.title,
                    description: state.description,
                    county: state.county,
                    constituency: state.constituency,
                    ward: state.ward,
                    startTime: state.startTime,
                    endTime: state.endTime,
                    hasStarted: state.hasStarted,
                    hasEnded: state.hasEnded,
                    totalVotes: state.totalVotes,
                    options: state.options,
                    isActive: state.isActive,
                  );
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(ballot: ballot);
                }
                updatePosts = true;
              }
              //   Update reposts
              List<Post> ballotReposts = posts
                  .where((post) => post.repostOf?.ballot?.id == state.ballotId)
                  .toList();
              if (ballotReposts.isNotEmpty) {
                for (Post post in ballotReposts) {
                  final ballot = post.repostOf!.ballot?.copyWith(
                    title: state.title,
                    description: state.description,
                    county: state.county,
                    constituency: state.constituency,
                    ward: state.ward,
                    startTime: state.startTime,
                    endTime: state.endTime,
                    hasStarted: state.hasStarted,
                    hasEnded: state.hasEnded,
                    totalVotes: state.totalVotes,
                    options: state.options,
                    isActive: state.isActive,
                  );
                  Post repostOf = post.repostOf!.copyWith(ballot: ballot);
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(repostOf: repostOf);
                }
                updatePosts = true;
              }
              if (updatePosts) {
                onPostsUpdated(posts);
              }
            }
            if (state is BallotVoted) {
              bool updatePosts = false;
              // Update posts
              List<Post> ballotPosts = posts
                  .where((post) => post.ballot?.id == state.ballotId)
                  .toList();
              if (ballotPosts.isNotEmpty) {
                for (Post post in ballotPosts) {
                  final ballot = post.ballot?.copyWith(
                    votedOption: state.optionId,
                  );
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(ballot: ballot);
                }
                updatePosts = true;
              }
              //   Update reposts
              List<Post> ballotReposts = posts
                  .where((post) => post.repostOf?.ballot?.id == state.ballotId)
                  .toList();
              if (ballotReposts.isNotEmpty) {
                for (Post post in ballotReposts) {
                  final ballot = post.repostOf!.ballot?.copyWith(
                    votedOption: state.optionId,
                  );
                  Post repostOf = post.repostOf!.copyWith(ballot: ballot);
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(repostOf: repostOf);
                }
                updatePosts = true;
              }
              if (updatePosts) {
                onPostsUpdated(posts);
              }
            }
          },
        ),
        BlocListener<SurveyDetailBloc, SurveyDetailState>(
          listener: (context, state) {
            if (state is SurveyUpdated) {
              bool updatePosts = false;
              // Update posts
              List<Post> surveyPosts = posts
                  .where((post) => post.survey?.id == state.survey.id)
                  .toList();
              if (surveyPosts.isNotEmpty) {
                for (Post post in surveyPosts) {
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(survey: state.survey);
                }
                updatePosts = true;
              }
              //   Update reposts
              List<Post> surveyReposts = posts
                  .where((post) => post.repostOf?.survey?.id == state.survey.id)
                  .toList();
              if (surveyPosts.isNotEmpty) {
                for (Post post in surveyReposts) {
                  Post repostOf = post.repostOf!.copyWith(survey: state.survey);
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(repostOf: repostOf);
                }
                updatePosts = true;
              }
              if (updatePosts) {
                onPostsUpdated(posts);
              }
            }
          },
        ),
        BlocListener<BroadcastDetailBloc, BroadcastDetailState>(
          listener: (context, state) {
            if (state is BroadcastUpdated) {
              bool updatePosts = false;
              // Update posts
              List<Post> broadcastPosts = posts
                  .where((post) => post.broadcast?.id == state.broadcast.id)
                  .toList();
              if (broadcastPosts.isNotEmpty) {
                for (Post post in broadcastPosts) {
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(broadcast: state.broadcast);
                }
                updatePosts = true;
              }
              //   Update reposts
              List<Post> broadcastReposts = posts
                  .where(
                    (post) =>
                        post.repostOf?.broadcast?.id == state.broadcast.id,
                  )
                  .toList();
              if (broadcastPosts.isNotEmpty) {
                for (Post post in broadcastReposts) {
                  Post repostOf = post.repostOf!.copyWith(
                    broadcast: state.broadcast,
                  );
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(repostOf: repostOf);
                }
                updatePosts = true;
              }
              if (updatePosts) {
                onPostsUpdated(posts);
              }
            }
          },
        ),
        BlocListener<PetitionDetailBloc, PetitionDetailState>(
          listener: (context, state) {
            if (state is PetitionUpdated) {
              bool updatePosts = false;
              // Update posts
              List<Post> petitionPosts = posts
                  .where((post) => post.petition?.id == state.petitionId)
                  .toList();
              if (petitionPosts.isNotEmpty) {
                final petition = petitionPosts.first.petition?.copyWith(
                  title: state.title,
                  description: state.description,
                  county: state.county,
                  constituency: state.constituency,
                  ward: state.ward,
                  supporters: state.supporters,
                  recentSupporters: state.recentSupporters,
                  image: state.image,
                  video: state.video,
                  views: state.views,
                  isOpen: state.isOpen,
                  isActive: state.isActive,
                );
                for (Post post in petitionPosts) {
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(petition: petition);
                }
                updatePosts = true;
              }
              //   Update reposts
              List<Post> petitionReposts = posts
                  .where(
                    (post) => post.repostOf?.petition?.id == state.petitionId,
                  )
                  .toList();
              if (petitionPosts.isNotEmpty) {
                final petition = petitionPosts.first.repostOf!.petition
                    ?.copyWith(
                      title: state.title,
                      description: state.description,
                      county: state.county,
                      constituency: state.constituency,
                      ward: state.ward,
                      supporters: state.supporters,
                      recentSupporters: state.recentSupporters,
                      image: state.image,
                      video: state.video,
                      views: state.views,
                      isOpen: state.isOpen,
                      isActive: state.isActive,
                    );
                for (Post post in petitionReposts) {
                  Post repostOf = post.repostOf!.copyWith(petition: petition);
                  posts[posts.indexWhere((p) => p.id == post.id)] = post
                      .copyWith(repostOf: repostOf);
                }
                updatePosts = true;
              }
              if (updatePosts) {
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
