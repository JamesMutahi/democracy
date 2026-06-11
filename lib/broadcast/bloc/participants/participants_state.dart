part of 'participants_bloc.dart';

enum ParticipantsStatus { initial, loading, success, failure }

final class ParticipantsState extends Equatable {
  const ParticipantsState({
    this.status = ParticipantsStatus.initial,
    this.users = const [],
    this.hasNext = false,
  });

  final ParticipantsStatus status;
  final List<User> users;
  final bool hasNext;

  ParticipantsState copyWith({
    ParticipantsStatus? status,
    List<User>? users,
    bool? hasNext,
  }) {
    return ParticipantsState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''ParticipantsState { status: $status, users: ${users.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, users];
}
