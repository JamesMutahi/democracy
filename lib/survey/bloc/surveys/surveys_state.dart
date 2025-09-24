part of 'surveys_bloc.dart';

enum SurveysStatus { initial, loading, success, failure }

final class SurveysState extends Equatable {
  const SurveysState({
    this.status = SurveysStatus.initial,
    this.surveys = const [],
    this.hasNext = false,
  });

  final SurveysStatus status;
  final List<Survey> surveys;
  final bool hasNext;

  SurveysState copyWith({
    SurveysStatus? status,
    List<Survey>? surveys,
    bool? hasNext,
  }) {
    return SurveysState(
      status: status ?? this.status,
      surveys: surveys ?? this.surveys,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''SurveysState { status: $status, surveys: ${surveys.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, surveys];
}
