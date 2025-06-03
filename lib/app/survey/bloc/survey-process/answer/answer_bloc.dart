import 'package:bloc/bloc.dart';
import 'package:democracy/app/survey/models/choice.dart';
import 'package:democracy/app/survey/models/choice_answer.dart';
import 'package:democracy/app/survey/models/question.dart';
import 'package:democracy/app/survey/models/survey.dart';
import 'package:democracy/app/survey/models/text_answer.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_event.dart';
part 'answer_state.dart';
part 'answer_bloc.freezed.dart';

class AnswerBloc extends Bloc<AnswerEvent, AnswerState> {
  AnswerBloc() : super(const AnswerState()) {
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

  void _onStarted(Emitter<AnswerState> emit, _Started event) {
    emit(state.copyWith(status: AnswerStatus.loading));
    emit(
      state.copyWith(
        status: AnswerStatus.loaded,
        survey: event.survey,
        textAnswers: [],
        choiceAnswers: [],
      ),
    );
  }

  void _onTextAnswerAdded(Emitter<AnswerState> emit, _TextAnswerAdded event) {
    emit(state.copyWith(status: AnswerStatus.loading));
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
    emit(state.copyWith(status: AnswerStatus.loaded));
  }

  void _onSingleChoiceAnswerAdded(
    Emitter<AnswerState> emit,
    _SingleChoiceAnswerAdded event,
  ) {
    emit(state.copyWith(status: AnswerStatus.loading));
    ChoiceAnswer choiceAnswer = ChoiceAnswer(
      question: event.question,
      choice: event.choice,
    );
    state.choiceAnswers!.removeWhere((e) => e.question.id == event.question.id);
    state.choiceAnswers!.add(choiceAnswer);
    emit(state.copyWith(status: AnswerStatus.loaded));
  }

  void _onMultipleChoiceAnswerAdded(
    Emitter<AnswerState> emit,
    _MultipleChoiceAnswerAdded event,
  ) {
    emit(state.copyWith(status: AnswerStatus.loading));
    state.choiceAnswers!.removeWhere((e) => e.question.id == event.question.id);
    for (Choice choice in event.choices) {
      ChoiceAnswer choiceAnswer = ChoiceAnswer(
        question: event.question,
        choice: choice,
      );
      state.choiceAnswers!.add(choiceAnswer);
    }
    emit(state.copyWith(status: AnswerStatus.loaded));
  }
}
