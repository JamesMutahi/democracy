part of 'supporters_cubit.dart';

enum SupportersStatus { initial, loading, success, failure }

final class SupportersState extends Equatable {
  const SupportersState({
    this.status = SupportersStatus.initial,
    this.users = const [],
    this.hasNext = false,
  });

  final SupportersStatus status;
  final List<User> users;
  final bool hasNext;

  SupportersState copyWith({
    SupportersStatus? status,
    List<User>? users,
    bool? hasNext,
  }) {
    return SupportersState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''SupportersState { status: $status, users: ${users.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, users];
}
