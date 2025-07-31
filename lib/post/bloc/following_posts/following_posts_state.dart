part of 'following_posts_cubit.dart';

enum FollowingPostsStatus { initial, loading, success, failure }

final class FollowingPostsState extends Equatable {
  const FollowingPostsState({
    this.status = FollowingPostsStatus.initial,
    this.posts = const [],
    this.hasNext = false,
  });

  final FollowingPostsStatus status;
  final List<Post> posts;
  final bool hasNext;

  FollowingPostsState copyWith({
    FollowingPostsStatus? status,
    List<Post>? posts,
    bool? hasNext,
  }) {
    return FollowingPostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''FollowingPostsState { status: $status, posts: ${posts.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}
