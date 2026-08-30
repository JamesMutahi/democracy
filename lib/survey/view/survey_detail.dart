import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/geo/view/widgets/geo_chip.dart';
import 'package:democracy/survey/bloc/survey/survey_bloc.dart';
import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/summary.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/models/text_answer.dart';
import 'package:democracy/survey/view/widgets/summary.dart';
import 'package:democracy/survey/view/widgets/survey_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

@RoutePage()
class SurveyDetail extends StatelessWidget {
  const SurveyDetail({super.key, @PathParam('id') required this.surveyId});

  final int surveyId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SurveyBloc(webSocketService: context.read<WebSocketService>())
            ..add(SurveyEvent.load(surveyId: surveyId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Survey'),
          actions: [
            BlocBuilder<SurveyBloc, SurveyState>(
              buildWhen: (previous, current) => current.surveyId == surveyId,
              builder: (context, state) {
                return state.survey != null
                    ? Visibility(
                        visible: state.survey != null,
                        child: Container(
                          margin: EdgeInsets.only(right: 15),
                          child: SurveyPopUpMenu(survey: state.survey!),
                        ),
                      )
                    : SizedBox.shrink();
              },
            ),
          ],
        ),
        body: BlocBuilder<SurveyBloc, SurveyState>(
          buildWhen: (previous, current) => current.surveyId == surveyId,
          builder: (context, state) {
            if (state.status == SurveyStatus.initial ||
                (state.status == SurveyStatus.loading &&
                    state.survey == null)) {
              return BottomLoader();
            }
            if (state.status == SurveyStatus.failure && state.survey == null) {
              return FailureRetryButton(
                onPressed: () {
                  context.read<SurveyBloc>().add(
                    SurveyEvent.load(surveyId: surveyId),
                  );
                },
              );
            }
            return _SurveyDetail(survey: state.survey!);
          },
        ),
      ),
    );
  }
}

class _SurveyDetail extends StatelessWidget {
  final Survey survey;

  const _SurveyDetail({required this.survey});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Visibility(
              visible: survey.county != null,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                child: GeoChipRow(
                  county: survey.county,
                  constituency: survey.constituency,
                  ward: survey.ward,
                ),
              ),
            ),
            Text(survey.title, style: Theme.of(context).textTheme.titleLarge),
            Visibility(
              visible: survey.description.isNotEmpty,
              child: Container(
                margin: EdgeInsets.only(top: 5, bottom: 10),
                child: Text(survey.description),
              ),
            ),
            TabBar(
              tabs: [
                Tab(text: 'Summary'),
                Tab(text: 'My Response'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // TAB 1: SUMMARY
                  survey.summary != null &&
                          survey.summary!.status == SummaryStatus.completed
                      ? SurveySummaryWidget(summary: survey.summary!)
                      : _buildSummaryPlaceholder(color),

                  // TAB 2: MY RESPONSE
                  survey.response != null
                      ? _buildMyResponseTab(color)
                      : _buildNoResponsePlaceholder(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryPlaceholder(Color color) {
    final summary = survey.summary;
    String message;
    IconData icon;

    if (summary == null) {
      message = 'Summary has not been generated yet.';
      icon = Icons.hourglass_empty;
    } else {
      switch (summary.status) {
        case SummaryStatus.pending:
          message = 'Summary is pending.';
          icon = Icons.hourglass_empty;
          break;
        case SummaryStatus.processing:
          message = 'Summary is being generated...';
          icon = Icons.autorenew;
          break;
        case SummaryStatus.failed:
          message = 'Summary generation failed.';
          icon = Icons.error_outline;
          break;
        default:
          message = 'Summary is not available.';
          icon = Icons.info_outline;
      }
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Total responses: ${survey.totalResponses}',
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoResponsePlaceholder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.rate_review_outlined, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'You have not submitted a response yet.',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildMyResponseTab(Color color) {
    final response = survey.response!;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Response header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Response',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Submitted: ${DateFormat('MMM d, y • h:mm a').format(response.endTime)}',
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Text answers
          if (response.textAnswers.isNotEmpty) ...[
            Text(
              'Text Answers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...response.textAnswers.map(
              (answer) => _buildTextAnswerCard(answer),
            ),
            const SizedBox(height: 24),
          ],

          // Choice answers
          if (response.choiceAnswers.isNotEmpty) ...[
            Text(
              'Choice Answers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...response.choiceAnswers.map(
              (answer) => _buildChoiceAnswerCard(answer, color),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTextAnswerCard(TextAnswer answer) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              answer.question.text,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              answer.text,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceAnswerCard(ChoiceAnswer answer, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              answer.question.text,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: color..withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: color..withValues(alpha: 0.3)),
              ),
              child: Text(
                answer.choice.text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
