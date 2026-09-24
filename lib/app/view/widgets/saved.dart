import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/post/bloc/bookmarks/bookmarks_bloc.dart';
import 'package:democracy/post/bloc/likes/likes_bloc.dart';
import 'package:democracy/post/bloc/post_filter/post_filter_cubit.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> with SingleTickerProviderStateMixin {
  final ScrollController _bookmarksScrollController = ScrollController();
  final ScrollController _likesScrollController = ScrollController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
    ActiveScrollController.deactivate(_bookmarksScrollController);
    ActiveScrollController.deactivate(_likesScrollController);
  }

  @override
  void dispose() {
    _deactivateTabScrollControllers();
    _tabController.removeListener(_onTabChanged);
    _bookmarksScrollController.dispose();
    _likesScrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  ScrollController? get _activeScrollController {
    return _tabController.index == 0
        ? _bookmarksScrollController
        : _likesScrollController;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostFilterCubit(),
      child: MainContainer(
        child: Scaffold(
          body: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    forceElevated: true,
                    title: Text('Saved'),
                    bottom: _buildTabBar(),
                  ),
                ];
              },
              body: _buildTabBarView(),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      dividerColor: Theme.of(context).disabledColor.withAlpha(30),
      labelStyle: Theme.of(context).textTheme.titleMedium,
      tabs: [
        Tab(text: 'Bookmarks'),
        Tab(text: 'Likes'),
      ],
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _Bookmarks(scrollController: _bookmarksScrollController),
        _Likes(scrollController: _likesScrollController),
      ],
    );
  }
}

class _Bookmarks extends StatefulWidget {
  const _Bookmarks({required this.scrollController});

  final ScrollController scrollController;

  @override
  State<_Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<_Bookmarks>
    with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    context.read<BookmarksBloc>().add(BookmarksEvent.get());
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

    return BlocBuilder<BookmarksBloc, BookmarksState>(
      builder: (context, state) {
        final posts = state.posts.toList();

        if (state.status == BookmarksStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == BookmarksStatus.failure) {
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
              state.status == BookmarksStatus.initial ||
              (state.status == BookmarksStatus.loading && posts.isEmpty),
          failure: state.posts.isNotEmpty
              ? false
              : state.status == BookmarksStatus.failure,
          onPostsUpdated: (posts) {
            context.read<BookmarksBloc>().add(
              BookmarksEvent.update(posts: posts),
            );
          },
          refreshController: _refreshController,
          enablePullDown: true,
          enablePullUp: state.hasNext,
          onRefresh: () {
            context.read<BookmarksBloc>().add(BookmarksEvent.get());
          },
          onLoading: () {
            context.read<BookmarksBloc>().add(
              BookmarksEvent.get(previousPosts: posts),
            );
          },
          onFailure: () {
            context.read<BookmarksBloc>().add(BookmarksEvent.get());
          },
          origin: null,
        );
      },
    );
  }
}

class _Likes extends StatefulWidget {
  const _Likes({required this.scrollController});

  final ScrollController scrollController;

  @override
  State<_Likes> createState() => _LikesState();
}

class _LikesState extends State<_Likes> with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    context.read<LikesBloc>().add(LikesEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<LikesBloc, LikesState>(
      builder: (context, state) {
        final posts = state.posts.toList();

        if (posts.isEmpty && state.status == LikesStatus.loading) {
          return const BottomLoader();
        }

        if (state.status == LikesStatus.success) {
          if (_refreshController.headerStatus == RefreshStatus.refreshing) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.footerStatus == LoadStatus.loading) {
            _refreshController.loadComplete();
          }
        }

        if (state.status == LikesStatus.failure) {
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
              state.status == LikesStatus.initial ||
              (state.status == LikesStatus.initial && posts.isEmpty),
          failure: state.posts.isNotEmpty
              ? false
              : state.status == LikesStatus.failure,
          onPostsUpdated: (posts) {
            context.read<LikesBloc>().add(LikesEvent.update(posts: posts));
          },
          refreshController: _refreshController,
          enablePullDown: posts.isNotEmpty,
          enablePullUp: state.hasNext,
          onRefresh: () {
            context.read<LikesBloc>().add(LikesEvent.get());
          },
          onLoading: () {
            context.read<LikesBloc>().add(LikesEvent.get(previousPosts: posts));
          },
          onFailure: () {
            context.read<LikesBloc>().add(LikesEvent.get());
          },
          origin: null,
        );
      },
    );
  }
}
