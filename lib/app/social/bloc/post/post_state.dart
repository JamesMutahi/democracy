part of 'post_bloc.dart';

enum PostStatus { initial, loading, success, failure }

const String postUrl = '/api/posts/';

final class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <Post>[],
    this.next = '/api/posts/',
  });

  final PostStatus status;
  final List<Post> posts;
  final String? next;

  PostState copyWith({
    PostStatus? status,
    List<Post>? posts,
    String? next,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      next: next,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, next: $next, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, posts];
}
