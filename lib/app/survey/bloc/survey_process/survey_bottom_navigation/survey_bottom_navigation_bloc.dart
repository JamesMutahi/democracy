import 'package:bloc/bloc.dart';
import 'package:democracy/app/survey/bloc/survey_process/page/page_bloc.dart';
import 'package:democracy/app/survey/models/question.dart';
import 'package:democracy/app/survey/models/survey.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_bottom_navigation_event.dart';
part 'survey_bottom_navigation_state.dart';
part 'survey_bottom_navigation_bloc.freezed.dart';

class SurveyBottomNavigationBloc
    extends Bloc<SurveyBottomNavigationEvent, SurveyBottomNavigationState> {
  SurveyBottomNavigationBloc({required this.pageRepository})
    : super(const SurveyBottomNavigationState()) {
    on<_Started>((event, emit) async {
      await _onStarted(event, emit);
    });
    on<_LoadNextPage>((event, emit) async {
      await _onLoadNextPage(event, emit);
    });
    on<_LoadPrevPage>((event, emit) async {
      await _onLoadPrevPage(event, emit);
    });
  }

  Future _onStarted(
    _Started event,
    Emitter<SurveyBottomNavigationState> emit,
  ) async {
    emit(state.copyWith(status: SurveyBottomNavigationStatus.loading));
    List<Question> questions = event.survey.questions.toList();
    questions.sort((a, b) => a.page.compareTo(b.page));
    bool isFirst = pageRepository.checkIsFirstPage(
      questions: questions,
      page: 0,
    );
    bool isLast = pageRepository.checkIsLastPage(questions: questions, page: 0);
    int lastPage = questions.last.page;
    emit(
      SurveyBottomNavigationState(
        status: SurveyBottomNavigationStatus.loaded,
        isFirst: isFirst,
        isLast: isLast,
        page: 0,
        lastPage: lastPage,
      ),
    );
  }

  Future _onLoadNextPage(
    _LoadNextPage event,
    Emitter<SurveyBottomNavigationState> emit,
  ) async {
    emit(state.copyWith(status: SurveyBottomNavigationStatus.loading));
    int nextPage = state.page + 1;
    List<Question> questions = event.survey.questions.toList();
    questions.sort((a, b) => a.page.compareTo(b.page));
    bool isFirst = pageRepository.checkIsFirstPage(
      questions: questions,
      page: nextPage,
    );
    bool isLast = pageRepository.checkIsLastPage(
      questions: questions,
      page: nextPage,
    );
    int lastPage = questions.last.page;
    emit(
      SurveyBottomNavigationState(
        status: SurveyBottomNavigationStatus.loaded,
        isFirst: isFirst,
        isLast: isLast,
        page: nextPage,
        lastPage: lastPage,
      ),
    );
  }

  Future _onLoadPrevPage(
    _LoadPrevPage event,
    Emitter<SurveyBottomNavigationState> emit,
  ) async {
    emit(state.copyWith(status: SurveyBottomNavigationStatus.loading));
    int prevPage = state.page - 1;
    List<Question> questions = event.survey.questions.toList();
    questions.sort((a, b) => a.page.compareTo(b.page));
    bool isFirst = pageRepository.checkIsFirstPage(
      questions: questions,
      page: prevPage,
    );
    bool isLast = pageRepository.checkIsLastPage(
      questions: questions,
      page: prevPage,
    );
    int lastPage = questions.last.page;
    emit(
      SurveyBottomNavigationState(
        status: SurveyBottomNavigationStatus.loaded,
        isFirst: isFirst,
        isLast: isLast,
        page: prevPage,
        lastPage: lastPage,
      ),
    );
  }

  final PageRepository pageRepository;
}
