part of 'post_bloc.dart';

enum PostStatus { initial, loading, success, failure }

final class PostState extends Equatable {
  const PostState({this.status = PostStatus.initial, this.post, this.postId});

  final PostStatus status;
  final Post? post;
  final int? postId;

  PostState copyWith({PostStatus? status, Post? post, int? postId}) {
    return PostState(
      status: status ?? this.status,
      post: post ?? this.post,
      postId: postId ?? this.postId,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, post: $post, postId: $postId }''';
  }

  @override
  List<Object?> get props => [status, post, postId];
}
