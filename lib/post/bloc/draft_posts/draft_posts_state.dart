part of 'draft_posts_bloc.dart';

enum DraftPostsStatus { initial, loading, success, failure }

final class DraftPostsState extends Equatable {
  const DraftPostsState({
    this.status = DraftPostsStatus.initial,
    this.posts = const [],
    this.hasNext = false,
  });

  final DraftPostsStatus status;
  final List<Post> posts;
  final bool hasNext;

  DraftPostsState copyWith({
    DraftPostsStatus? status,
    List<Post>? posts,
    bool? hasNext,
  }) {
    return DraftPostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''PostsState { status: $status, posts: ${posts.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}
