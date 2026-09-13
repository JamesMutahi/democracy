import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/geo/view/widgets/geo_chip.dart';
import 'package:democracy/survey/bloc/survey/survey_bloc.dart';
import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/question.dart';
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
      child: MainContainer(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
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
              if (state.status == SurveyStatus.failure &&
                  state.survey == null) {
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
      child: NestedScrollView(
        headerSliverBuilder: (context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(
                      survey.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Visibility(
                      visible: survey.description.isNotEmpty,
                      child: Container(
                        margin: EdgeInsets.only(top: 5, bottom: 10),
                        child: Text(survey.description),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _TabBarAppBarDelegate(
                TabBar(
                  tabs: [
                    Tab(text: 'Summary'),
                    Tab(text: 'My Response'),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            // TAB 1: SUMMARY
            survey.summary != null &&
                    survey.summary!.status == SummaryStatus.completed
                ? SurveySummaryTab(survey: survey)
                : _buildSummaryPlaceholder(color),

            // TAB 2: MY RESPONSE
            survey.response != null
                ? _buildMyResponseTab(color)
                : _buildNoResponsePlaceholder(),
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
            'You have not submitted a response.',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildMyResponseTab(Color color) {
    final response = survey.response!;
    Set<Question> questionsSet = {};
    for (TextAnswer textAnswer in response.textAnswers) {
      questionsSet.add(textAnswer.question);
    }
    for (ChoiceAnswer choiceAnswer in response.choiceAnswers) {
      questionsSet.add(choiceAnswer.question);
    }
    List<Question> questions = questionsSet.toList();
    questions.sort((a, b) => a.number.compareTo(b.number));
    return SingleChildScrollView(
      key: PageStorageKey<String>('my_response_${survey.id}'),
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

          ...questions.map((question) {
            List<String> answers = [];
            switch (question.type) {
              case QuestionType.text:
                answers.add(
                  response.textAnswers
                      .firstWhere((e) => e.question.id == question.id)
                      .text,
                );
              case QuestionType.number:
                answers.add(
                  response.textAnswers
                      .firstWhere((e) => e.question.id == question.id)
                      .text,
                );
              case QuestionType.singleChoice:
                answers.add(
                  response.choiceAnswers
                      .firstWhere((e) => e.question.id == question.id)
                      .choice
                      .text,
                );
              case QuestionType.multipleChoice:
                List<ChoiceAnswer> choiceAnswers = response.choiceAnswers
                    .where((e) => e.question.id == question.id)
                    .toList();
                for (ChoiceAnswer choiceAnswer in choiceAnswers) {
                  answers.add(choiceAnswer.choice.text);
                }
            }
            return _QuestionTile(question: question, answers: answers);
          }),
        ],
      ),
    );
  }
}

class _TabBarAppBarDelegate extends SliverPersistentHeaderDelegate {
  _TabBarAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_TabBarAppBarDelegate oldDelegate) {
    return false;
  }
}

class _QuestionTile extends StatelessWidget {
  const _QuestionTile({required this.question, required this.answers});

  final Question question;
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question.text, style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: Card.outlined(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [...answers.map((answer) => Text(answer))],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
