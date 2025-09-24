import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/survey/bloc/surveys/surveys_bloc.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Surveys extends StatefulWidget {
  const Surveys({super.key});

  @override
  State<Surveys> createState() => _SurveysState();
}

class _SurveysState extends State<Surveys> {
  bool loading = true;
  bool failure = false;
  List<Survey> _surveys = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<SurveysBloc>().add(SurveysEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SurveysBloc, SurveysState>(
          listener: (context, state) {
            if (state.status == SurveysStatus.success) {
              setState(() {
                loading = false;
                failure = false;
                _surveys = state.surveys;
                hasNextPage = state.hasNext;
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              });
            }
            if (state.status == SurveysStatus.failure) {
              if (loading) {
                setState(() {
                  loading = false;
                  failure = true;
                });
              }
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshFailed();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadFailed();
              }
            }
          },
        ),
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
        BlocListener<SurveyDetailBloc, SurveyDetailState>(
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
            if (state is SurveyDeleted) {
              if (_surveys.any((survey) => survey.id == state.surveyId)) {
                setState(() {
                  _surveys.removeWhere((survey) => survey.id == state.surveyId);
                });
              }
            }
          },
        ),
      ],
      child:
          loading
              ? BottomLoader()
              : failure
              ? FailureRetryButton(
                onPressed: () {
                  context.read<SurveysBloc>().add(SurveysEvent.get());
                },
              )
              : SmartRefresher(
                enablePullDown: true,
                enablePullUp: hasNextPage,
                header: ClassicHeader(),
                controller: _refreshController,
                onRefresh: () {
                  context.read<SurveysBloc>().add(SurveysEvent.get());
                },
                onLoading: () {
                  context.read<SurveysBloc>().add(
                    SurveysEvent.get(lastSurvey: _surveys.last),
                  );
                },
                footer: ClassicFooter(),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    Survey survey = _surveys[index];
                    return SurveyTile(
                      key: ValueKey(survey.id),
                      survey: survey,
                      isDependency: false,
                    );
                  },
                  itemCount: _surveys.length,
                ),
              ),
    );
  }
}
