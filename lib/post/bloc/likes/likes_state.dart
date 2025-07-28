part of 'likes_cubit.dart';

enum LikesStatus { initial, loading, success, failure }

final class LikesState extends Equatable {
  const LikesState({
    this.status = LikesStatus.initial,
    this.posts = const [],
    this.userId,
    this.hasNext = false,
  });

  final LikesStatus status;
  final List<Post> posts;
  final int? userId;
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
      userId: userId ?? this.userId,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''LikesState { status: $status, posts: ${posts.length}, userId: $userId, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}
