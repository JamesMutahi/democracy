part of 'following_cubit.dart';

enum FollowingStatus { initial, loading, success, failure }

final class FollowingState extends Equatable {
  const FollowingState({
    this.status = FollowingStatus.initial,
    this.users = const [],
    this.currentPage = 1,
    this.hasNext = false,
  });

  final FollowingStatus status;
  final List<User> users;
  final int currentPage;
  final bool hasNext;

  FollowingState copyWith({
    FollowingStatus? status,
    List<User>? users,
    int? currentPage,
    bool? hasNext,
  }) {
    return FollowingState(
      status: status ?? this.status,
      users: users ?? this.users,
      currentPage: currentPage ?? this.currentPage,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''FollowingState { status: $status, users: ${users.length}, 
    currentPage: $currentPage, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, users];
}
