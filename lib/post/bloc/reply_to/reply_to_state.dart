part of 'reply_to_bloc.dart';

enum ReplyToStatus { initial, loading, success, failure }

final class ReplyToState extends Equatable {
  const ReplyToState({
    this.status = ReplyToStatus.initial,
    this.posts = const [],
    this.postId,
  });

  final ReplyToStatus status;
  final List<Post> posts;
  final int? postId;

  ReplyToState copyWith({
    ReplyToStatus? status,
    List<Post>? posts,
    int? postId,
    bool? hasNext,
  }) {
    return ReplyToState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      postId: postId ?? this.postId,
    );
  }

  @override
  String toString() {
    return '''ReplyToState { status: $status, posts: ${posts.length}, postId: $postId }''';
  }

  @override
  List<Object> get props => [status, posts];
}
