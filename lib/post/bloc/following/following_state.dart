part of 'following_cubit.dart';

enum FollowingStatus { initial, success, failure }

final class FollowingState extends Equatable {
  const FollowingState({
    this.status = FollowingStatus.initial,
    this.posts = const [],
    this.hasReachedMax = false,
  });

  final FollowingStatus status;
  final List<Post> posts;
  final bool hasReachedMax;

  FollowingState copyWith({
    FollowingStatus? status,
    List<Post>? posts,
    bool? hasReachedMax,
  }) {
    return FollowingState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''FollowingState { status: $status, posts: ${posts.length}, 
    hasReachedMax: $hasReachedMax }''';
  }

  @override
  List<Object> get props => [status, posts];
}
