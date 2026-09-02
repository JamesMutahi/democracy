import 'package:democracy/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/survey/models/choice.dart';
import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/question.dart';
import 'package:democracy/survey/view/survey_process/widgets/question_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    final selectedIds = widget.choiceAnswers.map((e) => e.choice.id).toList();
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<AnswerBloc, AnswerState>(
      listener: (context, state) {
        if (state.status == AnswerStatus.validationFailure &&
            state.required!.any((e) => e.id == widget.question.id)) {
          setState(() => errorText = 'Please select at least one option');
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
          ...widget.question.choices.map((choice) {
            final isSelected = selectedIds.contains(choice.id);
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  final currentChoices = List<Choice>.from(
                    widget.choiceAnswers.map((e) => e.choice),
                  );
                  if (isSelected) {
                    currentChoices.removeWhere((c) => c.id == choice.id);
                  } else {
                    currentChoices.add(choice);
                  }
                  context.read<AnswerBloc>().add(
                    AnswerEvent.multipleChoiceAnswerAdded(
                      question: widget.question,
                      choices: currentChoices,
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
                            ? Icons.check_box_rounded
                            : Icons.check_box_outline_blank_rounded,
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
