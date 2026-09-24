part of 'likes_bloc.dart';

enum LikesStatus { initial, loading, success, failure }

final class LikesState extends Equatable {
  const LikesState({
    this.status = LikesStatus.initial,
    this.posts = const [],
    this.hasNext = false,
  });

  final LikesStatus status;
  final List<Post> posts;
  final bool hasNext;

  LikesState copyWith({
    LikesStatus? status,
    List<Post>? posts,
    int? userId,
    bool? hasNext,
  }) {
    return LikesState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''LikesState { status: $status, posts: ${posts.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}
