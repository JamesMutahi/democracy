import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/post/bloc/posts/posts_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:democracy/user/models/user.dart';
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
  bool loading = true;
  bool failure = false;
  List<Post> _posts = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<PostsBloc>().add(PostsEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, bool innerBoxIsScrolled) {
        return [
          CustomAppBar(
            user: widget.user,
            notifications: widget.notifications,
            middle: [
              AppBarSearchBar(
                hintText: 'Search',
                onChanged: (value) {
                  context.read<PostsBloc>().add(
                    PostsEvent.get(searchTerm: value),
                  );
                },
                showFilterIcon: true,
                onFilterTap: () {
                  //   TODO:
                },
              ),
            ],
          ),
        ];
      },
      body: MultiBlocListener(
        listeners: [
          BlocListener<PostsBloc, PostsState>(
            listener: (context, state) {
              if (state.status == PostsStatus.success) {
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
              if (state.status == PostsStatus.failure) {
                if (loading) {
                  setState(() {
                    loading = false;
                    failure = true;
                  });
                }
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshFailed();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadFailed();
                }
              }
            },
          ),
          BlocListener<WebsocketBloc, WebsocketState>(
            listener: (context, state) {
              if (state.status == WebsocketStatus.connected) {
                context.read<PostsBloc>().add(
                  PostsEvent.resubscribe(posts: _posts),
                );
              }
            },
          ),
        ],
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
          onRefresh: () {
            context.read<PostsBloc>().add(PostsEvent.get());
          },
          onLoading: () {
            context.read<PostsBloc>().add(
              PostsEvent.get(lastPost: _posts.last),
            );
          },
          onFailure: () {
            context.read<PostsBloc>().add(PostsEvent.get());
          },
        ),
      ),
    );
  }
}
