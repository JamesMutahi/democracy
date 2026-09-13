import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/no_results.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/app/view/widgets/explore_search_anchor.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/post/bloc/post_filter/post_filter_cubit.dart';
import 'package:democracy/post/bloc/trending_posts/trending_posts_bloc.dart';
import 'package:democracy/post/bloc/trending_topics/trending_topics_bloc.dart';
import 'package:democracy/post/view/utils/add_post_view.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/user/bloc/follow_recommendations/follow_recommendations_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/user_tile.dart';
import 'package:flutter/foundation.dart';
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
        body: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: BlocBuilder<PostFilterCubit, PostFilterState>(
              buildWhen: (previous, current) => current.onExplorePage,
              builder: (context, state) {
                final filterCubit = context.read<PostFilterCubit>();

                return kIsWeb && responsive.largerThan(MOBILE)
                    ? _buildWeb(responsive, filterCubit, state)
                    : _buildMobile(filterCubit, state);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeb(
    ResponsiveBreakpointsData responsive,
    PostFilterCubit cubit,
    PostFilterState state,
  ) {
    return MainContainer(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: false,
              snap: false,
              automaticallyImplyLeading: false,
              flexibleSpace: Builder(
                builder: (context) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: _buildSearchBar(cubit, state),
                  );
                },
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: _buildTabBar(),
              ),
            ),
          ];
        },
        body: _buildTabBarView(),
      ),
    );
  }

  Widget _buildMobile(PostFilterCubit cubit, PostFilterState state) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          CustomAppBar(
            middle: Text(
              'Explore',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(108.0),
              child: Column(
                children: [_buildSearchBar(cubit, state), _buildTabBar()],
              ),
            ),
          ),
        ];
      },
      body: _buildTabBarView(),
    );
  }

  Widget _buildSearchBar(PostFilterCubit cubit, PostFilterState state) {
    return ExploreSearchAnchor(
      searchController: _searchController,
      filterCubit: cubit,
      filterState: state,
      onSubmitted: () => _searchController.clear(),
    );
  }

  PreferredSizeWidget _buildTabBar() {
    return TabBar(
      dividerColor: Theme.of(context).disabledColor.withAlpha(30),
      labelStyle: Theme.of(context).textTheme.titleMedium,
      tabs: [
        Tab(text: 'For You'),
        Tab(text: 'Trending'),
      ],
    );
  }

  Widget _buildTabBarView() {
    return const TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [_ForYouTab(), _TrendingTab()],
    );
  }
}

class _ForYouTab extends StatefulWidget {
  const _ForYouTab();

  @override
  State<_ForYouTab> createState() => _ForYouTabState();
}

class _ForYouTabState extends State<_ForYouTab>
    with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _getData() {
    context.read<TrendingPostsBloc>().add(TrendingPostsEvent.get());
    context.read<FollowRecommendationsBloc>().add(
      FollowRecommendationsEvent.get(),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocListener<UserDetailBloc, UserDetailState>(
      listener: (context, state) {
        if (state is UserUpdated) {
          final users = context.read<FollowRecommendationsBloc>().state.users;
          final index = users.indexWhere((user) => user.id == state.user.id);
          if (index != -1) {
            final updatedUsers = List<User>.from(users);
            updatedUsers[index] = state.user;
            context.read<FollowRecommendationsBloc>().add(
              FollowRecommendationsEvent.update(users: updatedUsers),
            );
          }
        }
      },
      child: BlocBuilder<TrendingPostsBloc, TrendingPostsState>(
        builder: (context, state) {
          final posts = state.posts.toList();

          if (state.status == TrendingPostsStatus.success) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshCompleted();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadComplete();
            }
          } else if (state.status == TrendingPostsStatus.failure) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshFailed();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadFailed();
            }
            if (posts.isEmpty) return FailureRetryButton(onPressed: _getData);
          }

          if (state.status == TrendingPostsStatus.initial ||
              (state.posts.isEmpty &&
                  state.status == TrendingPostsStatus.loading)) {
            return const BottomLoader();
          }

          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: state.hasNext,
            header: const ClassicHeader(),
            footer: const ClassicFooter(),
            controller: _refreshController,
            onRefresh: _getData,
            onLoading: () => context.read<TrendingPostsBloc>().add(
              TrendingPostsEvent.get(previousPosts: posts),
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _SectionHeader(
                    title: 'Suggested for you',
                    actionText: 'See all',
                    onTap: () =>
                        context.router.push(const FollowRecommendations()),
                  ),
                ),
                _buildFollowRecommendations(),

                const SliverToBoxAdapter(
                  child: _SectionHeader(title: 'Trending Posts'),
                ),

                PostListener(
                  posts: posts,
                  onPostsUpdated: (updatedPosts) {
                    context.read<TrendingPostsBloc>().add(
                      TrendingPostsEvent.update(posts: updatedPosts),
                    );
                  },
                  child: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final post = posts[index];
                      return PostTile(
                        key: ValueKey(post.id),
                        post: post,
                        isDependency: false,
                        checkVisibility: false,
                        onViewed: () => addPostView(context, 'Explore', post),
                      );
                    }, childCount: posts.length),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFollowRecommendations() {
    return BlocBuilder<FollowRecommendationsBloc, FollowRecommendationsState>(
      builder: (context, state) {
        final users = state.users.take(3).toList();
        final me = context.read<AuthBloc>().state.user!;

        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final user = users[index];
            return UserTile(
              user: user,
              me: me,
              showProfileButtons: true,
              selectedUsers: const [],
              onTap: () =>
                  context.router.push(ProfileRoute(username: user.username)),
            );
          }, childCount: users.length),
        );
      },
    );
  }
}

class _TrendingTab extends StatefulWidget {
  const _TrendingTab();

  @override
  State<_TrendingTab> createState() => _TrendingTabState();
}

class _TrendingTabState extends State<_TrendingTab>
    with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    context.read<TrendingTopicsBloc>().add(TrendingTopicsEvent.get());
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<TrendingTopicsBloc, TrendingTopicsState>(
      builder: (context, state) {
        final topics = state.topics.toList();

        if (state.status == TrendingTopicsStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        } else if (state.status == TrendingTopicsStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
          if (topics.isEmpty) {
            return FailureRetryButton(
              onPressed: () => context.read<TrendingTopicsBloc>().add(
                TrendingTopicsEvent.get(),
              ),
            );
          }
        }

        if (state.status == TrendingTopicsStatus.initial ||
            (state.status == TrendingTopicsStatus.loading && topics.isEmpty)) {
          return const BottomLoader();
        }

        return SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          header: const ClassicHeader(),
          controller: _refreshController,
          onRefresh: () =>
              context.read<TrendingTopicsBloc>().add(TrendingTopicsEvent.get()),
          child: topics.isEmpty
              ? const NoResults(text: 'No trending topics right now')
              : ListView.separated(
                  itemCount: topics.length,
                  separatorBuilder: (_, _) =>
                      const Divider(height: 1, indent: 64),
                  itemBuilder: (context, index) {
                    final topic = topics[index];
                    return _TrendingTopicTile(
                      rank: index + 1,
                      topic: topic,
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

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.actionText, this.onTap});

  final String title;
  final String? actionText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 8, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          if (actionText != null && onTap != null)
            TextButton(onPressed: onTap, child: Text(actionText!)),
        ],
      ),
    );
  }
}

class _TrendingTopicTile extends StatelessWidget {
  const _TrendingTopicTile({
    required this.rank,
    required this.topic,
    required this.onTap,
  });

  final int rank;
  final String topic;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // Rank Number
              Container(
                width: 32,
                alignment: Alignment.center,
                child: Text(
                  '$rank',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Topic Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trending',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.outline,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '#$topic',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // Trending Icon
              Icon(Icons.trending_up_rounded, color: colorScheme.primary),
            ],
          ),
        ),
      ),
    );
  }
}
