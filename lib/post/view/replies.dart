import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/post/bloc/replies/replies_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_list.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
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
    return BlocListener<RepliesCubit, RepliesState>(
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
              : PostList(key: UniqueKey(), posts: posts),
    );
  }
}
