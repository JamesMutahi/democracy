import 'package:collection/collection.dart';
import 'package:democracy/app/bloc/global/global_cubit.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void addPostView(BuildContext context, String origin, Post post) {
  var viewedPost = {origin: post.id};
  _checkAndAddView(context, viewedPost, post);
  if (post.repostOf != null) {
    viewedPost = {'$origin ${post.id} repost': post.repostOf!.id};
    _checkAndAddView(context, viewedPost, post.repostOf!);
  }
}

bool _checkAndAddView(
  BuildContext context,
  Map<String, int> viewedPost,
  Post post,
) {
  final globalCubit = context.read<GlobalCubit>();
  bool exists = globalCubit.state.viewedPosts.any(
    (element) => const DeepCollectionEquality().equals(element, viewedPost),
  );
  if (!exists) {
    context.read<PostDetailBloc>().add(PostDetailEvent.addView(post: post));
    globalCubit.addViewedPost(viewedPost: viewedPost);
  }
  return exists;
}
