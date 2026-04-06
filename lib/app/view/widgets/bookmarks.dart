import 'package:democracy/post/bloc/bookmarks/bookmarks_bloc.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key, required this.user});

  final User user;

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    context.read<BookmarksBloc>().add(BookmarksEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            posts: posts,
            loading: state.status == BookmarksStatus.initial,
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
          );
        },
      ),
    );
  }
}
