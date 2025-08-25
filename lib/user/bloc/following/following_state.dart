part of 'following_cubit.dart';

enum FollowingStatus { initial, loading, success, failure }

final class FollowingState extends Equatable {
  const FollowingState({
    this.status = FollowingStatus.initial,
    this.users = const [],
    this.hasNext = false,
  });

  final FollowingStatus status;
  final List<User> users;
  final bool hasNext;

  FollowingState copyWith({
    FollowingStatus? status,
    List<User>? users,
    bool? hasNext,
  }) {
    return FollowingState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''FollowingState { status: $status, users: ${users.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, users];
}
