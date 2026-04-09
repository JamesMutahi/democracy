import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_bloc.dart';
import 'package:democracy/survey/bloc/survey_filter/survey_filter_cubit.dart';
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

class _SurveysState extends State<Surveys> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<SurveysBloc>().add(
      SurveysEvent.get(isActive: true, filterByRegion: true),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<SurveyDetailBloc, SurveyDetailState>(
          listener: (context, state) {
            final surveysBloc = context.read<SurveysBloc>();

            if (state is SurveyCreated) {
              surveysBloc.add(SurveysEvent.add(survey: state.survey));
            } else if (state is SurveyUpdated) {
              surveysBloc.add(SurveysEvent.update(survey: state.survey));
            } else if (state is SurveyDeleted) {
              surveysBloc.add(SurveysEvent.remove(surveyId: state.surveyId));
            }
          },
        ),
        BlocListener<AnswerBloc, AnswerState>(
          listener: (context, state) {
            if (state.status == AnswerStatus.submitted) {
              context.read<SurveysBloc>().add(
                SurveysEvent.update(survey: state.survey!),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<SurveyFilterCubit, SurveyFilterState>(
        builder: (context, filterState) {
          return BlocBuilder<SurveysBloc, SurveysState>(
            builder: (context, surveysState) {
              final surveys = surveysState.surveys.toList();

              if (surveysState.status == SurveysStatus.initial ||
                  (surveysState.status == SurveysStatus.loading &&
                      surveys.isEmpty)) {
                return const BottomLoader();
              }

              if (surveysState.status == SurveysStatus.success) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              }

              if (surveysState.status == SurveysStatus.failure) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshFailed();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadFailed();
                }

                if (surveysState.surveys.isEmpty) {
                  return FailureRetryButton(
                    onPressed: () => context.read<SurveysBloc>().add(
                      SurveysEvent.get(searchTerm: filterState.searchTerm),
                    ),
                  );
                }
              }

              void getSurveys({List<Survey>? previousSurveys}) {
                context.read<SurveysBloc>().add(
                  SurveysEvent.get(
                    previousSurveys: previousSurveys,
                    searchTerm: filterState.searchTerm,
                    isActive: filterState.isActive,
                    sortBy: filterState.sortBy,
                    filterByRegion: filterState.filterByRegion,
                    startDate: filterState.startDate,
                    endDate: filterState.endDate,
                  ),
                );
              }

              return SmartRefresher(
                enablePullDown: true,
                enablePullUp: surveysState.hasNext,
                header: ClassicHeader(),
                controller: _refreshController,
                onRefresh: getSurveys,
                onLoading: () {
                  getSurveys(previousSurveys: surveys);
                },
                footer: ClassicFooter(),
                child: ListView.builder(
                  padding: EdgeInsets.all(15),
                  itemBuilder: (BuildContext context, int index) {
                    Survey survey = surveys[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: SurveyTile(
                        key: ValueKey(survey.id),
                        survey: survey,
                        isDependency: false,
                      ),
                    );
                  },
                  itemCount: surveys.length,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
