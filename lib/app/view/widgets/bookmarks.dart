import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/post/bloc/bookmarks/bookmarks_bloc.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key});

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  final RefreshController _refreshController = RefreshController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<BookmarksBloc>().add(BookmarksEvent.get());
    // Register the initial active controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ActiveScrollController.activate(_scrollController);
    });
  }

  @override
  void dispose() {
    // Clear the registry when leaving
    ActiveScrollController.deactivate(_scrollController);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

    return MainContainer(
      child: Scaffold(
        appBar: AppBar(title: Text('Bookmarks')),
        body: BlocBuilder<BookmarksBloc, BookmarksState>(
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
              scrollController: isWebLayout ? _scrollController: null,
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
        ),
      ),
    );
  }
}
