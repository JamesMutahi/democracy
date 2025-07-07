import 'package:bloc/bloc.dart';
import 'package:democracy/survey/models/choice.dart';
import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/question.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/models/text_answer.dart';
import 'package:equatable/equatable.dart';

part 'answer_state.dart';

class AnswerCubit extends Cubit<AnswerState> {
  AnswerCubit() : super(const AnswerState());

  void started({required Survey survey}) {
    emit(state.copyWith(status: AnswerStatus.loading));
    emit(
      state.copyWith(
        status: AnswerStatus.loaded,
        survey: survey,
        startTime: DateTime.now(),
        textAnswers: [],
        choiceAnswers: [],
      ),
    );
  }

  void textAnswerAdded({required Question question, required String text}) {
    emit(state.copyWith(status: AnswerStatus.loading));
    state.textAnswers!.removeWhere(
      (textAnswer) => textAnswer.question.id == question.id,
    );
    if (text.isNotEmpty) {
      TextAnswer textAnswer = TextAnswer(question: question, text: text);
      state.textAnswers!.add(textAnswer);
    }
    emit(state.copyWith(status: AnswerStatus.loaded));
  }

  void singleChoiceAnswerAdded({
    required Question question,
    required Choice choice,
  }) {
    emit(state.copyWith(status: AnswerStatus.loading));
    ChoiceAnswer choiceAnswer = ChoiceAnswer(
      question: question,
      choice: choice,
    );
    state.choiceAnswers!.removeWhere((e) => e.question.id == question.id);
    state.choiceAnswers!.add(choiceAnswer);
    emit(state.copyWith(status: AnswerStatus.loaded));
  }

  void multipleChoiceAnswerAdded({
    required Question question,
    required List<Choice> choices,
  }) {
    emit(state.copyWith(status: AnswerStatus.loading));
    state.choiceAnswers!.removeWhere((e) => e.question.id == question.id);
    for (Choice choice in choices) {
      ChoiceAnswer choiceAnswer = ChoiceAnswer(
        question: question,
        choice: choice,
      );
      state.choiceAnswers!.add(choiceAnswer);
    }
    emit(state.copyWith(status: AnswerStatus.loaded));
  }

  void validate({required List<Question> questions}) {
    emit(state.copyWith(status: AnswerStatus.loading));
    List<Question> required = [];
    for (Question question
        in questions.where((e) => e.isRequired == true).toList()) {
      if (!state.textAnswers!.any((e) => e.question.id == question.id) &&
          !state.choiceAnswers!.any((e) => e.question.id == question.id)) {
        required.add(question);
      }
      if (question.dependency != null &&
          !state.choiceAnswers!.any(
            (e) => e.choice.id == question.dependency,
          )) {
        required.remove(question);
      }
    }
    if (required.isEmpty) {
      emit(
        state.copyWith(
          status: AnswerStatus.validated,
          required: [],
          endTime: DateTime.now(),
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: AnswerStatus.validationFailure,
          required: required,
        ),
      );
    }
  }

  Future submitted({required Map<String, dynamic> payload}) async {
    emit(state.copyWith(status: AnswerStatus.loading));
    if (payload['response_status'] == 201) {
      final Survey survey = Survey.fromJson(payload['data']);
      emit(state.copyWith(status: AnswerStatus.submitted, survey: survey));
    } else {
      emit(state.copyWith(status: AnswerStatus.submissionFailure));
    }
  }
}
