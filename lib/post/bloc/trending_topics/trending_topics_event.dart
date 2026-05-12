part of 'trending_topics_bloc.dart';

@freezed
class TrendingTopicsEvent with _$TrendingTopicsEvent {
  const factory TrendingTopicsEvent.get() = _Get;
  const factory TrendingTopicsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
