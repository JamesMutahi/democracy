import 'package:democracy/app/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/app/survey/models/question.dart';
import 'package:democracy/app/survey/models/text_answer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.question,
    required this.textAnswer,
  });

  final Question question;
  final TextAnswer? textAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question.text),
        SizedBox(height: 10),
        TextFormField(
          initialValue: textAnswer?.answer,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          onChanged: (value) {
            context.read<AnswerBloc>().add(
              AnswerEvent.textAnswerAdded(question: question, answer: value),
            );
          },
        ),
      ],
    );
  }
}
