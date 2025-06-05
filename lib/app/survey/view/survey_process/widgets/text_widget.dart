import 'package:democracy/app/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/app/survey/models/question.dart';
import 'package:democracy/app/survey/models/text_answer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({
    super.key,
    required this.question,
    required this.textAnswer,
  });

  final Question question;
  final TextAnswer? textAnswer;

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
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
          TextFormField(
            initialValue: widget.textAnswer?.text,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            onChanged: (value) {
              context.read<AnswerBloc>().add(
                AnswerEvent.textAnswerAdded(
                  question: widget.question,
                  text: value,
                ),
              );
            },
            decoration: InputDecoration(
              errorText: errorText,
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
