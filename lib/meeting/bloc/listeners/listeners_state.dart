part of 'listeners_bloc.dart';

enum ListenersStatus { initial, loading, success, failure }

final class ListenersState extends Equatable {
  const ListenersState({
    this.status = ListenersStatus.initial,
    this.users = const [],
    this.hasNext = false,
  });

  final ListenersStatus status;
  final List<User> users;
  final bool hasNext;

  ListenersState copyWith({
    ListenersStatus? status,
    List<User>? users,
    bool? hasNext,
  }) {
    return ListenersState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''ListenersState { status: $status, users: ${users.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, users];
}
