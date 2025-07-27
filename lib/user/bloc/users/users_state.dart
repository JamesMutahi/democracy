part of 'users_cubit.dart';

enum UsersStatus { initial, loading, success, failure }

final class UsersState extends Equatable {
  const UsersState({
    this.status = UsersStatus.initial,
    this.users = const [],
    this.currentPage = 1,
    this.hasNext = false,
  });

  final UsersStatus status;
  final List<User> users;
  final int currentPage;
  final bool hasNext;

  UsersState copyWith({
    UsersStatus? status,
    List<User>? users,
    int? currentPage,
    bool? hasNext,
  }) {
    return UsersState(
      status: status ?? this.status,
      users: users ?? this.users,
      currentPage: currentPage ?? this.currentPage,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''UsersState { status: $status, users: ${users.length}, 
    currentPage: $currentPage, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, users];
}
