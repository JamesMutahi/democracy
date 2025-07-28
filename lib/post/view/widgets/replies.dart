import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/bloc/replies/replies_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Replies extends StatefulWidget {
  const Replies({super.key, required this.post});

  final Post post;

  @override
  State<Replies> createState() => _RepliesState();
}

class _RepliesState extends State<Replies> {
  List<Post> _posts = [];
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
            if (state.status == RepliesStatus.success) {
              if (widget.post.id == state.postId) {
                setState(() {
                  _posts = state.posts.toList();
                  loading = false;
                  failure = false;
                });
              }
            }
            if (state.status == RepliesStatus.failure) {
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
                    _posts.add(post);
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
                    Post post = _posts[index];
                    return PostTile(key: ValueKey(post.id), post: post);
                  },
                  itemCount: _posts.length,
                ),
      ),
    );
  }
}
