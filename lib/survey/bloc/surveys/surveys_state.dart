part of 'surveys_cubit.dart';

enum SurveysStatus { initial, loading, success, failure }

final class SurveysState extends Equatable {
  const SurveysState({
    this.status = SurveysStatus.initial,
    this.surveys = const [],
    this.since,
    this.hasNext = false,
  });

  final SurveysStatus status;
  final List<Survey> surveys;
  final int? since;
  final bool hasNext;

  SurveysState copyWith({
    SurveysStatus? status,
    List<Survey>? surveys,
    int? since,
    bool? hasNext,
  }) {
    return SurveysState(
      status: status ?? this.status,
      surveys: surveys ?? this.surveys,
      since: since ?? this.since,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''SurveysState { status: $status, surveys: ${surveys.length}, 
    since: $since, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, surveys];
}

