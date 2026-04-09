import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/post/bloc/draft_posts/draft_posts_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/shared/post_navigator.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class DraftPosts extends StatefulWidget {
  const DraftPosts({super.key});

  @override
  State<DraftPosts> createState() => _DraftsPostsState();
}

class _DraftsPostsState extends State<DraftPosts> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<DraftPostsBloc>().add(DraftPostsEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drafts')),
      body: BlocBuilder<DraftPostsBloc, DraftPostsState>(
        builder: (context, state) {
          final posts = state.posts.toList();

          if (state.status == DraftPostsStatus.initial ||
              state.status == DraftPostsStatus.loading && posts.isEmpty) {
            return const BottomLoader();
          }

          if (state.status == DraftPostsStatus.success) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshCompleted();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadComplete();
            }
          }

          if (state.status == DraftPostsStatus.failure) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshFailed();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadFailed();
            }

            if (state.posts.isEmpty) {
              return FailureRetryButton(
                onPressed: () =>
                    context.read<DraftPostsBloc>().add(DraftPostsEvent.get()),
              );
            }
          }

          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: state.hasNext,
            header: ClassicHeader(),
            controller: _refreshController,
            onRefresh: () {
              context.read<DraftPostsBloc>().add(DraftPostsEvent.get());
            },
            onLoading: () {
              context.read<DraftPostsBloc>().add(
                DraftPostsEvent.get(previousPosts: posts),
              );
            },
            footer: ClassicFooter(),
            child: PostListener(
              posts: posts,
              onPostsUpdated: (posts) {
                context.read<DraftPostsBloc>().add(
                  DraftPostsEvent.update(posts: posts),
                );
              },
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (BuildContext context, int index) {
                  Post post = posts[index];
                  return GestureDetector(
                    onTap: () {
                      navigateToPostUpdate(context: context, post: post);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Text(post.body),
                    ),
                  );
                },
                itemCount: posts.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
