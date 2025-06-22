import 'package:bloc/bloc.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/survey/bloc/survey/survey_bloc.dart';
import 'package:democracy/survey/models/choice.dart';
import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/question.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/models/text_answer.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_event.dart';
part 'answer_state.dart';
part 'answer_bloc.freezed.dart';

class AnswerBloc extends Bloc<AnswerEvent, AnswerState> {
  AnswerBloc({required this.surveyRepository, required this.authRepository})
    : super(const AnswerState()) {
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
    on<_Validate>((event, emit) {
      _onValidate(emit, event);
    });
    on<_Submit>((event, emit) async {
      await _onSubmit(emit);
    });
  }

  void _onStarted(Emitter<AnswerState> emit, _Started event) {
    emit(state.copyWith(status: AnswerStatus.loading));
    emit(
      state.copyWith(
        status: AnswerStatus.loaded,
        survey: event.survey,
        startTime: DateTime.now(),
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
    if (event.text.isNotEmpty) {
      TextAnswer textAnswer = TextAnswer(
        question: event.question,
        text: event.text,
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

  void _onValidate(Emitter<AnswerState> emit, _Validate event) {
    emit(state.copyWith(status: AnswerStatus.loading));
    List<Question> required = [];
    for (Question question
        in event.questions.where((e) => e.isRequired == true).toList()) {
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

  Future _onSubmit(Emitter<AnswerState> emit) async {
    emit(state.copyWith(status: AnswerStatus.loading));
    // try {
    String? token = await authRepository.getToken();
    await surveyRepository.postResponse(
      token: token!,
      survey: state.survey!,
      startTime: state.startTime!,
      endTime: state.endTime!,
      textAnswers: state.textAnswers!,
      choiceAnswers: state.choiceAnswers!,
    );
    emit(state.copyWith(status: AnswerStatus.submitted));
    // } catch (e) {
    //   emit(state.copyWith(status: AnswerStatus.submissionFailure));
    // }
  }

  final SurveyRepository surveyRepository;
  final AuthRepository authRepository;
}
