import 'package:bloc/bloc.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_bottom_navigation_bloc.freezed.dart';
part 'survey_bottom_navigation_event.dart';
part 'survey_bottom_navigation_state.dart';

class SurveyBottomNavigationBloc
    extends Bloc<SurveyBottomNavigationEvent, SurveyBottomNavigationState> {
  SurveyBottomNavigationBloc() : super(const SurveyBottomNavigationState()) {
    on<_Started>((event, emit) async {
      await _onStarted(event, emit);
    });
    on<_LoadNextPage>((event, emit) async {
      await _onLoadNextPage(event, emit);
    });
    on<_LoadPrevPage>((event, emit) async {
      await _onLoadPrevPage(event, emit);
    });
    on<_ReturnToSurvey>((event, emit) async {
      await _onReturnToSurvey(emit);
    });
  }

  Future _onStarted(
    _Started event,
    Emitter<SurveyBottomNavigationState> emit,
  ) async {
    emit(state.copyWith(status: SurveyBottomNavigationStatus.loading));
    int page = 0;
    emit(
      SurveyBottomNavigationState(
        status: SurveyBottomNavigationStatus.loaded,
        isFirst: true,
        isLast: event.survey.pages.last.number == page,
        page: page,
        lastPage: event.survey.pages.last.number,
      ),
    );
  }

  Future _onLoadNextPage(
    _LoadNextPage event,
    Emitter<SurveyBottomNavigationState> emit,
  ) async {
    emit(state.copyWith(status: SurveyBottomNavigationStatus.loading));
    if (state.isLast) {
      emit(state.copyWith(status: SurveyBottomNavigationStatus.completed));
    } else {
      int nextPage = state.page + 1;
      emit(
        SurveyBottomNavigationState(
          status: SurveyBottomNavigationStatus.loaded,
          isFirst: event.survey.pages.first.number == nextPage,
          isLast: event.survey.pages.last.number == nextPage,
          page: nextPage,
          lastPage: event.survey.pages.last.number,
        ),
      );
    }
  }

  Future _onLoadPrevPage(
    _LoadPrevPage event,
    Emitter<SurveyBottomNavigationState> emit,
  ) async {
    emit(state.copyWith(status: SurveyBottomNavigationStatus.loading));
    int prevPage = state.page - 1;
    emit(
      SurveyBottomNavigationState(
        status: SurveyBottomNavigationStatus.loaded,
        isFirst: event.survey.pages.first.number == prevPage,
        isLast: event.survey.pages.last.number == prevPage,
        page: prevPage,
        lastPage: event.survey.pages.last.number,
      ),
    );
  }

  Future _onReturnToSurvey(Emitter<SurveyBottomNavigationState> emit) async {
    emit(state.copyWith(status: SurveyBottomNavigationStatus.loading));
    emit(state.copyWith(status: SurveyBottomNavigationStatus.loaded));
  }
}
