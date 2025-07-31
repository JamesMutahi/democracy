part of 'followers_cubit.dart';

enum FollowersStatus { initial, loading, success, failure }

final class FollowersState extends Equatable {
  const FollowersState({
    this.status = FollowersStatus.initial,
    this.users = const [],
    this.currentPage = 1,
    this.hasNext = false,
  });

  final FollowersStatus status;
  final List<User> users;
  final int currentPage;
  final bool hasNext;

  FollowersState copyWith({
    FollowersStatus? status,
    List<User>? users,
    int? currentPage,
    bool? hasNext,
  }) {
    return FollowersState(
      status: status ?? this.status,
      users: users ?? this.users,
      currentPage: currentPage ?? this.currentPage,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''FollowersState { status: $status, users: ${users.length}, 
    currentPage: $currentPage, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, users];
}
