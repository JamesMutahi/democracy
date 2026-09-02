import 'package:democracy/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/survey/models/choice.dart';
import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/question.dart';
import 'package:democracy/survey/view/survey_process/widgets/question_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final choices = List<Choice>.from(widget.question.choices)
      ..sort((a, b) => a.number.compareTo(b.number));
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<AnswerBloc, AnswerState>(
      listener: (context, state) {
        if (state.status == AnswerStatus.validationFailure &&
            state.required!.any((e) => e.id == widget.question.id)) {
          setState(() => errorText = 'Please select an option');
        } else {
          setState(() => errorText = null);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionHeader(question: widget.question),
          if (widget.question.hint != null) ...[
            const SizedBox(height: 8),
            Text(
              widget.question.hint!,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: colorScheme.outline),
            ),
          ],
          const SizedBox(height: 16),
          ...choices.map((choice) {
            final isSelected = widget.choiceAnswer?.choice.id == choice.id;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  context.read<AnswerBloc>().add(
                    AnswerEvent.singleChoiceAnswerAdded(
                      question: widget.question,
                      choice: choice,
                    ),
                  );
                  if (errorText != null) setState(() => errorText = null);
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? colorScheme.primaryContainer
                        : colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.outlineVariant,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          choice.text,
                          style: TextStyle(
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                            color: isSelected
                                ? colorScheme.onPrimaryContainer
                                : colorScheme.onSurface,
                          ),
                        ),
                      ),
                      Icon(
                        isSelected
                            ? Icons.radio_button_checked_rounded
                            : Icons.radio_button_unchecked_rounded,
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.outline,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          if (errorText != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 12.0),
              child: Text(
                errorText!,
                style: TextStyle(color: colorScheme.error, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
