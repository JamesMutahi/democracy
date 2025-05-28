import 'package:bloc/bloc.dart';
import 'package:democracy/app/survey/models/question.dart';
import 'package:democracy/app/survey/models/survey.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_event.dart';
part 'page_state.dart';
part 'page_bloc.freezed.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(const PageState.initial()) {
    on<_Started>((event, emit) async {
      await _onStarted(emit, event);
    });
  }

  Future _onStarted(Emitter<PageState> emit, _Started event) async {
    emit(PageLoading());
    List<Question> questions = event.survey.questions;
    emit(PageLoaded(questions: questions));
  }
}
