import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/survey/models/choice.dart';
import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/question.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/models/text_answer.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_bloc.freezed.dart';
part 'answer_state.dart';
part 'answer_event.dart';

const String stream = 'surveys';
const String requestId = 'responses';

class AnswerBloc extends Bloc<AnswerEvent, AnswerState> {
  AnswerBloc({required this.webSocketService}) : super(const AnswerState()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        print(message['payload']);
        switch (message['payload']['action']) {
          case 'submit':
            add(_Submitted(payload: message['payload']));
        }
      }
    });
    on<_Started>((event, emit) {
      _onStarted(event, emit);
    });
    on<_TextAnswerAdded>((event, emit) {
      _onTextAnswerAdded(event, emit);
    });
    on<_SingleChoiceAnswerAdded>((event, emit) {
      _onSingleChoiceAnswerAdded(event, emit);
    });
    on<_MultipleChoiceAnswerAdded>((event, emit) {
      _onMultipleChoiceAnswerAdded(event, emit);
    });
    on<_Validate>((event, emit) {
      _onValidate(event, emit);
    });
    on<_Submit>((event, emit) {
      _onSubmit(event, emit);
    });
    on<_Submitted>((event, emit) {
      _onSubmitted(event, emit);
    });
  }

  Future _onStarted(_Started event, Emitter<AnswerState> emit) async {
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

  Future _onTextAnswerAdded(
    _TextAnswerAdded event,
    Emitter<AnswerState> emit,
  ) async {
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

  Future _onSingleChoiceAnswerAdded(
    _SingleChoiceAnswerAdded event,
    Emitter<AnswerState> emit,
  ) async {
    emit(state.copyWith(status: AnswerStatus.loading));
    ChoiceAnswer choiceAnswer = ChoiceAnswer(
      question: event.question,
      choice: event.choice,
    );
    state.choiceAnswers!.removeWhere((e) => e.question.id == event.question.id);
    state.choiceAnswers!.add(choiceAnswer);
    emit(state.copyWith(status: AnswerStatus.loaded));
  }

  Future _onMultipleChoiceAnswerAdded(
    _MultipleChoiceAnswerAdded event,
    Emitter<AnswerState> emit,
  ) async {
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

  Future _onValidate(_Validate event, Emitter<AnswerState> emit) async {
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

  Future _onSubmit(_Submit event, Emitter<AnswerState> emit) async {
    List<Map<String, dynamic>> textAnswers = [];
    List<Map<String, dynamic>> choiceAnswers = [];
    for (TextAnswer textAnswer in event.textAnswers) {
      textAnswers.add({
        'question_id': textAnswer.question.id,
        'text': textAnswer.text,
      });
    }
    for (ChoiceAnswer choiceAnswer in event.choiceAnswers) {
      choiceAnswers.add({
        'question_id': choiceAnswer.question.id,
        'choice_id': choiceAnswer.choice.id,
      });
    }
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'submit',
        'request_id': 'responses',
        'data': {
          'survey': event.survey.id,
          'start_time': event.startTime.toString(),
          'end_time': event.endTime.toString(),
          'text_answers': textAnswers,
          'choice_answers': choiceAnswers,
        },
      },
    };
    webSocketService.send(message);
  }

  Future _onSubmitted(_Submitted event, Emitter<AnswerState> emit) async {
    emit(state.copyWith(status: AnswerStatus.loading));
    if (event.payload['response_status'] == 201) {
      final Survey survey = Survey.fromJson(event.payload['data']);
      emit(state.copyWith(status: AnswerStatus.submitted, survey: survey));
    } else {
      emit(
        state.copyWith(
          status: AnswerStatus.submissionFailure,
          submissionError: event.payload['errors'][0],
        ),
      );
    }
  }

  final WebSocketService webSocketService;
}
