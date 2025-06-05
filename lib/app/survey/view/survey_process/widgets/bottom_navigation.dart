import 'package:democracy/app/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/app/survey/bloc/survey_process/survey_bottom_navigation/survey_bottom_navigation_bloc.dart';
import 'package:democracy/app/survey/models/survey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.survey, required});

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: Theme.of(context).canvasColor,
      child:
          BlocBuilder<SurveyBottomNavigationBloc, SurveyBottomNavigationState>(
            builder: (context, state) {
              switch (state.status) {
                case SurveyBottomNavigationStatus.completed:
                  return CompletionRow(state: state);
                default:
                  return NavigationRow(state: state, survey: survey);
              }
            },
          ),
    );
  }
}

class NavigationRow extends StatelessWidget {
  const NavigationRow({super.key, required this.state, required this.survey});

  final SurveyBottomNavigationState state;
  final Survey survey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NavigationButton(
          onPressed:
              (state.isFirst)
                  ? null
                  : () {
                    context.read<SurveyBottomNavigationBloc>().add(
                      SurveyBottomNavigationEvent.loadPrevPage(survey: survey),
                    );
                  },
          text: 'PREV',
          disabled: state.isFirst,
        ),
        Text(
          'Page ${state.page + 1} of ${state.lastPage + 1}',
          style: TextStyle(color: Theme.of(context).disabledColor),
        ),
        BlocListener<AnswerBloc, AnswerState>(
          listener: (context, answerState) {
            if (answerState.status == AnswerStatus.validated) {
              context.read<SurveyBottomNavigationBloc>().add(
                SurveyBottomNavigationEvent.loadNextPage(survey: survey),
              );
            }
          },
          child: NavigationButton(
            onPressed: () {
              context.read<AnswerBloc>().add(
                AnswerEvent.validate(
                  questions:
                      survey.questions
                          .where((e) => e.page == state.page)
                          .toList(),
                ),
              );
            },
            text: 'NEXT',
          ),
        ),
      ],
    );
  }
}

class CompletionRow extends StatelessWidget {
  const CompletionRow({super.key, required this.state});

  final SurveyBottomNavigationState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NavigationButton(
          onPressed: () {
            context.read<SurveyBottomNavigationBloc>().add(
              SurveyBottomNavigationEvent.returnToSurvey(),
            );
          },
          text: 'PREV',
        ),
      ],
    );
  }
}

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.disabled = false,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            disabled
                ? Theme.of(context).disabledColor
                : Theme.of(context).colorScheme.tertiaryContainer,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
      ),
      child: Text(text),
    );
  }
}
