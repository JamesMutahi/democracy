import 'package:democracy/app/survey/models/choice.dart';
import 'package:democracy/app/survey/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MultipleChoiceWidget extends StatelessWidget {
  const MultipleChoiceWidget({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question.text),
        SizedBox(height: 10),
        FormBuilderCheckboxGroup<Choice>(
          decoration: InputDecoration(hintText: question.hint),
          name: question.text,
          options:
              question.choices
                  .map(
                    (e) => FormBuilderFieldOption<Choice>(
                      value: e,
                      child: Text(e.text),
                    ),
                  )
                  .toList(),
          onChanged: (choices) {},
          separator: const VerticalDivider(width: 10, thickness: 5),
        ),
      ],
    );
  }
}
