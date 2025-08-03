import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/post/bloc/draft_posts/draft_posts_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class DraftsPosts extends StatefulWidget {
  const DraftsPosts({super.key});

  @override
  State<DraftsPosts> createState() => _DraftsPostsState();
}

class _DraftsPostsState extends State<DraftsPosts> {
  bool loading = true;
  bool failure = false;
  List<Post> _posts = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getDraftPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, __) {
        context.read<WebsocketBloc>().add(
          WebsocketEvent.unsubscribeDraftPosts(),
        );
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Draft posts')),
        body: BlocListener<DraftPostsCubit, DraftPostsState>(
          listener: (context, state) {
            if (state.status == DraftPostsStatus.success) {
              setState(() {
                _posts = state.posts.toList();
                loading = false;
                failure = false;
                hasNextPage = state.hasNext;
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              });
            }
            if (state.status == DraftPostsStatus.failure) {
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
            enablePullUp: hasNextPage ? true : false,
            onRefresh: () {
              context.read<WebsocketBloc>().add(WebsocketEvent.getDraftPosts());
            },
            onLoading: () {
              context.read<WebsocketBloc>().add(
                WebsocketEvent.getDraftPosts(lastPost: _posts.last),
              );
            },
            onFailure: () {
              context.read<WebsocketBloc>().add(WebsocketEvent.getDraftPosts());
            },
          ),
        ),
      ),
    );
  }
}
