import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/bloc/replies/replies_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Replies extends StatefulWidget {
  const Replies({super.key, required this.post});

  final Post post;

  @override
  State<Replies> createState() => _RepliesState();
}

class _RepliesState extends State<Replies> {
  bool loading = true;
  bool failure = false;
  List<Post> _posts = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.getReplies(post: widget.post),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state is WebsocketConnected) {
              context.read<WebsocketBloc>().add(
                WebsocketEvent.getReplies(post: widget.post),
              );
            }
          },
        ),
        BlocListener<RepliesCubit, RepliesState>(
          listener: (context, state) {
            if (state.status == RepliesStatus.success) {
              if (widget.post.id == state.postId) {
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
            }
            if (state.status == RepliesStatus.failure) {
              if (widget.post.id == state.postId) {
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
            }
          },
        ),
        BlocListener<PostDetailCubit, PostDetailState>(
          listener: (context, state) {
            switch (state) {
              case PostCreated(post: final post):
                if (widget.post.id == post.replyTo?.id) {
                  setState(() {
                    _posts.add(post);
                  });
                }
            }
          },
        ),
      ],
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
        enablePullDown: false,
        enablePullUp: hasNextPage ? true : false,
        onRefresh: () {},
        onLoading: () {
          context.read<WebsocketBloc>().add(
            WebsocketEvent.getReplies(post: widget.post, lastPost: _posts.last),
          );
        },
        onFailure: () {
          context.read<WebsocketBloc>().add(
            WebsocketEvent.getReplies(post: widget.post),
          );
        },
      ),
    );
  }
}
