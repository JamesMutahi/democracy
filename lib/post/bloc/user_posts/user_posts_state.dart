part of 'user_posts_cubit.dart';

enum UserPostsStatus { initial, loading, success, failure }

final class UserPostsState extends Equatable {
  const UserPostsState({
    this.status = UserPostsStatus.initial,
    this.posts = const [],
    this.userId,
    this.hasNext = false,
  });

  final UserPostsStatus status;
  final List<Post> posts;
  final int? userId;
  final bool hasNext;

  UserPostsState copyWith({
    UserPostsStatus? status,
    List<Post>? posts,
    int? userId,
    bool? hasNext,
  }) {
    return UserPostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      userId: userId ?? this.userId,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''UserPostsState { status: $status, posts: ${posts.length}, userId: $userId, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}
