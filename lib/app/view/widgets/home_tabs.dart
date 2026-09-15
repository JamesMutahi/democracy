import 'package:democracy/post/bloc/following_posts/following_posts_bloc.dart';
import 'package:democracy/post/bloc/for_you/for_you_bloc.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ForYouTab extends StatefulWidget {
  const ForYouTab({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<ForYouTab> createState() => _ForYouTabState();
}

class _ForYouTabState extends State<ForYouTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final posts = context.read<ForYouBloc>().state.posts;
      if (posts.isEmpty) {
        context.read<ForYouBloc>().add(ForYouEvent.get());
      }
    });
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

    return BlocBuilder<ForYouBloc, ForYouState>(
      builder: (context, state) {
        final posts = state.posts.toList();

        if (state.status == ForYouStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        } else if (state.status == ForYouStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }

        return PostListView(
          scrollController: isWebLayout ? widget.scrollController : null,
          physics: isWebLayout ? NeverScrollableScrollPhysics() : null,
          posts: posts,
          loading:
              state.status == ForYouStatus.initial ||
              (state.status == ForYouStatus.loading && posts.isEmpty),
          failure: state.posts.isEmpty && state.status == ForYouStatus.failure,
          onPostsUpdated: (updatedPosts) {
            context.read<ForYouBloc>().add(
              ForYouEvent.update(posts: updatedPosts),
            );
          },
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: state.hasNext,
          checkVisibility: true,
          onRefresh: () => context.read<ForYouBloc>().add(ForYouEvent.get()),
          onLoading: () => context.read<ForYouBloc>().add(
            ForYouEvent.get(previousPosts: posts),
          ),
          onFailure: () => context.read<ForYouBloc>().add(ForYouEvent.get()),
          origin: 'For You',
        );
      },
    );
  }
}

class FollowingTab extends StatefulWidget {
  const FollowingTab({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<FollowingTab> createState() => _FollowingTabState();
}

class _FollowingTabState extends State<FollowingTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final posts = context.read<FollowingPostsBloc>().state.posts;
      if (posts.isEmpty) {
        context.read<FollowingPostsBloc>().add(FollowingPostsEvent.get());
      }
    });
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

    return BlocBuilder<FollowingPostsBloc, FollowingPostsState>(
      builder: (context, state) {
        final posts = state.posts.toList();

        if (state.status == FollowingPostsStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        } else if (state.status == FollowingPostsStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }

        return PostListView(
          scrollController: isWebLayout ? widget.scrollController : null,
          physics: isWebLayout ? NeverScrollableScrollPhysics() : null,
          posts: posts,
          loading:
              state.status == FollowingPostsStatus.initial ||
              (state.status == FollowingPostsStatus.loading && posts.isEmpty),
          failure:
              state.posts.isEmpty &&
              state.status == FollowingPostsStatus.failure,
          onPostsUpdated: (updatedPosts) {
            context.read<FollowingPostsBloc>().add(
              FollowingPostsEvent.update(posts: updatedPosts),
            );
          },
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: state.hasNext,
          checkVisibility: true,
          onRefresh: () =>
              context.read<FollowingPostsBloc>().add(FollowingPostsEvent.get()),
          onLoading: () => context.read<FollowingPostsBloc>().add(
            FollowingPostsEvent.get(previousPosts: posts),
          ),
          onFailure: () =>
              context.read<FollowingPostsBloc>().add(FollowingPostsEvent.get()),
          origin: 'Following',
        );
      },
    );
  }
}
