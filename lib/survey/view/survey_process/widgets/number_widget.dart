import 'package:democracy/survey/bloc/survey_process/answer/answer_cubit.dart';
import 'package:democracy/survey/models/question.dart';
import 'package:democracy/survey/models/text_answer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberWidget extends StatefulWidget {
  const NumberWidget({
    super.key,
    required this.question,
    required this.textAnswer,
  });

  final Question question;
  final TextAnswer? textAnswer;

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnswerCubit, AnswerState>(
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
            keyboardType: TextInputType.number,
            onChanged: (value) {
              context.read<AnswerCubit>().textAnswerAdded(
                question: widget.question,
                text: value,
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
