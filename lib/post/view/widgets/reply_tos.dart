import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/shared/add_post_view.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:democracy/post/view/widgets/post_widget_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReplyTos extends StatelessWidget {
  const ReplyTos({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReplyToBloc, ReplyToState>(
      buildWhen: (previous, current) {
        return post.id == current.postId;
      },
      builder: (context, state) {
        final replyTos = state.posts.toList();

        if (state.status == ReplyToStatus.failure) {
          if (replyTos.isEmpty) {
            return SliverToBoxAdapter(
              child: FailureRetryButton(
                onPressed: () => context.read<ReplyToBloc>().add(
                  ReplyToEvent.get(post: post),
                ),
              ),
            );
          }
        }

        return PostListener(
          posts: replyTos,
          onPostsUpdated: (posts) {
            context.read<ReplyToBloc>().add(ReplyToEvent.update(posts: posts));
          },
          child: SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              Post post = replyTos[index];
              return PostWidgetSelector(
                key: ValueKey(post.id),
                post: post,
                showTopThread:
                    post.replyTo != null || post.communityNoteOf != null,
                showBottomThread: true,
                hideBorder: true,
                onViewed: () {
                  addPostView(context, 'Reply Tos', post);
                },
              );
            }, childCount: replyTos.length),
          ),
        );
      },
    );
  }
}
