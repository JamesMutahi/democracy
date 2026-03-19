part of 'users_bloc.dart';

enum UsersStatus { initial, loading, success, failure }

final class UsersState extends Equatable {
  const UsersState({
    this.status = UsersStatus.initial,
    this.searchTerm = '',
    this.users = const [],
    this.hasNext = false,
  });

  final UsersStatus status;
  final String searchTerm;
  final List<User> users;
  final bool hasNext;

  UsersState copyWith({
    UsersStatus? status,
    String? searchTerm,
    List<User>? users,
    bool? hasNext,
  }) {
    return UsersState(
      status: status ?? this.status,
      searchTerm: searchTerm ?? this.searchTerm,
      users: users ?? this.users,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''UsersState { status: $status, searchTerm: $searchTerm, users: ${users.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, users];
}
