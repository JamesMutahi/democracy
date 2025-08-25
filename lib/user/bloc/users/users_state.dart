part of 'users_cubit.dart';

enum UsersStatus { initial, loading, success, failure }

final class UsersState extends Equatable {
  const UsersState({
    this.status = UsersStatus.initial,
    this.users = const [],
    this.hasNext = false,
  });

  final UsersStatus status;
  final List<User> users;
  final bool hasNext;

  UsersState copyWith({
    UsersStatus? status,
    List<User>? users,
    bool? hasNext,
  }) {
    return UsersState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''UsersState { status: $status, users: ${users.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, users];
}
