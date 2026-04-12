part of 'follow_recommendations_bloc.dart';

enum FollowRecommendationsStatus { initial, loading, success, failure }

final class FollowRecommendationsState extends Equatable {
  const FollowRecommendationsState({
    this.status = FollowRecommendationsStatus.initial,
    this.users = const [],
  });

  final FollowRecommendationsStatus status;
  final List<User> users;

  FollowRecommendationsState copyWith({
    FollowRecommendationsStatus? status,
    List<User>? users,
  }) {
    return FollowRecommendationsState(
      status: status ?? this.status,
      users: users ?? this.users,
    );
  }

  @override
  String toString() {
    return '''FollowRecommendationsState { status: $status, users: ${users.length} }''';
  }

  @override
  List<Object> get props => [status, users];
}
