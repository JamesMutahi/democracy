import 'package:democracy/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/survey/models/question.dart';
import 'package:democracy/survey/models/text_answer.dart';
import 'package:democracy/survey/view/survey_process/widgets/question_header.dart';
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
        if (state.status == AnswerStatus.validationFailure &&
            state.required!.any((e) => e.id == widget.question.id)) {
          setState(() => errorText = 'This field is required');
        } else {
          setState(() => errorText = null);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionHeader(question: widget.question),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: widget.textAnswer?.text,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 4,
            maxLength: 500,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            onChanged: (value) {
              context.read<AnswerBloc>().add(
                AnswerEvent.textAnswerAdded(
                  question: widget.question,
                  text: value,
                ),
              );
              if (errorText != null) setState(() => errorText = null);
            },
            decoration: InputDecoration(
              hintText: widget.question.hint ?? 'Type your answer...',
              errorText: errorText,
              filled: true,
              fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
