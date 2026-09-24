part of 'user_broadcasts_bloc.dart';

enum UserBroadcastsStatus { initial, loading, success, failure }

final class UserBroadcastsState extends Equatable {
  const UserBroadcastsState({
    this.status = UserBroadcastsStatus.initial,
    this.broadcasts = const [],
    this.userId,
    this.hasNext = false,
  });

  final UserBroadcastsStatus status;
  final List<Broadcast> broadcasts;
  final int? userId;
  final bool hasNext;

  UserBroadcastsState copyWith({
    UserBroadcastsStatus? status,
    List<Broadcast>? broadcasts,
    int? userId,
    bool? hasNext,
  }) {
    return UserBroadcastsState(
      status: status ?? this.status,
      broadcasts: broadcasts ?? this.broadcasts,
      userId: userId ?? this.userId,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''UserBroadcastsState { status: $status, broadcasts: ${broadcasts.length}, userId: $userId, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, broadcasts];
}
