import 'package:collection/collection.dart';
import 'package:democracy/app/bloc/theme/theme_cubit.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void addPostView(BuildContext context, String origin, Post post) {
  var viewedPost = {origin: post.id};
  _checkAndAddView(context, viewedPost, post);
  if (post.repostOf != null) {
    viewedPost = {'$origin repost': post.id};
    _checkAndAddView(context, viewedPost, post);
  }
}

bool _checkAndAddView(
  BuildContext context,
  Map<String, int> viewedPost,
  Post post,
) {
  final themeState = context.read<ThemeCubit>().state;
  bool exists = themeState.viewedPosts.any(
    (element) => const DeepCollectionEquality().equals(element, viewedPost),
  );
  if (!exists) {
    context.read<PostDetailBloc>().add(PostDetailEvent.addView(post: post));
    context.read<ThemeCubit>().addViewedPost(viewedPost: viewedPost);
  }
  return exists;
}
