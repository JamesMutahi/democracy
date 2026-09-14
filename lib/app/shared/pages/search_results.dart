import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/app/view/widgets/explore_search_anchor.dart';
import 'package:democracy/app/view/widgets/filters_modal.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/post_filter/post_filter_cubit.dart';
import 'package:democracy/post/bloc/posts/posts_bloc.dart';
import 'package:democracy/post/bloc/recent/recent_posts_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:democracy/app/view/router/router.gr.dart' as router_gr;
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class SearchResults extends StatefulWidget {
  const SearchResults({
    super.key,
    @QueryParam() this.searchTerm = '',
    @QueryParam() this.startDate,
    @QueryParam() this.endDate,
    @QueryParam() this.filterCount = 0,
  });

  final String searchTerm;
  final DateTime? startDate;
  final DateTime? endDate;
  final int filterCount;

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  final SearchController _searchController = SearchController();
  final ScrollController _topScrollController = ScrollController();
  final ScrollController _recentScrollController = ScrollController();
  final ScrollController _profileScrollController = ScrollController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.searchTerm;
    context.read<PostDetailBloc>().add(
      PostDetailEvent.saveSearchedTerm(searchTerm: widget.searchTerm),
    );
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);

    // Register the initial active controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ActiveScrollController.activate(_activeScrollController!);
    });
  }

  void _onTabChanged() {
    _deactivateTabScrollControllers();
    ActiveScrollController.activate(_activeScrollController!);
  }

  void _deactivateTabScrollControllers() {
    ActiveScrollController.deactivate(_topScrollController);
    ActiveScrollController.deactivate(_recentScrollController);
    ActiveScrollController.deactivate(_profileScrollController);
  }

  @override
  void dispose() {
    _deactivateTabScrollControllers();
    _searchController.dispose();
    _tabController.removeListener(_onTabChanged);
    _topScrollController.dispose();
    _recentScrollController.dispose();
    _profileScrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  ScrollController? get _activeScrollController {
    return switch (_tabController.index) {
      0 => _topScrollController,
      1 => _recentScrollController,
      2 => _profileScrollController,
      _ => _topScrollController,
    };
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider(
      create: (context) => PostFilterCubit()
        ..initialize(
          onExplorePage: false,
          searchTerm: widget.searchTerm,
          startDate: widget.startDate,
          endDate: widget.endDate,
        ),
      child: MainContainer(
        child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<PostFilterCubit, PostFilterState>(
              buildWhen: (previous, current) {
                return current.searchTerm == widget.searchTerm;
              },
              builder: (context, state) {
                return NestedScrollView(
                  headerSliverBuilder: (context, bool innerBoxIsScrolled) {
                    final filterCubit = context.read<PostFilterCubit>();
                    return [
                      SliverAppBar(
                        floating: true,
                        snap: true,
                        forceElevated: true,
                        automaticallyImplyLeading: false,
                        flexibleSpace: Builder(
                          builder: (context) {
                            return Row(
                              children: [
                                BackButton(),
                                Expanded(
                                  child: SizedBox(
                                    height: 60,
                                    child: ExploreSearchAnchor(
                                      searchController: _searchController,
                                      filterCubit: filterCubit,
                                      filterState: state,
                                      onSubmitted: () {
                                        _searchController.text =
                                            widget.searchTerm;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        bottom: TabBar(
                          controller: _tabController,
                          dividerColor: Theme.of(
                            context,
                          ).colorScheme.outlineVariant,
                          labelStyle: Theme.of(context).textTheme.titleMedium,
                          tabs: [
                            Tab(text: 'Top'),
                            Tab(text: 'Recent'),
                            Tab(text: 'Profiles'),
                          ],
                        ),
                      ),
                    ];
                  },
                  body: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => PostsBloc(
                          webSocketService: context.read<WebSocketService>(),
                        ),
                      ),
                      BlocProvider(
                        create: (context) => RecentPostsBloc(
                          webSocketService: context.read<WebSocketService>(),
                        ),
                      ),
                      BlocProvider(
                        create: (context) => UsersBloc(
                          webSocketService: context.read<WebSocketService>(),
                        ),
                      ),
                    ],
                    child: TabBarView(
                      controller: _tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        _TopPostsTab(
                          scrollController: _topScrollController,
                          searchTerm: widget.searchTerm,
                          startDate: state.startDate,
                          endDate: state.endDate,
                        ),
                        _RecentPostsTab(
                          scrollController: _recentScrollController,
                          searchTerm: widget.searchTerm,
                          startDate: state.startDate,
                          endDate: state.endDate,
                        ),
                        _ProfilesTab(
                          scrollController: _profileScrollController,
                          searchTerm: widget.searchTerm,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _TopPostsTab extends StatefulWidget {
  const _TopPostsTab({
    required this.scrollController,
    required this.searchTerm,
    required this.startDate,
    required this.endDate,
  });

  final ScrollController scrollController;
  final String searchTerm;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<_TopPostsTab> createState() => _TopPostsState();
}

class _TopPostsState extends State<_TopPostsTab>
    with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  void _getPosts({List<Post>? previousPosts}) {
    context.read<PostsBloc>().add(
      PostsEvent.get(
        previousPosts: previousPosts,
        searchTerm: widget.searchTerm,
        startDate: widget.startDate,
        endDate: widget.endDate,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

    return BlocListener<PostFilterCubit, PostFilterState>(
      listener: (context, state) {
        if (state.searchTerm == widget.searchTerm) {
          context.read<PostsBloc>().add(
            PostsEvent.get(
              searchTerm: widget.searchTerm,
              startDate: state.startDate,
              endDate: state.endDate,
            ),
          );
        }
      },
      child: BlocBuilder<PostsBloc, PostsState>(
        buildWhen: (previous, current) {
          return widget.searchTerm == current.searchTerm;
        },
        builder: (context, state) {
          final posts = state.posts.toList();

          if (state.status == PostsStatus.success) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshCompleted();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadComplete();
            }
          }

          if (state.status == PostsStatus.failure) {
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
            loading: state.status == PostsStatus.initial,
            failure: posts.isNotEmpty
                ? false
                : state.status == PostsStatus.failure,
            onPostsUpdated: (posts) {
              context.read<PostsBloc>().add(PostsEvent.update(posts: posts));
            },
            refreshController: _refreshController,
            enablePullDown: true,
            enablePullUp: state.hasNext,
            checkVisibility: true,
            onRefresh: _getPosts,
            onLoading: () {
              _getPosts(previousPosts: posts);
            },
            onFailure: _getPosts,
            origin: 'Top posts',
          );
        },
      ),
    );
  }
}

class _RecentPostsTab extends StatefulWidget {
  const _RecentPostsTab({
    required this.scrollController,
    required this.searchTerm,
    this.startDate,
    this.endDate,
  });

  final ScrollController scrollController;
  final String searchTerm;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<_RecentPostsTab> createState() => _RecentPostsState();
}

class _RecentPostsState extends State<_RecentPostsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final RefreshController _refreshController = RefreshController();
  String sortBy = 'recent';

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  void _getPosts({List<Post>? previousPosts}) {
    context.read<RecentPostsBloc>().add(
      RecentPostsEvent.get(
        previousPosts: previousPosts,
        searchTerm: widget.searchTerm,
        startDate: widget.startDate,
        endDate: widget.endDate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

    return BlocListener<PostFilterCubit, PostFilterState>(
      listener: (context, state) {
        if (state.searchTerm == widget.searchTerm) {
          context.read<RecentPostsBloc>().add(
            RecentPostsEvent.get(
              searchTerm: widget.searchTerm,
              startDate: state.startDate,
              endDate: state.endDate,
            ),
          );
        }
      },
      child: BlocBuilder<RecentPostsBloc, RecentPostsState>(
        buildWhen: (previous, current) {
          return widget.searchTerm == current.searchTerm;
        },
        builder: (context, state) {
          final posts = state.posts.toList();

          if (state.status == RecentPostsStatus.success) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshCompleted();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadComplete();
            }
          }

          if (state.status == RecentPostsStatus.failure) {
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
            loading: state.status == RecentPostsStatus.initial,
            failure: state.posts.isNotEmpty
                ? false
                : state.status == RecentPostsStatus.failure,
            onPostsUpdated: (posts) {
              context.read<RecentPostsBloc>().add(
                RecentPostsEvent.update(posts: posts),
              );
            },
            refreshController: _refreshController,
            enablePullDown: true,
            enablePullUp: state.hasNext,
            checkVisibility: true,
            onRefresh: _getPosts,
            onLoading: () {
              _getPosts(previousPosts: posts);
            },
            onFailure: _getPosts,
            origin: 'Recent posts',
          );
        },
      ),
    );
  }
}

class _ProfilesTab extends StatefulWidget {
  const _ProfilesTab({
    required this.scrollController,
    required this.searchTerm,
  });

  final ScrollController scrollController;
  final String searchTerm;

  @override
  State<_ProfilesTab> createState() => _ProfilesTabState();
}

class _ProfilesTabState extends State<_ProfilesTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<UsersBloc>().add(
      UsersEvent.get(searchTerm: widget.searchTerm),
    );
    super.initState();
  }

  void _getUsers({User? lastUser}) {
    context.read<UsersBloc>().add(
      UsersEvent.get(searchTerm: widget.searchTerm, lastUser: lastUser),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

    return BlocBuilder<UsersBloc, UsersState>(
      buildWhen: (previous, current) {
        return widget.searchTerm == current.searchTerm;
      },
      builder: (context, state) {
        final users = state.users.toList();

        if (state.status == UsersStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == UsersStatus.failure) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }

        return UsersListView(
          scrollController: isWebLayout ? widget.scrollController : null,
          physics: isWebLayout ? NeverScrollableScrollPhysics() : null,
          users: users,
          loading: state.status == UsersStatus.initial,
          failure: state.users.isNotEmpty
              ? false
              : state.status == UsersStatus.failure,
          refreshController: _refreshController,
          enablePullUp: state.hasNext,
          showProfileButtons: true,
          onUserTap: (user) {
            context.router.push(
              router_gr.ProfileRoute(username: user.username),
            );
          },
          onLoading: () {
            _getUsers(lastUser: users.last);
          },
          onFailure: _getUsers,
          onUsersUpdated: (users) {
            context.read<UsersBloc>().add(UsersEvent.update(users: users));
          },
        );
      },
    );
  }
}

class SearchFilters extends StatefulWidget {
  const SearchFilters({
    super.key,
    required this.onExplorePage,
    required this.startDate,
    required this.endDate,
    required this.cubit,
  });

  final bool onExplorePage;
  final DateTime? startDate;
  final DateTime? endDate;
  final PostFilterCubit cubit;

  @override
  State<SearchFilters> createState() => _SearchFiltersState();
}

class _SearchFiltersState extends State<SearchFilters> {
  late DateTime? _startDate = widget.startDate;
  late DateTime? _endDate = widget.endDate;

  bool get _isUnchanged =>
      _startDate == widget.startDate && _endDate == widget.endDate;

  bool get _isDefaultState => _startDate == null && _endDate == null;

  @override
  Widget build(BuildContext context) {
    return FiltersModal(
      applyButtonIsDisabled: _isUnchanged,
      clearButtonIsDisabled: _isDefaultState,
      onApply: _applyFilters,
      onClear: _clearFilters,
      widgets: [
        DateRangeFilter(
          key: ValueKey('dateRange_${_startDate}_$_endDate'),
          initialValue: _startDate == null || _endDate == null
              ? null
              : DateTimeRange(start: _startDate!, end: _endDate!),
          onChanged: (value) {
            setState(() {
              _startDate = value?.start;
              _endDate = value?.end;
            });
          },
        ),
        const Divider(),
      ],
    );
  }

  void _applyFilters() {
    widget.cubit.datesChanged(
      onExplorePage: widget.onExplorePage,
      startDate: _startDate,
      endDate: _endDate,
    );
  }

  void _clearFilters() {
    setState(() {
      _startDate = null;
      _endDate = null;
    });
  }
}
