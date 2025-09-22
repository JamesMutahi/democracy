part of 'posts_bloc.dart';

enum PostsStatus { initial, loading, success, failure }

final class PostsState extends Equatable {
  const PostsState({
    this.status = PostsStatus.initial,
    this.posts = const [],
    this.hasNext = false,
  });

  final PostsStatus status;
  final List<Post> posts;
  final bool hasNext;

  PostsState copyWith({PostsStatus? status, List<Post>? posts, bool? hasNext}) {
    return PostsState(
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
