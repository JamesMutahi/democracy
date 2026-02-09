import 'package:democracy/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/survey/models/choice.dart';
import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MultipleChoiceWidget extends StatefulWidget {
  const MultipleChoiceWidget({
    super.key,
    required this.question,
    required this.choiceAnswers,
  });

  final Question question;
  final List<ChoiceAnswer> choiceAnswers;

  @override
  State<MultipleChoiceWidget> createState() => _MultipleChoiceWidgetState();
}

class _MultipleChoiceWidgetState extends State<MultipleChoiceWidget> {
  String? errorText;
  List<Choice> selectedChoices = [];

  @override
  Widget build(BuildContext context) {
    for (ChoiceAnswer choiceAnswer in widget.choiceAnswers) {
      selectedChoices.add(choiceAnswer.choice);
    }
    return BlocListener<AnswerBloc, AnswerState>(
      listener: (context, state) {
        if (state.status == AnswerStatus.validationFailure) {
          if (state.required!.any((e) => e.id == widget.question.id)) {
            setState(() {
              errorText = 'This field is required';
            });
          }
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(widget.question.text),
              SizedBox(width: 5),
              (widget.question.isRequired)
                  ? Text(
                    '*',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  )
                  : SizedBox.shrink(),
            ],
          ),
          SizedBox(height: 10),
          FormBuilderCheckboxGroup<Choice>(
            name: widget.question.text,
            initialValue: selectedChoices,
            orientation: OptionsOrientation.vertical,
            decoration: InputDecoration(
              hintText: widget.question.hint,
              errorText: errorText,
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
            options:
                widget.question.choices
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
                  question: widget.question,
                  choices: choices!,
                ),
              );
            },
            separator: const VerticalDivider(width: 10, thickness: 5),
          ),
        ],
      ),
    );
  }
}
