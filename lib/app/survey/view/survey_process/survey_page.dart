import 'package:democracy/app/survey/bloc/survey-process/response/response_bloc.dart';
import 'package:democracy/app/survey/bloc/survey-process/survey_bottom_navigation/survey_bottom_navigation_bloc.dart';
import 'package:democracy/app/survey/bloc/survey-process/page/page_bloc.dart';
import 'package:democracy/app/survey/models/question.dart';
import 'package:democracy/app/survey/models/survey.dart';
import 'package:democracy/app/survey/view/survey_process/widgets/index.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:democracy/app/utils/view/no_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key, required this.survey});

  final Survey survey;

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  void initState() {
    context.read<SurveyBottomNavigationBloc>().add(
      SurveyBottomNavigationEvent.started(survey: widget.survey),
    );
    context.read<ResponseBloc>().add(
      ResponseEvent.started(survey: widget.survey),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<
      SurveyBottomNavigationBloc,
      SurveyBottomNavigationState
    >(
      listener: (context, state) {
        if (state.status == SurveyBottomNavigationStatus.loaded) {
          context.read<PageBloc>().add(
            PageEvent.pageLoaded(survey: widget.survey, page: state.page),
          );
        }
      },
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
                title: Text('Leave survey?', textAlign: TextAlign.center),
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
                          return Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: QuestionTile(question: questions[index]),
                          );
                        },
                        itemCount: questions.length,
                      )
                      : const NoResults();
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
  const QuestionTile({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    switch (question.type) {
      case QuestionType.number:
        return NumberWidget(question: question);
      case QuestionType.text:
        return TextWidget(question: question);
      case QuestionType.singleChoice:
        return SingleChoiceWidget(question: question);
      case QuestionType.multipleChoice:
        return MultipleChoiceWidget(question: question);
    }
  }
}
