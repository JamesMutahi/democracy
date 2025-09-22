part of 'user_replies_bloc.dart';

enum UserRepliesStatus { initial, loading, success, failure }

final class UserRepliesState extends Equatable {
  const UserRepliesState({
    this.status = UserRepliesStatus.initial,
    this.posts = const [],
    this.userId,
    this.hasNext = false,
  });

  final UserRepliesStatus status;
  final List<Post> posts;
  final int? userId;
  final bool hasNext;

  UserRepliesState copyWith({
    UserRepliesStatus? status,
    List<Post>? posts,
    int? userId,
    bool? hasNext,
  }) {
    return UserRepliesState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      userId: userId ?? this.userId,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''UserRepliesState { status: $status, posts: ${posts.length}, userId: $userId, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}
