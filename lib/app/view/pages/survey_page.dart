import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:democracy/app/utils/view/no_results.dart';
import 'package:democracy/survey/bloc/surveys/surveys_cubit.dart';
import 'package:democracy/survey/view/surveys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getSurveys());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<SurveysCubit, SurveysState>(
      builder: (context, state) {
        switch (state) {
          case SurveysLoaded(:final surveys):
            return (surveys.isNotEmpty)
                ? Surveys(surveys: surveys)
                : const NoResults();
          case SurveysFailure():
            return FailureRetryButton(
              onPressed: () {
                context.read<WebsocketBloc>().add(
                  const WebsocketEvent.getPolls(),
                );
              },
            );
          default:
            return const LoadingIndicator();
        }
      },
    );
  }
}
