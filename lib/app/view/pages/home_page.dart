import 'package:democracy/app/shared/widgets/logo.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/post/bloc/following_posts/following_posts_bloc.dart';
import 'package:democracy/post/bloc/for_you/for_you_bloc.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final responsive = ResponsiveBreakpoints.of(context);

    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, bool innerBoxIsScrolled) {
          return [
            if (!kIsWeb)
              SliverAppBar(
                floating: true,
                snap: true,
                automaticallyImplyLeading: false,
                forceElevated: true,
                flexibleSpace: Builder(
                  builder: (context) {
                    return Stack(
                      // Allows children to go outside bounds
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 55,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (responsive.isMobile) DrawerOpener(),
                              NotificationButton(),
                            ],
                          ),
                        ),
                        Positioned(top: 5, child: Logo(width: 60, height: 60)),
                      ],
                    );
                  },
                ),
                bottom: TabBar(
                  dividerColor: Theme.of(context).colorScheme.outlineVariant,
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  tabs: [
                    Tab(text: 'For You'),
                    Tab(text: 'Following'),
                  ],
                ),
              )
            else
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                automaticallyImplyLeading: false,
                flexibleSpace: Builder(
                  builder: (context) {
                    return TabBar(
                      dividerColor: Theme.of(
                        context,
                      ).colorScheme.outlineVariant,
                      labelStyle: Theme.of(context).textTheme.titleMedium,
                      tabs: [
                        Tab(text: 'For You'),
                        Tab(text: 'Following'),
                      ],
                    );
                  },
                ),
              ),
          ];
        },
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [ForYouTab(), FollowingTab()],
        ),
      ),
    );
  }
}

class ForYouTab extends StatefulWidget {
  const ForYouTab({super.key});

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
    final posts = context.read<ForYouBloc>().state.posts;
    if (posts.isEmpty) {
      context.read<ForYouBloc>().add(ForYouEvent.get());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: BlocBuilder<ForYouBloc, ForYouState>(
        builder: (context, state) {
          final posts = state.posts.toList();

          if (state.status == ForYouStatus.success) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshCompleted();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadComplete();
            }
          }

          if (state.status == ForYouStatus.failure) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshFailed();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadFailed();
            }
          }

          return PostListView(
            posts: posts,
            loading:
                state.status == ForYouStatus.initial ||
                (state.status == ForYouStatus.loading && posts.isEmpty),
            failure: state.posts.isNotEmpty
                ? false
                : state.status == ForYouStatus.failure,
            onPostsUpdated: (posts) {
              context.read<ForYouBloc>().add(ForYouEvent.update(posts: posts));
            },
            refreshController: _refreshController,
            enablePullDown: true,
            enablePullUp: state.hasNext,
            checkVisibility: true,
            onRefresh: () {
              context.read<ForYouBloc>().add(ForYouEvent.get());
            },
            onLoading: () {
              context.read<ForYouBloc>().add(
                ForYouEvent.get(previousPosts: posts),
              );
            },
            onFailure: () {
              context.read<ForYouBloc>().add(ForYouEvent.get());
            },
            origin: 'For You',
          );
        },
      ),
    );
  }
}

class FollowingTab extends StatefulWidget {
  const FollowingTab({super.key});

  @override
  State<FollowingTab> createState() => _FollowingTabState();
}

class _FollowingTabState extends State<FollowingTab> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    final posts = context.read<FollowingPostsBloc>().state.posts;
    if (posts.isEmpty) {
      context.read<FollowingPostsBloc>().add(FollowingPostsEvent.get());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        }

        if (state.status == FollowingPostsStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }

        return PostListView(
          posts: posts,
          loading:
              state.status == FollowingPostsStatus.initial ||
              (state.status == FollowingPostsStatus.loading && posts.isEmpty),
          failure: state.posts.isNotEmpty
              ? false
              : state.status == FollowingPostsStatus.failure,
          onPostsUpdated: (posts) {
            context.read<FollowingPostsBloc>().add(
              FollowingPostsEvent.update(posts: posts),
            );
          },
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: state.hasNext,
          checkVisibility: true,
          onRefresh: () {
            context.read<FollowingPostsBloc>().add(FollowingPostsEvent.get());
          },
          onLoading: () {
            context.read<FollowingPostsBloc>().add(
              FollowingPostsEvent.get(previousPosts: posts),
            );
          },
          onFailure: () {
            context.read<FollowingPostsBloc>().add(FollowingPostsEvent.get());
          },
          origin: 'Following',
        );
      },
    );
  }
}
