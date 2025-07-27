part of 'surveys_cubit.dart';

enum SurveysStatus { initial, loading, success, failure }

final class SurveysState extends Equatable {
  const SurveysState({
    this.status = SurveysStatus.initial,
    this.surveys = const [],
    this.currentPage = 1,
    this.hasNext = false,
  });

  final SurveysStatus status;
  final List<Survey> surveys;
  final int currentPage;
  final bool hasNext;

  SurveysState copyWith({
    SurveysStatus? status,
    List<Survey>? surveys,
    int? currentPage,
    bool? hasNext,
  }) {
    return SurveysState(
      status: status ?? this.status,
      surveys: surveys ?? this.surveys,
      currentPage: currentPage ?? this.currentPage,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''SurveysState { status: $status, surveys: ${surveys.length}, 
    currentPage: $currentPage, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, surveys];
}

