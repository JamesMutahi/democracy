part of 'muted_bloc.dart';

enum MutedStatus { initial, loading, success, failure }

final class MutedState extends Equatable {
  const MutedState({
    this.status = MutedStatus.initial,
    this.users = const [],
    this.hasNext = false,
  });

  final MutedStatus status;
  final List<User> users;
  final bool hasNext;

  MutedState copyWith({
    MutedStatus? status,
    List<User>? users,
    bool? hasNext,
  }) {
    return MutedState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''MutedState { status: $status, users: ${users.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, users];
}
