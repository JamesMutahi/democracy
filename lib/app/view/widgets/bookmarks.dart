import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/post/bloc/bookmarks/bookmarks_cubit.dart';
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
  bool loading = true;
  bool failure = false;
  List<Post> _posts = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bookmarks')),
      body: BlocListener<BookmarksCubit, BookmarksState>(
        listener: (context, state) {
          if (state.status == BookmarksStatus.loading) {
            setState(() {
              if (_refreshController.headerStatus != RefreshStatus.refreshing &&
                  _refreshController.footerStatus != LoadStatus.loading) {
                setState(() {
                  loading = true;
                  failure = false;
                });
              }
            });
          }
          if (state.status == BookmarksStatus.success) {
            setState(() {
              loading = false;
              failure = false;
              _posts = state.posts;
              hasNextPage = state.hasNext;
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshCompleted();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadComplete();
              }
            });
          }
          if (state.status == BookmarksStatus.failure) {
            if (_refreshController.headerStatus != RefreshStatus.refreshing &&
                _refreshController.footerStatus != LoadStatus.loading) {
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
          physics: NeverScrollableScrollPhysics(),
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
          enablePullUp: hasNextPage ? true : false,
          onRefresh: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getBookmarks(user: widget.user),
            );
          },
          onLoading: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getBookmarks(
                user: widget.user,
                lastPost: _posts.last,
              ),
            );
          },
          onFailure: () {
            context.read<WebsocketBloc>().add(
              WebsocketEvent.getBookmarks(user: widget.user),
            );
          },
        ),
      ),
    );
  }
}
