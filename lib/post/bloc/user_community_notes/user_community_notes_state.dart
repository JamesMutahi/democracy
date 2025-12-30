part of 'user_community_notes_bloc.dart';

enum UserCommunityNotesStatus { initial, loading, success, failure }

final class UserCommunityNotesState extends Equatable {
  const UserCommunityNotesState({
    this.status = UserCommunityNotesStatus.initial,
    this.posts = const [],
    this.userId,
    this.hasNext = false,
  });

  final UserCommunityNotesStatus status;
  final List<Post> posts;
  final int? userId;
  final bool hasNext;

  UserCommunityNotesState copyWith({
    UserCommunityNotesStatus? status,
    List<Post>? posts,
    int? userId,
    bool? hasNext,
  }) {
    return UserCommunityNotesState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      userId: userId ?? this.userId,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''UserCommunityNotesState { status: $status, posts: ${posts.length}, userId: $userId, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, posts];
}
