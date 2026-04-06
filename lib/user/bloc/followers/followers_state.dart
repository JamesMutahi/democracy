part of 'followers_bloc.dart';

enum FollowersStatus { initial, loading, success, failure }

final class FollowersState extends Equatable {
  const FollowersState({
    this.status = FollowersStatus.initial,
    this.users = const [],
    this.hasNext = false,
    this.userId,
  });

  final FollowersStatus status;
  final List<User> users;
  final bool hasNext;
  final int? userId;

  FollowersState copyWith({
    FollowersStatus? status,
    List<User>? users,
    bool? hasNext,
    int? userId,
  }) {
    return FollowersState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasNext: hasNext ?? this.hasNext,
      userId: userId ?? this.userId,
    );
  }

  @override
  String toString() {
    return '''FollowersState { status: $status, users: ${users.length}, hasNext: $hasNext, userId: $userId }''';
  }

  @override
  List<Object> get props => [status, users];
}
