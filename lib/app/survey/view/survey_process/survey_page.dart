import 'package:democracy/app/survey/bloc/survey-process/page/page_bloc.dart';
import 'package:democracy/app/survey/models/question.dart';
import 'package:democracy/app/survey/models/survey.dart';
import 'package:democracy/app/survey/view/survey_process/bottom_navigation.dart';
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
    context.read<PageBloc>().add(PageEvent.started(survey: widget.survey));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      bottom: 160,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text(questions[index].text));
                    },
                    itemCount: questions.length,
                  )
                  : const NoResults();
            default:
              return const LoadingIndicator();
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
