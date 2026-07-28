part of 'reposts_bloc.dart';

enum RepostsStatus { initial, loading, success, failure }

final class RepostsState extends Equatable {
  const RepostsState({
    this.status = RepostsStatus.initial,
    this.users = const [],
    this.hasNext = false,
  });

  final RepostsStatus status;
  final List<User> users;
  final bool hasNext;

  RepostsState copyWith({
    RepostsStatus? status,
    List<User>? users,
    bool? hasNext,
  }) {
    return RepostsState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''RepostsState { status: $status, users: ${users.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, users];
}
