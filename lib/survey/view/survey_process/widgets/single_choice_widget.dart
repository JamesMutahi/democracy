import 'package:democracy/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/survey/models/choice.dart';
import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SingleChoiceWidget extends StatefulWidget {
  const SingleChoiceWidget({
    super.key,
    required this.question,
    required this.choiceAnswer,
  });

  final Question question;
  final ChoiceAnswer? choiceAnswer;

  @override
  State<SingleChoiceWidget> createState() => _SingleChoiceWidgetState();
}

class _SingleChoiceWidgetState extends State<SingleChoiceWidget> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    List<Choice> choices = widget.question.choices.toList();
    choices.sort((a, b) => a.number.compareTo(b.number));
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
          FormBuilderDropdown<Choice>(
            name: widget.question.text,
            initialValue: widget.choiceAnswer?.choice,
            key: ValueKey(widget.question),
            decoration: InputDecoration(
              hintText:
                  (widget.question.hint == null)
                      ? 'Select option'
                      : widget.question.hint,
              errorText: errorText,
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
            items:
                choices
                    .map(
                      (e) => DropdownMenuItem<Choice>(
                        value: e,
                        child: Text(e.text),
                      ),
                    )
                    .toList(),
            onChanged: (choice) {
              context.read<AnswerBloc>().add(
                AnswerEvent.singleChoiceAnswerAdded(
                  question: widget.question,
                  choice: choice!,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
