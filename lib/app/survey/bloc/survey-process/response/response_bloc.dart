import 'package:bloc/bloc.dart';
import 'package:democracy/app/survey/models/choice.dart';
import 'package:democracy/app/survey/models/choice_answer.dart';
import 'package:democracy/app/survey/models/question.dart';
import 'package:democracy/app/survey/models/survey.dart';
import 'package:democracy/app/survey/models/text_answer.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_event.dart';
part 'response_state.dart';
part 'response_bloc.freezed.dart';

class ResponseBloc extends Bloc<ResponseEvent, ResponseState> {
  ResponseBloc() : super(const ResponseState()) {
    on<_Started>((event, emit) {
      _onStarted(emit, event);
    });
    on<_TextAnswerAdded>((event, emit) {
      _onTextAnswerAdded(emit, event);
    });
    on<_SingleChoiceAnswerAdded>((event, emit) {
      _onSingleChoiceAnswerAdded(emit, event);
    });
    on<_MultipleChoiceAnswerAdded>((event, emit) {
      _onMultipleChoiceAnswerAdded(emit, event);
    });
  }

  void _onStarted(Emitter<ResponseState> emit, _Started event) {
    emit(state.copyWith(status: ResponseStatus.loading));
    emit(
      state.copyWith(
        status: ResponseStatus.loaded,
        survey: event.survey,
        textAnswers: [],
        choiceAnswers: [],
      ),
    );
  }

  void _onTextAnswerAdded(Emitter<ResponseState> emit, _TextAnswerAdded event) {
    emit(state.copyWith(status: ResponseStatus.loading));
    state.textAnswers!.removeWhere(
      (textAnswer) => textAnswer.question.id == event.question.id,
    );
    if (event.answer.isNotEmpty) {
      TextAnswer textAnswer = TextAnswer(
        question: event.question,
        answer: event.answer,
      );
      state.textAnswers!.add(textAnswer);
    }
    emit(state.copyWith(status: ResponseStatus.loaded));
  }

  void _onSingleChoiceAnswerAdded(
    Emitter<ResponseState> emit,
    _SingleChoiceAnswerAdded event,
  ) {
    emit(state.copyWith(status: ResponseStatus.loading));
    ChoiceAnswer choiceAnswer = ChoiceAnswer(
      question: event.question,
      choice: event.choice,
    );
    if (event.question.type == QuestionType.singleChoice) {
      state.choiceAnswers!.removeWhere(
        (choiceAnswer) => choiceAnswer.question.id == event.question.id,
      );
    }
    state.choiceAnswers!.add(choiceAnswer);
    emit(state.copyWith(status: ResponseStatus.loaded));
  }

  void _onMultipleChoiceAnswerAdded(
    Emitter<ResponseState> emit,
    _MultipleChoiceAnswerAdded event,
  ) {
    emit(state.copyWith(status: ResponseStatus.loading));
    state.choiceAnswers!.removeWhere(
      (choiceAnswer) => choiceAnswer.question.id == event.question.id,
    );
    for (Choice choice in event.choices) {
      ChoiceAnswer choiceAnswer = ChoiceAnswer(
        question: event.question,
        choice: choice,
      );
      state.choiceAnswers!.add(choiceAnswer);
    }
    emit(state.copyWith(status: ResponseStatus.loaded));
  }
}
