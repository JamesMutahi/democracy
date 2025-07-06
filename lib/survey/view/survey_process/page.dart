import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/survey_bottom_navigation/survey_bottom_navigation_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/page/page_bloc.dart';
import 'package:democracy/survey/models/question.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/survey_process/widgets/index.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:democracy/app/utils/view/no_results.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurveyProcessPage extends StatefulWidget {
  const SurveyProcessPage({super.key, required this.survey});

  final Survey survey;

  @override
  State<SurveyProcessPage> createState() => _SurveyProcessPageState();
}

class _SurveyProcessPageState extends State<SurveyProcessPage> {
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
              Navigator.of(context).pop();
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: Theme.of(context).cardColor,
                content: SnackBarContent(
                  message: 'Submitted',
                  status: SnackBarStatus.success,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state.status == AnswerStatus.submissionFailure) {
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: Theme.of(context).cardColor,
                content: SnackBarContent(
                  message: 'Something went wrong.',
                  status: SnackBarStatus.failure,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      ],
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Center(
                  child: Text('Leave survey?', textAlign: TextAlign.center),
                ),
                content: Text(
                  'Progress is not saved',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child: Text('Yes'),
                      ),
                      SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No'),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
        child: Scaffold(
          appBar: AppBar(title: Text(widget.survey.name)),
          body: BlocBuilder<PageBloc, PageState>(
            builder: (context, state) {
              switch (state) {
                case PageLoaded():
                  List<Question> questions = state.questions;
                  return (questions.isNotEmpty)
                      ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 20.0,
                          bottom: 160,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return QuestionTile(
                            questions: state.questions,
                            question: questions[index],
                          );
                        },
                        itemCount: questions.length,
                      )
                      : const NoResults();
                case PageComplete():
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Survey complete', style: TextStyle(fontSize: 20)),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            text: 'Tap ',
                            style: TextStyle(color: Colors.grey),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'submit ',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey,
                                ),
                              ),
                              TextSpan(
                                text: 'to submit your response',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        BlocBuilder<AnswerBloc, AnswerState>(
                          builder: (context, answerState) {
                            return ElevatedButton(
                              onPressed: () {
                                context.read<WebsocketBloc>().add(
                                  WebsocketEvent.submitResponse(
                                    survey: answerState.survey!,
                                    startTime: answerState.startTime!,
                                    endTime: answerState.endTime!,
                                    textAnswers: answerState.textAnswers!,
                                    choiceAnswers: answerState.choiceAnswers!,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(
                                      context,
                                    ).colorScheme.tertiaryContainer,
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              child: Text('SUBMIT'),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                default:
                  return const LoadingIndicator();
              }
            },
          ),
          bottomNavigationBar: BottomNavBar(survey: widget.survey),
        ),
      ),
    );
  }
}

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
          state.textAnswers!.removeWhere(
            (textAnswer) => textAnswer.question.id == question.id,
          );
          state.choiceAnswers!.removeWhere(
            (choiceAnswer) => choiceAnswer.question.id == question.id,
          );
        }
        return hideDependencyQuestion
            ? SizedBox.shrink()
            : Container(
              margin: EdgeInsets.only(bottom: 20),
              child: switch (question.type) {
                QuestionType.number => NumberWidget(
                  key: ValueKey(question),
                  question: question,
                  textAnswer:
                      (textAnswerExists)
                          ? state.textAnswers?.firstWhere(
                            (textAnswer) =>
                                textAnswer.question.id == question.id,
                          )
                          : null,
                ),
                QuestionType.text => TextWidget(
                  key: ValueKey(question),
                  question: question,
                  textAnswer:
                      (textAnswerExists)
                          ? state.textAnswers?.firstWhere(
                            (textAnswer) =>
                                textAnswer.question.id == question.id,
                          )
                          : null,
                ),
                QuestionType.singleChoice => SingleChoiceWidget(
                  key: ValueKey(question),
                  question: question,
                  choiceAnswer:
                      (choiceAnswerExists)
                          ? state.choiceAnswers!.firstWhere(
                            (choiceAnswer) =>
                                choiceAnswer.question.id == question.id,
                          )
                          : null,
                ),
                QuestionType.multipleChoice => MultipleChoiceWidget(
                  key: ValueKey(question),
                  question: question,
                  choiceAnswers:
                      (choiceAnswerExists)
                          ? state.choiceAnswers!
                              .where(
                                (choiceAnswer) =>
                                    choiceAnswer.question.id == question.id,
                              )
                              .toList()
                          : [],
                ),
              },
            );
      },
    );
  }
}
