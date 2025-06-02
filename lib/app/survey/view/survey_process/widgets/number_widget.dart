import 'package:democracy/app/survey/bloc/survey-process/response/response_bloc.dart';
import 'package:democracy/app/survey/models/question.dart';
import 'package:democracy/app/survey/models/text_answer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({
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
          keyboardType: TextInputType.number,
          onChanged: (value) {
            context.read<ResponseBloc>().add(
              ResponseEvent.textAnswerAdded(question: question, answer: value),
            );
          },
        ),
      ],
    );
  }
}
