import 'package:democracy/app/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/app/survey/models/choice.dart';
import 'package:democracy/app/survey/models/choice_answer.dart';
import 'package:democracy/app/survey/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MultipleChoiceWidget extends StatelessWidget {
  const MultipleChoiceWidget({
    super.key,
    required this.question,
    required this.choiceAnswers,
  });

  final Question question;
  final List<ChoiceAnswer> choiceAnswers;

  @override
  Widget build(BuildContext context) {
    List<Choice> selectedChoices = [];
    for (ChoiceAnswer choiceAnswer in choiceAnswers) {
      selectedChoices.add(choiceAnswer.choice);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question.text),
        SizedBox(height: 10),
        FormBuilderCheckboxGroup<Choice>(
          name: question.text,
          initialValue: selectedChoices,
          decoration: InputDecoration(hintText: question.hint),
          options:
              question.choices
                  .map(
                    (e) => FormBuilderFieldOption<Choice>(
                      value: e,
                      child: Text(e.text),
                    ),
                  )
                  .toList(),
          onChanged: (choices) {
            context.read<AnswerBloc>().add(
              AnswerEvent.multipleChoiceAnswerAdded(
                question: question,
                choices: choices!,
              ),
            );
          },
          separator: const VerticalDivider(width: 10, thickness: 5),
        ),
      ],
    );
  }
}
