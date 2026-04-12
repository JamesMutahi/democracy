part of 'trending_posts_bloc.dart';

enum TrendingPostsStatus { initial, loading, success, failure }

final class TrendingPostsState extends Equatable {
  const TrendingPostsState({
    this.status = TrendingPostsStatus.initial,
    this.posts = const [],
    this.hasNext = false,
  });

  final TrendingPostsStatus status;
  final List<Post> posts;
  final bool hasNext;

  TrendingPostsState copyWith({
    TrendingPostsStatus? status,
    List<Post>? posts,
    bool? hasNext,
  }) {
    return TrendingPostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''TrendingPostsState { status: $status, posts: ${posts.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}

