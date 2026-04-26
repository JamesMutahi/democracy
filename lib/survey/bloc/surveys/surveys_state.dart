part of 'surveys_bloc.dart';

enum SurveysStatus { initial, loading, success, failure }

final class SurveysState extends Equatable {
  const SurveysState({
    this.status = SurveysStatus.initial,
    this.searchTerm = '',
    this.surveys = const [],
    this.hasNext = false,
  });

  final SurveysStatus status;
  final String searchTerm;
  final List<Survey> surveys;
  final bool hasNext;

  SurveysState copyWith({
    SurveysStatus? status,
    String? searchTerm,
    List<Survey>? surveys,
    bool? hasNext,
  }) {
    return SurveysState(
      status: status ?? this.status,
      searchTerm: searchTerm ?? this.searchTerm,
      surveys: surveys ?? this.surveys,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''SurveysState { status: $status, searchTerm: $searchTerm, surveys: ${surveys.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, surveys];
}
