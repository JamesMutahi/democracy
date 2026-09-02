import 'package:democracy/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/survey_bottom_navigation/survey_bottom_navigation_bloc.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.survey, required});

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(color: Colors.black..withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -5)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: BlocBuilder<SurveyBottomNavigationBloc, SurveyBottomNavigationState>(
            builder: (context, state) {
              if (state.status == SurveyBottomNavigationStatus.completed) {
                return _CompletionRow(state: state);
              }
              return _NavigationRow(state: state, survey: survey);
            },
          ),
        ),
      ),
    );
  }
}

class _NavigationRow extends StatelessWidget {
  const _NavigationRow({required this.state, required this.survey});
  final SurveyBottomNavigationState state;
  final Survey survey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: state.isFirst ? null : () => context.read<SurveyBottomNavigationBloc>().add(SurveyBottomNavigationEvent.loadPrevPage(survey: survey)),
            style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
            child: const Text('Back'),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '${state.page + 1} / ${state.lastPage + 1}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: BlocListener<AnswerBloc, AnswerState>(
            listener: (context, answerState) {
              if (answerState.status == AnswerStatus.validated) {
                context.read<SurveyBottomNavigationBloc>().add(SurveyBottomNavigationEvent.loadNextPage(survey: survey));
              }
            },
            child: FilledButton(
              onPressed: () {
                final questions = survey.pages.firstWhere((page) => page.number == state.page).questions.toList();
                context.read<AnswerBloc>().add(AnswerEvent.validate(questions: questions));
              },
              style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
              child: const Text('Next'),
            ),
          ),
        ),
      ],
    );
  }
}

class _CompletionRow extends StatelessWidget {
  const _CompletionRow({required this.state});
  final SurveyBottomNavigationState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => context.read<SurveyBottomNavigationBloc>().add(SurveyBottomNavigationEvent.returnToSurvey()),
        icon: const Icon(Icons.arrow_back_rounded),
        label: const Text('Review Answers'),
        style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
      ),
    );
  }
}