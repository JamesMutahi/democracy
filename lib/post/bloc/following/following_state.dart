part of 'following_cubit.dart';

enum FollowingStatus { initial, loading, success, failure }

final class FollowingState extends Equatable {
  const FollowingState({
    this.status = FollowingStatus.initial,
    this.posts = const [],
    this.hasNext = false,
  });

  final FollowingStatus status;
  final List<Post> posts;
  final bool hasNext;

  FollowingState copyWith({
    FollowingStatus? status,
    List<Post>? posts,
    bool? hasNext,
  }) {
    return FollowingState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''FollowingState { status: $status, posts: ${posts.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}
