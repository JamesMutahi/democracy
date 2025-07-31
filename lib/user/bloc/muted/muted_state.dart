part of 'muted_cubit.dart';

enum MutedStatus { initial, loading, success, failure }

final class MutedState extends Equatable {
  const MutedState({
    this.status = MutedStatus.initial,
    this.users = const [],
    this.currentPage = 1,
    this.hasNext = false,
  });

  final MutedStatus status;
  final List<User> users;
  final int currentPage;
  final bool hasNext;

  MutedState copyWith({
    MutedStatus? status,
    List<User>? users,
    int? currentPage,
    bool? hasNext,
  }) {
    return MutedState(
      status: status ?? this.status,
      users: users ?? this.users,
      currentPage: currentPage ?? this.currentPage,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''MutedState { status: $status, users: ${users.length}, 
    currentPage: $currentPage, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, users];
}
