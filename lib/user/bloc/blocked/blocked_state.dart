part of 'blocked_cubit.dart';

enum BlockedStatus { initial, loading, success, failure }

final class BlockedState extends Equatable {
  const BlockedState({
    this.status = BlockedStatus.initial,
    this.users = const [],
    this.hasNext = false,
  });

  final BlockedStatus status;
  final List<User> users;
  final bool hasNext;

  BlockedState copyWith({
    BlockedStatus? status,
    List<User>? users,
    bool? hasNext,
  }) {
    return BlockedState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''BlockedState { status: $status, users: ${users.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, users];
}
