import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/bloc/replies/replies_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
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
                    int index = _posts.indexWhere(
                      (element) => element.author.id != post.author.id,
                    );
                    _posts.insert(index, post);
                  });
                }
            }
          },
        ),
      ],
      child: PostListener(
        posts: _posts,
        onPostsUpdated: (posts) {
          setState(() {
            _posts = posts;
          });
        },
        child:
            loading
                ? Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    child: BottomLoader(),
                  ),
                )
                : failure
                ? FailureRetryButton(
                  onPressed: () {
                    context.read<WebsocketBloc>().add(
                      WebsocketEvent.getReplies(post: widget.post),
                    );
                  },
                )
                : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    Post post = _posts[index];
                    bool showTopThread = false;
                    bool showBottomThread = false;
                    if (index == 0) {
                      showTopThread = false;
                      showBottomThread = true;
                    } else {
                      if (_posts[index - 1].author.id == post.author.id) {
                        showTopThread = true;
                      }
                      if (_posts.length != index + 1) {
                        if (_posts[index + 1].author.id == post.author.id) {
                          showBottomThread = true;
                        } else {
                          showBottomThread = false;
                        }
                      } else {
                        showBottomThread = false;
                      }
                    }
                    return PostTile(
                      key: ValueKey(post.id),
                      post: post,
                      showTopThread: showTopThread,
                      showBottomThread: showBottomThread,
                      checkVisibility: true,
                    );
                  },
                  itemCount: _posts.length,
                ),
      ),
    );
  }
}
