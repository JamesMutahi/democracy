part of 'replies_bloc.dart';

enum RepliesStatus { initial, loading, success, failure }

final class RepliesState extends Equatable {
  const RepliesState({
    this.status = RepliesStatus.initial,
    this.posts = const [],
    this.postId,
    this.hasNext = false,
  });

  final RepliesStatus status;
  final List<Post> posts;
  final int? postId;
  final bool hasNext;

  RepliesState copyWith({
    RepliesStatus? status,
    List<Post>? posts,
    int? postId,
    bool? hasNext,
  }) {
    return RepliesState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      postId: postId ?? this.postId,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''RepliesState { status: $status, posts: ${posts.length}, postId: $postId, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}
