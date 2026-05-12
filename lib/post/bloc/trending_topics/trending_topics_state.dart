part of 'trending_topics_bloc.dart';

enum TrendingTopicsStatus { initial, loading, success, failure }

final class TrendingTopicsState extends Equatable {
  const TrendingTopicsState({
    this.status = TrendingTopicsStatus.initial,
    this.topics = const [],
  });

  final TrendingTopicsStatus status;
  final List<String> topics;

  TrendingTopicsState copyWith({
    TrendingTopicsStatus? status,
    List<String>? topics,
    String? searchTerm,
  }) {
    return TrendingTopicsState(
      status: status ?? this.status,
      topics: topics ?? this.topics,
    );
  }

  @override
  String toString() {
    return '''TrendingTopicsState { status: $status, hashtags: $topics }''';
  }

  @override
  List<Object> get props => [status, topics];
}
