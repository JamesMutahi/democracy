import 'package:democracy/app/survey/bloc/survey-process/answer/answer_bloc.dart';
import 'package:democracy/app/survey/models/choice.dart';
import 'package:democracy/app/survey/models/choice_answer.dart';
import 'package:democracy/app/survey/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SingleChoiceWidget extends StatelessWidget {
  const SingleChoiceWidget({
    super.key,
    required this.question,
    required this.choiceAnswer,
  });

  final Question question;
  final ChoiceAnswer? choiceAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question.text),
        SizedBox(height: 10),
        FormBuilderDropdown<Choice>(
          name: question.text,
          initialValue: choiceAnswer?.choice,
          key: ValueKey(question),
          decoration: InputDecoration(
            hintText: (question.hint == null) ? 'Select option' : question.hint,
          ),
          items:
              question.choices
                  .map(
                    (e) =>
                        DropdownMenuItem<Choice>(value: e, child: Text(e.text)),
                  )
                  .toList(),
          onChanged: (choice) {
            context.read<AnswerBloc>().add(
              AnswerEvent.singleChoiceAnswerAdded(
                question: question,
                choice: choice!,
              ),
            );
          },
        ),
      ],
    );
  }
}
