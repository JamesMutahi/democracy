part of 'survey_bottom_navigation_bloc.dart';

enum SurveyBottomNavigationStatus { initial, loading, loaded, completed }

final class SurveyBottomNavigationState extends Equatable {
  const SurveyBottomNavigationState({
    this.status = SurveyBottomNavigationStatus.initial,
    this.isFirst = true,
    this.isLast = true,
    this.page = 0,
    this.lastPage = 0,
  });

  final SurveyBottomNavigationStatus status;
  final bool isFirst;
  final bool isLast;
  final int page;
  final int lastPage;

  SurveyBottomNavigationState copyWith({
    SurveyBottomNavigationStatus? status,
    bool? isFirst,
    bool? isLast,
    int? page,
    int? lastPage,
  }) {
    return SurveyBottomNavigationState(
      status: status ?? this.status,
      isFirst: isFirst ?? this.isFirst,
      isLast: isLast ?? this.isLast,
      page: page ?? this.page,
      lastPage: lastPage ?? this.lastPage,
    );
  }

  @override
  String toString() {
    return '''SurveyBottomNavigationState { status: $status, page: $page, isFirst: $isFirst,isLast: $isLast }''';
  }

  @override
  List<Object> get props => [status, page, isFirst, isLast, lastPage];
}
