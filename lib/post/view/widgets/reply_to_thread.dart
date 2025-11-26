import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReplyToThread extends StatefulWidget {
  const ReplyToThread({super.key, required this.post});

  final Post post;

  @override
  State<ReplyToThread> createState() => _ReplyToThreadState();
}

class _ReplyToThreadState extends State<ReplyToThread> {
  late List<Post> _posts = [];
  bool loading = true;
  bool failure = false;
  bool hasNextPage = false;

  @override
  void initState() {
    context.read<ReplyToBloc>().add(ReplyToEvent.get(post: widget.post));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, __) {
        if (_posts.isNotEmpty) {
          context.read<ReplyToBloc>().add(
            ReplyToEvent.unsubscribe(post: widget.post, posts: _posts),
          );
        }
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<WebsocketBloc, WebsocketState>(
            listener: (context, state) {
              if (state.status == WebsocketStatus.connected) {
                if (_posts.isNotEmpty) {
                  context.read<ReplyToBloc>().add(
                    ReplyToEvent.resubscribe(post: widget.post, posts: _posts),
                  );
                }
              }
            },
          ),
          BlocListener<ReplyToBloc, ReplyToState>(
            listener: (context, state) {
              if (state.status == ReplyToStatus.success) {
                if (widget.post.id == state.postId) {
                  setState(() {
                    _posts = state.posts.toList();
                    loading = false;
                    failure = false;
                  });
                }
              }
              if (state.status == ReplyToStatus.failure) {
                if (widget.post.id == state.postId) {
                  if (loading) {
                    setState(() {
                      loading = false;
                      failure = true;
                    });
                  }
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
          child: loading
              ? Container(
                  margin: EdgeInsets.only(top: 50),
                  child: BottomLoader(),
                )
              : failure
              ? FailureRetryButton(
                  onPressed: () {
                    context.read<ReplyToBloc>().add(
                      ReplyToEvent.get(post: widget.post),
                    );
                  },
                )
              : ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    Post post = _posts[index];
                    return PostTile(
                      key: ValueKey(post.id),
                      post: post,
                      showTopThread: post.replyTo != null,
                      showBottomThread: true,
                      hideBorder: true,
                    );
                  },
                  itemCount: _posts.length,
                ),
        ),
      ),
    );
  }
}
