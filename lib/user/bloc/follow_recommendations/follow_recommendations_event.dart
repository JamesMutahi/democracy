part of 'follow_recommendations_bloc.dart';

@freezed
class FollowRecommendationsEvent with _$FollowRecommendationsEvent {
  const factory FollowRecommendationsEvent.get() = _Get;
  const factory FollowRecommendationsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory FollowRecommendationsEvent.update({required List<User> users}) =
      _Update;
}
