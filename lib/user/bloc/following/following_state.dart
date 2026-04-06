part of 'following_bloc.dart';

enum FollowingStatus { initial, loading, success, failure }

final class FollowingState extends Equatable {
  const FollowingState({
    this.status = FollowingStatus.initial,
    this.users = const [],
    this.hasNext = false,
    this.userId,
  });

  final FollowingStatus status;
  final List<User> users;
  final bool hasNext;
  final int? userId;

  FollowingState copyWith({
    FollowingStatus? status,
    List<User>? users,
    bool? hasNext,
    int? userId,
  }) {
    return FollowingState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasNext: hasNext ?? this.hasNext,
      userId: userId ?? this.userId,
    );
  }

  @override
  String toString() {
    return '''FollowingState { status: $status, users: ${users.length}, hasNext: $hasNext, userId: $userId }''';
  }

  @override
  List<Object> get props => [status, users];
}
