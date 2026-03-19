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
import 'package:democracy/user/view/profile.dart';
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
                            builder: (context) => ResultsPage(
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
      body: Placeholder(),
    );
  }
}

class ResultsPage extends StatefulWidget {
  const ResultsPage({
    super.key,
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
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage>
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
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<PostFilterCubit, PostFilterState>(
            listener: (context, state) {
              if (state.searchTerm == widget.searchTerm) {
                context.read<PostsBloc>().add(
                  PostsEvent.get(
                    searchTerm: widget.searchTerm,
                    startDate: state.startDate,
                    endDate: state.endDate,
                  ),
                );
                context.read<RecentPostsBloc>().add(
                  RecentPostsEvent.get(
                    searchTerm: widget.searchTerm,
                    startDate: state.startDate,
                    endDate: state.endDate,
                  ),
                );
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
                            children: [
                              BackButton(),
                              ResultsSearchBar(
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
                                    context
                                        .read<PostFilterCubit>()
                                        .searchTermChanged(
                                          onExplorePage: false,
                                          searchTerm: _controller.text,
                                        );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ResultsPage(
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
              body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _TopPosts(
                    searchTerm: widget.searchTerm,
                    startDate: startDate,
                    endDate: endDate,
                  ),
                  _RecentPosts(
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
    );
  }
}

class _TopPosts extends StatefulWidget {
  const _TopPosts({
    required this.searchTerm,
    required this.startDate,
    required this.endDate,
  });

  final String searchTerm;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<_TopPosts> createState() => _TopPostsState();
}

class _TopPostsState extends State<_TopPosts>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool loading = true;
  bool failure = false;
  List<Post> _posts = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

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

    return BlocListener<PostsBloc, PostsState>(
      listener: (context, state) {
        if (state.status == PostsStatus.success) {
          if (state.searchTerm == widget.searchTerm) {
            setState(() {
              _posts = state.posts.toList();
              loading = false;
              failure = false;
              hasNextPage = state.hasNext;
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshCompleted();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadComplete();
              }
            });
          }
        }
        if (state.status == PostsStatus.failure) {
          if (loading) {
            setState(() {
              loading = false;
              failure = true;
            });
          }
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }
      },
      child: BlocConsumer<PostFilterCubit, PostFilterState>(
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
        builder: (context, state) {
          return PostListView(
            posts: _posts,
            loading: loading,
            failure: failure,
            onPostsUpdated: (posts) {
              setState(() {
                _posts = posts;
              });
            },
            refreshController: _refreshController,
            enablePullDown: true,
            enablePullUp: hasNextPage,
            checkVisibility: true,
            onRefresh: _getPosts,
            onLoading: () {
              _getPosts(previousPosts: _posts);
            },
            onFailure: _getPosts,
          );
        },
      ),
    );
  }
}

class _RecentPosts extends StatefulWidget {
  const _RecentPosts({required this.searchTerm, this.startDate, this.endDate});

  final String searchTerm;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<_RecentPosts> createState() => _RecentPostsState();
}

class _RecentPostsState extends State<_RecentPosts>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool loading = true;
  bool failure = false;
  List<Post> _posts = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

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
    return BlocListener<RecentPostsBloc, RecentPostsState>(
      listener: (context, state) {
        if (state.status == RecentPostsStatus.success) {
          if (state.searchTerm == widget.searchTerm) {
            setState(() {
              _posts = state.posts.toList();
              loading = false;
              failure = false;
              hasNextPage = state.hasNext;
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshCompleted();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadComplete();
              }
            });
          }
        }
        if (state.status == RecentPostsStatus.failure) {
          if (loading) {
            setState(() {
              loading = false;
              failure = true;
            });
          }
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }
      },
      child: PostListView(
        posts: _posts,
        loading: loading,
        failure: failure,
        onPostsUpdated: (posts) {
          setState(() {
            _posts = posts;
          });
        },
        refreshController: _refreshController,
        enablePullDown: true,
        enablePullUp: hasNextPage,
        checkVisibility: true,
        onRefresh: _getPosts,
        onLoading: () {
          _getPosts(previousPosts: _posts);
        },
        onFailure: _getPosts,
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

  bool loading = true;
  bool failure = false;
  List<User> _users = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    super.initState();
    context.read<UsersBloc>().add(
      UsersEvent.get(searchTerm: widget.searchTerm),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<UsersBloc, UsersState>(
      listener: (context, state) {
        if (state.status == UsersStatus.success) {
          if (state.searchTerm == widget.searchTerm) {
            setState(() {
              _users = state.users;
              loading = false;
              failure = false;
              hasNextPage = state.hasNext;
            });
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshCompleted();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadComplete();
            }
          }
        }
        if (state.status == UsersStatus.failure) {
          if (loading) {
            setState(() {
              loading = false;
              failure = true;
            });
          }
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadFailed();
          }
        }
      },
      child: BlocBuilder<PostFilterCubit, PostFilterState>(
        builder: (context, state) {
          void getUsers({User? lastUser}) {
            context.read<UsersBloc>().add(
              UsersEvent.get(lastUser: lastUser, searchTerm: state.searchTerm),
            );
          }

          return UsersListView(
            users: _users,
            loading: loading,
            failure: failure,
            refreshController: _refreshController,
            enablePullUp: hasNextPage,
            showProfileButtons: true,
            onUserTap: (user) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(user: user),
                ),
              );
            },
            onLoading: () {
              getUsers(lastUser: _users.last);
            },
            onFailure: getUsers,
            onUsersUpdated: (users) {
              setState(() {
                _users = users;
              });
            },
          );
        },
      ),
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
  late DateTime? startDate = widget.startDate;
  late DateTime? endDate = widget.endDate;

  @override
  Widget build(BuildContext context) {
    return FiltersModal(
      applyButtonIsDisabled:
          (startDate == widget.startDate && endDate == widget.startDate),
      clearButtonIsDisabled: startDate == null && endDate == null,
      onApply: () {
        context.read<PostFilterCubit>().datesChanged(
          onExplorePage: widget.onExplorePage,
          startDate: startDate,
          endDate: endDate,
        );
      },
      onClear: () {
        context.read<PostFilterCubit>().clearFilters(
          onExplorePage: widget.onExplorePage,
        );
        Navigator.pop(context);
      },
      widgets: [
        DateRangeFilter(
          value: [startDate, endDate],
          onValueChanged: (dates) {
            setState(() {
              startDate = dates.isNotEmpty ? dates[0] : null;
              endDate = dates.length == 2 ? dates[1] : null;
            });
          },
        ),
        const Divider(),
      ],
    );
  }
}
