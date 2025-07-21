import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/bloc/replies/replies_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/post/view/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Replies extends StatefulWidget {
  const Replies({super.key, required this.post});

  final Post post;

  @override
  State<Replies> createState() => _RepliesState();
}

class _RepliesState extends State<Replies> {
  List<Post> posts = [];
  bool failure = false;
  bool loading = true;

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
            if (state is RepliesLoaded) {
              if (widget.post.id == state.postId) {
                setState(() {
                  posts = state.posts.toList();
                  loading = false;
                  failure = false;
                });
              }
            }
            if (state is RepliesFailure) {
              if (widget.post.id == state.postId || state.postId == null) {
                setState(() {
                  failure = true;
                  loading = false;
                });
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
                    posts.add(post);
                  });
                }
                if (posts.any((element) => element.id == post.repostOf?.id)) {
                  setState(() {
                    posts[posts.indexWhere(
                          (element) => element.id == post.repostOf!.id,
                        )] =
                        post.repostOf!;
                  });
                }
                if (posts.any((element) => element.id == post.replyTo?.id)) {
                  setState(() {
                    posts[posts.indexWhere(
                          (element) => element.id == post.replyTo!.id,
                        )] =
                        post.replyTo!;
                  });
                }
              case PostUpdated(post: final post):
                if (posts.any((element) => element.id == post.id)) {
                  setState(() {
                    posts[posts.indexWhere(
                          (element) => element.id == post.id,
                        )] =
                        post;
                  });
                }
              case PostDeleted(:final postId):
                if (posts.any((element) => element.id == postId)) {
                  setState(() {
                    posts.removeWhere((element) => element.id == postId);
                  });
                }
            }
          },
        ),
      ],
      child:
          loading
              ? Container(
                margin: EdgeInsets.only(top: 20),
                child: BottomLoader(),
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
                padding: EdgeInsets.only(bottom: 50),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  Post post = posts[index];
                  return PostTile(key: ValueKey(post.id), post: post);
                },
                itemCount: posts.length,
              ),
    );
  }
}
