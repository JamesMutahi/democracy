import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_bloc.dart';
import 'package:democracy/survey/bloc/survey_filter/survey_filter_cubit.dart';
import 'package:democracy/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/survey/bloc/surveys/surveys_bloc.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/widgets/survey_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Surveys extends StatefulWidget {
  const Surveys({super.key});

  @override
  State<Surveys> createState() => _SurveysState();
}

class _SurveysState extends State<Surveys> {
  final RefreshController _refreshController = RefreshController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<SurveysBloc>().add(
      SurveysEvent.get(
        isOpen: defaultIsOpen,
        filterByRegion: defaultFilterByRegion,
      ),
    );
    // Register the initial active controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ActiveScrollController.activate(_scrollController);
    });
  }

  @override
  void dispose() {
    // Clear the registry when leaving
    ActiveScrollController.deactivate(_scrollController);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);
    return MultiBlocListener(
      listeners: [
        BlocListener<NotificationDetailBloc, NotificationDetailState>(
          listener: (context, state) {
            if (state is NotificationCreated) {
              if (state.notification.survey != null) {
                final surveysBloc = context.read<SurveysBloc>();
                final survey = state.notification.survey;
                surveysBloc.add(SurveysEvent.add(survey: survey!));
              }
            }
          },
        ),
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
                    isOpen: filterState.isOpen,
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
                  controller: isWebLayout ? _scrollController : null,
                  physics: isWebLayout ? NeverScrollableScrollPhysics() : null,
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
