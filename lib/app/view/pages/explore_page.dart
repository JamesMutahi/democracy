import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/no_results.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/app/view/widgets/explore_search_anchor.dart';
import 'package:democracy/post/bloc/trending_topics/trending_topics_bloc.dart';
import 'package:democracy/post/view/utils/add_post_view.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/post/bloc/post_filter/post_filter_cubit.dart';
import 'package:democracy/post/bloc/trending_posts/trending_posts_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/user/bloc/follow_recommendations/follow_recommendations_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final SearchController _searchController = SearchController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);

    return BlocProvider(
      create: (context) => PostFilterCubit(),
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: BlocBuilder<PostFilterCubit, PostFilterState>(
            buildWhen: (previous, current) {
              return current.onExplorePage;
            },
            builder: (context, state) {
              return NestedScrollView(
                headerSliverBuilder: (context, bool innerBoxIsScrolled) {
                  final filterCubit = context.read<PostFilterCubit>();
                  return [
                    if (responsive.isMobile)
                      CustomAppBar(
                        middle: Text(
                          'Explore',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(100.0),
                          child: Column(
                            children: [
                              _buildSearchBar(filterCubit, state),
                              _buildTabBar(),
                            ],
                          ),
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
                            return SizedBox(
                              height: 60,
                              child: _buildSearchBar(filterCubit, state),
                            );
                          },
                        ),
                        bottom: _buildTabBar(),
                      ),
                  ];
                },
                body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [_ForYou(), _Trending()],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(PostFilterCubit cubit, PostFilterState state) {
    return ExploreSearchAnchor(
      searchController: _searchController,
      filterCubit: cubit,
      filterState: state,
      onSubmitted: () {
        _searchController.clear();
      },
    );
  }

  PreferredSizeWidget _buildTabBar() {
    return TabBar(
      dividerColor: Colors.transparent,
      labelStyle: Theme.of(context).textTheme.titleMedium,
      tabs: [
        Tab(text: 'For You'),
        Tab(text: 'Trending'),
      ],
    );
  }
}

class _ForYou extends StatefulWidget {
  const _ForYou();

  @override
  State<_ForYou> createState() => _ForYouState();
}

class _ForYouState extends State<_ForYou> with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() {
    context.read<TrendingPostsBloc>().add(TrendingPostsEvent.get());
    context.read<FollowRecommendationsBloc>().add(
      FollowRecommendationsEvent.get(),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<TrendingPostsBloc, TrendingPostsState>(
      builder: (context, state) {
        final posts = state.posts.toList();

        if (state.status == TrendingPostsStatus.initial ||
            (state.posts.isEmpty &&
                state.status == TrendingPostsStatus.loading)) {
          return BottomLoader();
        }

        if (state.status == TrendingPostsStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == TrendingPostsStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
          if (posts.isEmpty) {
            return FailureRetryButton(onPressed: _getData);
          }
        }

        return SmartRefresher(
          enablePullDown: true,
          enablePullUp: state.hasNext,
          header: ClassicHeader(),
          controller: _refreshController,
          onRefresh: _getData,
          onLoading: () {
            context.read<TrendingPostsBloc>().add(
              TrendingPostsEvent.get(previousPosts: posts),
            );
          },
          footer: ClassicFooter(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Theme.of(context).disabledColor.withAlpha(30),
                      ),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      context.router.push(FollowRecommendations());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Who to follow',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              _buildFollowRecommendations(),
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Theme.of(context).disabledColor.withAlpha(30),
                      ),
                    ),
                  ),
                  child: Text(
                    'Posts',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ),
              ),
              PostListener(
                posts: posts,
                onPostsUpdated: (posts) {
                  context.read<TrendingPostsBloc>().add(
                    TrendingPostsEvent.update(posts: posts),
                  );
                },
                child: SliverList(
                  delegate: SliverChildBuilderDelegate((
                    BuildContext context,
                    int index,
                  ) {
                    Post post = posts[index];
                    return PostTile(
                      key: ValueKey(post.id),
                      post: post,
                      isDependency: false,
                      checkVisibility: false,
                      onViewed: () {
                        addPostView(context, 'Explore', post);
                      },
                    );
                  }, childCount: posts.length),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFollowRecommendations() {
    return BlocBuilder<FollowRecommendationsBloc, FollowRecommendationsState>(
      builder: (context, state) {
        final users = state.users.take(3).toList();

        final authBloc = context.read<AuthBloc>();
        final me = authBloc.state.user!;

        return BlocListener<UserDetailBloc, UserDetailState>(
          listener: (context, state) {
            if (state is UserUpdated) {
              if (users.any((user) => user.id == state.user.id)) {
                int index = users.indexWhere(
                  (user) => user.id == state.user.id,
                );
                users[index] = state.user;
                context.read<FollowRecommendationsBloc>().add(
                  FollowRecommendationsEvent.update(users: users),
                );
              }
            }
          },
          child: SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              User user = users[index];
              return UserTile(
                user: user,
                me: me,
                showProfileButtons: true,
                selectedUsers: [],
                onTap: () {
                  context.router.push(ProfileRoute(userId: user.id));
                },
              );
            }, childCount: users.length),
          ),
        );
      },
    );
  }
}

class _Trending extends StatefulWidget {
  const _Trending();

  @override
  State<_Trending> createState() => _TrendingState();
}

class _TrendingState extends State<_Trending>
    with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    context.read<TrendingTopicsBloc>().add(TrendingTopicsEvent.get());
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<TrendingTopicsBloc, TrendingTopicsState>(
      builder: (context, state) {
        final topics = state.topics.toList();

        if (state.status == TrendingTopicsStatus.initial ||
            (state.status == TrendingTopicsStatus.loading && topics.isEmpty)) {
          return const BottomLoader();
        }

        if (state.status == TrendingTopicsStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == TrendingTopicsStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
          if (state.topics.isEmpty) {
            return FailureRetryButton(
              onPressed: () => context.read<TrendingTopicsBloc>().add(
                TrendingTopicsEvent.get(),
              ),
            );
          }
        }

        return SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          header: ClassicHeader(),
          controller: _refreshController,
          onRefresh: () {
            context.read<TrendingTopicsBloc>().add(TrendingTopicsEvent.get());
          },
          child: topics.isEmpty
              ? const NoResults(text: 'No topics')
              : ListView.builder(
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    final topic = topics[index];
                    return ListTile(
                      key: ValueKey(topic),
                      title: Text(topic),
                      onTap: () {
                        context.router.push(
                          SearchResults(
                            searchTerm: topic,
                            startDate: null,
                            endDate: null,
                            filterCount: 0,
                          ),
                        );
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
