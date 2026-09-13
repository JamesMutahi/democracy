import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/no_results.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/widgets/main_container.dart';
import 'package:democracy/ballot/view/widgets/ballot_tile.dart' show TimeLeft;
import 'package:democracy/survey/bloc/survey/survey_bloc.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/page/page_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/survey_bottom_navigation/survey_bottom_navigation_bloc.dart';
import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/question.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/survey_process/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SurveyProcess extends StatelessWidget {
  const SurveyProcess({super.key, @PathParam('id') required this.surveyId});

  final int surveyId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SurveyBloc(webSocketService: context.read<WebSocketService>())
            ..add(SurveyEvent.load(surveyId: surveyId)),
      child: MainContainer(
        child: Scaffold(
          appBar: AppBar(
            title: BlocBuilder<SurveyBloc, SurveyState>(
              buildWhen: (previous, current) => current.surveyId == surveyId,
              builder: (context, state) =>
                  Text(state.survey?.title ?? 'Survey'),
            ),
            centerTitle: true,
          ),
          body: BlocBuilder<SurveyBloc, SurveyState>(
            buildWhen: (previous, current) => current.surveyId == surveyId,
            builder: (context, state) {
              if (state.status == SurveyStatus.initial ||
                  (state.status == SurveyStatus.loading &&
                      state.survey == null)) {
                return const Center(child: BottomLoader());
              }
              if (state.status == SurveyStatus.failure &&
                  state.survey == null) {
                return Center(
                  child: FailureRetryButton(
                    onPressed: () => context.read<SurveyBloc>().add(
                      SurveyEvent.load(surveyId: surveyId),
                    ),
                  ),
                );
              }
              return _SurveyProcess(survey: state.survey!);
            },
          ),
          bottomNavigationBar: BlocBuilder<SurveyBloc, SurveyState>(
            buildWhen: (previous, current) => current.surveyId == surveyId,
            builder: (context, state) => state.survey != null
                ? BottomNavBar(survey: state.survey!)
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

class _SurveyProcess extends StatefulWidget {
  const _SurveyProcess({required this.survey});
  final Survey survey;

  @override
  State<_SurveyProcess> createState() => _SurveyProcessState();
}

class _SurveyProcessState extends State<_SurveyProcess> {
  @override
  void initState() {
    context.read<SurveyBottomNavigationBloc>().add(
      SurveyBottomNavigationEvent.started(survey: widget.survey),
    );
    context.read<AnswerBloc>().add(AnswerEvent.started(survey: widget.survey));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SurveyDetailBloc, SurveyDetailState>(
          listener: (context, state) {
            if (state is SurveyUpdated && widget.survey.id == state.survey.id) {
              context.read<SurveyBloc>().add(
                SurveyEvent.updated(survey: state.survey),
              );
            }
          },
        ),
        BlocListener<SurveyBottomNavigationBloc, SurveyBottomNavigationState>(
          listener: (context, state) {
            if (state.status == SurveyBottomNavigationStatus.loaded) {
              context.read<PageBloc>().add(
                PageEvent.pageLoaded(survey: widget.survey, page: state.page),
              );
            }
            if (state.status == SurveyBottomNavigationStatus.completed) {
              context.read<PageBloc>().add(PageEvent.completed());
            }
          },
        ),
        BlocListener<AnswerBloc, AnswerState>(
          listener: (context, state) {
            if (state.status == AnswerStatus.submitted) {
              context.router.popTop();
              ScaffoldMessenger.of(context).showSnackBar(
                getSnackBar(
                  context: context,
                  message: 'Submitted successfully',
                  status: SnackBarStatus.success,
                ),
              );
            }
            if (state.status == AnswerStatus.submissionFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                getSnackBar(
                  context: context,
                  message: state.submissionError,
                  status: SnackBarStatus.failure,
                ),
              );
            }
          },
        ),
      ],
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          _showLeaveDialog(context);
        },
        child: BlocBuilder<PageBloc, PageState>(
          builder: (context, state) {
            switch (state) {
              case PageLoaded():
                final questions = state.page.questions;
                return questions.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                        itemBuilder: (context, index) {
                          return QuestionTile(
                            key: ValueKey(questions[index].id),
                            questions: questions,
                            question: questions[index],
                          );
                        },
                        itemCount: questions.length,
                      )
                    : const Center(
                        child: NoResults(
                          text: "Oops... questions for this page are missing",
                        ),
                      );
              case PageComplete():
                return _CompletionView(survey: widget.survey);
              default:
                return const Center(child: BottomLoader());
            }
          },
        ),
      ),
    );
  }

  void _showLeaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        title: 'Leave survey?',
        content: 'Your progress will not be saved.',
        textButtonText: 'Leave',
        onTextButtonPressed: () {
          context.router.popTop();
          context.router.popTop();
        },
        elevatedButtonText: 'Stay',
        onElevatedButtonPressed: () => context.router.popTop(),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Completion View
// -----------------------------------------------------------------------------

class _CompletionView extends StatelessWidget {
  const _CompletionView({required this.survey});
  final Survey survey;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.celebration_rounded,
                size: 64,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'You\'re all set!',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Review your answers and submit your response.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TimeLeft(
              key: ValueKey('survey_${survey.id}'),
              startTime: survey.startTime,
              endTime: survey.endTime,
            ),
            const SizedBox(height: 40),
            BlocBuilder<AnswerBloc, AnswerState>(
              builder: (context, answerState) {
                return SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton.icon(
                    onPressed: survey.isActive
                        ? () {
                            context.read<AnswerBloc>().add(
                              AnswerEvent.submit(
                                survey: answerState.survey!,
                                startTime: answerState.startTime!,
                                endTime: answerState.endTime!,
                                textAnswers: answerState.textAnswers!,
                                choiceAnswers: answerState.choiceAnswers!,
                              ),
                            );
                          }
                        : null,
                    icon: const Icon(Icons.send_rounded),
                    label: Text(
                      survey.isActive ? 'Submit Response' : 'Survey Closed',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Question Tile & Wrapper
// -----------------------------------------------------------------------------

class QuestionTile extends StatelessWidget {
  const QuestionTile({
    super.key,
    required this.questions,
    required this.question,
  });
  final List<Question> questions;
  final Question question;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnswerBloc, AnswerState>(
      builder: (context, state) {
        bool textAnswerExists = state.textAnswers!.any(
          (e) => e.question.id == question.id,
        );
        bool choiceAnswerExists = state.choiceAnswers!.any(
          (e) => e.question.id == question.id,
        );

        bool hideDependencyQuestion = question.dependency != null;
        if (state.choiceAnswers!.any(
          (e) => e.choice.id == question.dependency,
        )) {
          hideDependencyQuestion = false;
        }

        if (hideDependencyQuestion) {
          state.textAnswers!.removeWhere((a) => a.question.id == question.id);
          state.choiceAnswers!.removeWhere((a) => a.question.id == question.id);
          return const SizedBox.shrink();
        }

        final textAnswer = (textAnswerExists)
            ? state.textAnswers?.firstWhere(
                (textAnswer) => textAnswer.question.id == question.id,
              )
            : null;
        final choiceAnswer = (choiceAnswerExists)
            ? state.choiceAnswers!.firstWhere(
                (choiceAnswer) => choiceAnswer.question.id == question.id,
              )
            : null;
        final choiceAnswers = (choiceAnswerExists)
            ? state.choiceAnswers!
                  .where(
                    (choiceAnswer) => choiceAnswer.question.id == question.id,
                  )
                  .toList()
            : <ChoiceAnswer>[];

        Widget child;
        switch (question.type) {
          case QuestionType.number:
            child = NumberWidget(question: question, textAnswer: textAnswer);
          case QuestionType.text:
            child = TextWidget(question: question, textAnswer: textAnswer);
          case QuestionType.singleChoice:
            child = SingleChoiceWidget(
              question: question,
              choiceAnswer: choiceAnswer,
            );
          case QuestionType.multipleChoice:
            child = MultipleChoiceWidget(
              question: question,
              choiceAnswers: choiceAnswers,
            );
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: _QuestionCard(child: child),
        );
      },
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(
            context,
          ).colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: child,
    );
  }
}
