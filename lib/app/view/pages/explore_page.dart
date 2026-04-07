import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/utils/more_pop_up.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/app/view/widgets/filters_modal.dart';
import 'package:democracy/app/view/widgets/results_search_bar.dart';
import 'package:democracy/post/bloc/post_filter/post_filter_cubit.dart';
import 'package:democracy/post/bloc/posts/posts_bloc.dart';
import 'package:democracy/post/bloc/recent/recent_posts_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/utils/profile_navigator.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({
    super.key,
    required this.user,
    required this.notifications,
  });

  final User user;
  final int notifications;

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController _controller = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  int filterCount = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, bool innerBoxIsScrolled) {
        return [
          CustomAppBar(
            user: widget.user,
            notifications: widget.notifications,
            middle: Text(
              'Explore',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: BlocConsumer<PostFilterCubit, PostFilterState>(
                listener: (context, state) {
                  if (state.onExplorePage) {
                    if (state.startDate != startDate ||
                        state.endDate != endDate) {
                      setState(() {
                        startDate = state.startDate;
                        endDate = state.endDate;
                        filterCount = state.count;
                      });
                    }
                  }
                },
                builder: (context, state) {
                  return CustomSearchBar(
                    controller: _controller,
                    hintText: 'Search',
                    filterCount: filterCount,
                    onSubmitted: (value) {
                      if (_controller.text.trim().isNotEmpty) {
                        context.read<PostFilterCubit>().searchTermChanged(
                          onExplorePage: true,
                          searchTerm: _controller.text,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => _ResultsPage(
                              searchTerm: _controller.text,
                              startDate: startDate,
                              endDate: endDate,
                              filterCount: filterCount,
                            ),
                          ),
                        ).whenComplete(() {
                          _controller.clear();
                          setState(() {
                            startDate = null;
                            endDate = null;
                            filterCount = 0;
                          });
                        });
                      }
                    },
                    onFilterTap: () {
                      showGeneralDialog(
                        context: context,
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return _FiltersModal(
                            onExplorePage: true,
                            startDate: startDate,
                            endDate: endDate,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ];
      },
      body: _TrendingSection(),
    );
  }
}

class _TrendingSection extends StatelessWidget {
  const _TrendingSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).disabledColor.withAlpha(30),
              ),
            ),
          ),
          child: Text(
            'Trending now',
            style: TextStyle(color: Theme.of(context).colorScheme.outline),
          ),
        ),
        _TrendingTile(),
      ],
    );
  }
}

class _TrendingTile extends StatelessWidget {
  const _TrendingTile();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).disabledColor.withAlpha(30),
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AI - Cognitive decline',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(radius: 10, backgroundColor: Colors.red),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Text('4000 posts'),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: MorePopUp(texts: []),
        ),
      ],
    );
  }
}

class _ResultsPage extends StatefulWidget {
  const _ResultsPage({
    required this.searchTerm,
    required this.startDate,
    required this.endDate,
    required this.filterCount,
  });

  final String searchTerm;
  final DateTime? startDate;
  final DateTime? endDate;
  final int filterCount;

  @override
  State<_ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<_ResultsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final TextEditingController _controller = TextEditingController();
  late DateTime? startDate = widget.startDate;
  late DateTime? endDate = widget.endDate;
  late int filterCount = widget.filterCount;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.searchTerm;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<PostFilterCubit, PostFilterState>(
            listener: (context, state) {
              if (state.searchTerm == widget.searchTerm) {
                setState(() {
                  startDate = state.startDate;
                  endDate = state.endDate;
                  filterCount = state.count;
                });
              }
            },
            child: NestedScrollView(
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
                            children: [BackButton(), _buildSearchBar()],
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
                      startDate: startDate,
                      endDate: endDate,
                    ),
                    _RecentPostsTab(
                      searchTerm: widget.searchTerm,
                      startDate: startDate,
                      endDate: endDate,
                    ),
                    _ProfilesTab(searchTerm: widget.searchTerm),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return ResultsSearchBar(
      controller: _controller,
      filterCount: filterCount,
      filterModal: _FiltersModal(
        onExplorePage: false,
        startDate: startDate,
        endDate: endDate,
      ),
      onSubmitted: (value) {
        if (_controller.text.isNotEmpty &&
            widget.searchTerm != _controller.text) {
          context.read<PostFilterCubit>().searchTermChanged(
            onExplorePage: false,
            searchTerm: _controller.text,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _ResultsPage(
                searchTerm: _controller.text,
                startDate: startDate,
                endDate: endDate,
                filterCount: filterCount,
              ),
            ),
          ).whenComplete(() {
            _controller.text = widget.searchTerm;
          });
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
  @override
  bool get wantKeepAlive => true;

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
            failure: state.posts.isNotEmpty
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
            navigateToProfilePage(context: context, user: user);
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

class _FiltersModal extends StatefulWidget {
  const _FiltersModal({
    required this.onExplorePage,
    required this.startDate,
    required this.endDate,
  });

  final bool onExplorePage;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<_FiltersModal> createState() => _FiltersModalState();
}

class _FiltersModalState extends State<_FiltersModal> {
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
          value: [_startDate, _endDate],
          onValueChanged: (dates) {
            setState(() {
              _startDate = dates.isNotEmpty ? dates[0] : null;
              _endDate = dates.length == 2 ? dates[1] : null;
            });
          },
        ),
        const Divider(),
      ],
    );
  }

  void _applyFilters() {
    context.read<PostFilterCubit>().datesChanged(
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
