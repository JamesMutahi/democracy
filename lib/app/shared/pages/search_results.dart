import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/view/widgets/filters_modal.dart';
import 'package:democracy/app/view/widgets/results_search_bar.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/post_filter/post_filter_cubit.dart';
import 'package:democracy/post/bloc/posts/posts_bloc.dart';
import 'package:democracy/post/bloc/recent/recent_posts_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:democracy/app/view/router/router.gr.dart' as router_gr;

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
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.searchTerm;
    context.read<PostDetailBloc>().add(
      PostDetailEvent.saveSearchedTerm(searchTerm: widget.searchTerm),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<PostFilterCubit, PostFilterState>(
              buildWhen: (previous, current) {
                return current.searchTerm == widget.searchTerm;
              },
              builder: (context, state) {
                return NestedScrollView(
                  headerSliverBuilder: (context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        floating: true,
                        snap: true,
                        forceElevated: true,
                        automaticallyImplyLeading: false,
                        flexibleSpace: Builder(
                          builder: (context) {
                            return SizedBox(
                              height: 50,
                              child: Row(
                                children: [
                                  BackButton(),
                                  _buildSearchBar(
                                    cubit: context.read<PostFilterCubit>(),
                                    startDate: state.startDate,
                                    endDate: state.endDate,
                                    filterCount: state.count,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        bottom: TabBar(
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
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        _TopPostsTab(
                          searchTerm: widget.searchTerm,
                          startDate: state.startDate,
                          endDate: state.endDate,
                        ),
                        _RecentPostsTab(
                          searchTerm: widget.searchTerm,
                          startDate: state.startDate,
                          endDate: state.endDate,
                        ),
                        _ProfilesTab(searchTerm: widget.searchTerm),
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

  Widget _buildSearchBar({
    required PostFilterCubit cubit,
    required DateTime? startDate,
    required DateTime? endDate,
    required int filterCount,
  }) {
    return ResultsSearchBar(
      controller: _controller,
      filterCount: filterCount,
      filterModal: SearchFilters(
        onExplorePage: false,
        startDate: startDate,
        endDate: endDate,
        cubit: cubit,
      ),
      onSubmitted: (value) async {
        if (_controller.text.isNotEmpty &&
            widget.searchTerm != _controller.text) {
          final route = router_gr.SearchResults(
            searchTerm: _controller.text,
            startDate: startDate,
            endDate: endDate,
            filterCount: filterCount,
          );

          await route.push(context);

          _controller.text = widget.searchTerm;
        }
      },
    );
  }
}

class _TopPostsTab extends StatefulWidget {
  const _TopPostsTab({
    required this.searchTerm,
    required this.startDate,
    required this.endDate,
  });

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
    required this.searchTerm,
    this.startDate,
    this.endDate,
  });

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
  const _ProfilesTab({required this.searchTerm});

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
          users: users,
          loading: state.status == UsersStatus.initial,
          failure: state.users.isNotEmpty
              ? false
              : state.status == UsersStatus.failure,
          refreshController: _refreshController,
          enablePullUp: state.hasNext,
          showProfileButtons: true,
          onUserTap: (user) {
            context.router.push(router_gr.ProfileRoute(userId: user.id));
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
