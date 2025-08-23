import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/question.dart';
import 'package:democracy/survey/models/response.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/models/text_answer.dart';
import 'package:flutter/material.dart';

class ResponsePage extends StatelessWidget {
  const ResponsePage({super.key, required this.survey});

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
      appBar: AppBar(title: Text(survey.name, overflow: TextOverflow.ellipsis)),
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
              List<ChoiceAnswer> choiceAnswers =
                  response.choiceAnswers
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
