import 'package:democracy/survey/bloc/survey_detail/survey_detail_cubit.dart';
import 'package:democracy/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Surveys extends StatefulWidget {
  const Surveys({super.key, required this.surveys});

  final List<Survey> surveys;

  @override
  State<Surveys> createState() => _SurveysState();
}

class _SurveysState extends State<Surveys> {
  final _scrollController = ScrollController();
  late final List<Survey> _surveys = widget.surveys.toList();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AnswerBloc, AnswerState>(
          listener: (context, state) {
            if (state.status == AnswerStatus.submitted) {
              if (_surveys.any((survey) => survey.id == state.survey!.id)) {
                setState(() {
                  int index = _surveys.indexWhere(
                    (survey) => survey.id == state.survey!.id,
                  );
                  _surveys[index] = state.survey!;
                });
              }
            }
          },
        ),
        BlocListener<SurveyDetailCubit, SurveyDetailState>(
          listener: (context, state) {
            if (state is SurveyCreated) {
              if (!_surveys.any((survey) => survey.id == state.survey.id)) {
                setState(() {
                  _surveys.add(state.survey);
                });
              }
            }
            if (state is SurveyUpdated) {
              if (_surveys.any((survey) => survey.id == state.survey.id)) {
                setState(() {
                  int index = _surveys.indexWhere(
                    (survey) => survey.id == state.survey.id,
                  );
                  _surveys[index] = state.survey;
                });
              }
            }
          },
        ),
      ],
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          Survey survey = _surveys[index];
          return SurveyTile(
            key: ValueKey(survey.id),
            survey: survey,
            isChildOfPost: false,
          );
        },
        itemCount: _surveys.length,
      ),
    );
  }
}
