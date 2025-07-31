part of 'blocked_cubit.dart';

enum BlockedStatus { initial, loading, success, failure }

final class BlockedState extends Equatable {
  const BlockedState({
    this.status = BlockedStatus.initial,
    this.users = const [],
    this.currentPage = 1,
    this.hasNext = false,
  });

  final BlockedStatus status;
  final List<User> users;
  final int currentPage;
  final bool hasNext;

  BlockedState copyWith({
    BlockedStatus? status,
    List<User>? users,
    int? currentPage,
    bool? hasNext,
  }) {
    return BlockedState(
      status: status ?? this.status,
      users: users ?? this.users,
      currentPage: currentPage ?? this.currentPage,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''BlockedState { status: $status, users: ${users.length}, 
    currentPage: $currentPage, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, users];
}
