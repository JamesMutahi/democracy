import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/survey/bloc/survey/survey_bloc.dart';
import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/question.dart';
import 'package:democracy/survey/models/response.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/models/text_answer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ResponsePage extends StatelessWidget {
  const ResponsePage({super.key, @PathParam('id') required this.surveyId});

  final int surveyId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SurveyBloc(webSocketService: context.read<WebSocketService>())
            ..add(SurveyEvent.load(surveyId: surveyId)),
      child: BlocBuilder<SurveyBloc, SurveyState>(
        buildWhen: (previous, current) => current.surveyId == surveyId,
        builder: (context, state) {
          if (state.status == SurveyStatus.initial ||
              (state.status == SurveyStatus.loading && state.survey == null)) {
            return BottomLoader();
          }
          if (state.status == SurveyStatus.failure && state.survey == null) {
            return FailureRetryButton(
              onPressed: () {
                context.read<SurveyBloc>().add(
                  SurveyEvent.load(surveyId: surveyId),
                );
              },
            );
          }
          return _Response(survey: state.survey!);
        },
      ),
    );
  }
}

class _Response extends StatelessWidget {
  const _Response({required this.survey});

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    List<Question> questions = [];
    Response response = survey.response as Response;
    for (TextAnswer textAnswer in response.textAnswers) {
      questions.add(textAnswer.question);
    }
    for (ChoiceAnswer choiceAnswer in response.choiceAnswers) {
      questions.add(choiceAnswer.question);
    }
    questions.sort((a, b) => a.number.compareTo(b.number));
    return Scaffold(
      appBar: AppBar(
        title: Text(survey.title, overflow: TextOverflow.ellipsis),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          Question question = questions[index];
          List<String> answers = [];
          switch (question.type) {
            case QuestionType.text:
              answers.add(
                response.textAnswers
                    .firstWhere((e) => e.question.id == question.id)
                    .text,
              );
            case QuestionType.number:
              answers.add(
                response.textAnswers
                    .firstWhere((e) => e.question.id == question.id)
                    .text,
              );
            case QuestionType.singleChoice:
              answers.add(
                response.choiceAnswers
                    .firstWhere((e) => e.question.id == question.id)
                    .choice
                    .text,
              );
            case QuestionType.multipleChoice:
              List<ChoiceAnswer> choiceAnswers = response.choiceAnswers
                  .where((e) => e.question.id == question.id)
                  .toList();
              for (ChoiceAnswer choiceAnswer in choiceAnswers) {
                answers.add(choiceAnswer.choice.text);
              }
          }
          return QuestionTile(
            key: ValueKey(question.id),
            question: question,
            answers: answers,
          );
        },
        itemCount: questions.length,
      ),
    );
  }
}

class QuestionTile extends StatelessWidget {
  const QuestionTile({
    super.key,
    required this.question,
    required this.answers,
  });

  final Question question;
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question.text, style: TextStyle(fontWeight: FontWeight.bold)),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              String answer = answers[index];
              return Text(answer);
            },
            itemCount: answers.length,
          ),
        ],
      ),
    );
  }
}
