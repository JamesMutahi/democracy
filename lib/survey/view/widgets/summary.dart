import 'package:democracy/survey/models/question.dart';
import 'package:democracy/survey/models/summary.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SurveySummaryTab extends StatelessWidget {
  final ScrollController scrollController;
  final Survey survey;

  const SurveySummaryTab({super.key,required this.scrollController,  required this.survey});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

    final color = Theme.of(context).primaryColor;
    final summary = survey.summary!;
    List<Question> questions = [];
    final pages = survey.pages.toList();
    for (var page in pages) {
      questions.addAll(page.questions);
    }
    questions.sort((a, b) => a.number.compareTo(b.number));
    return SingleChildScrollView(
      key: PageStorageKey<String>('summary_${survey.id}'),
      controller: isWebLayout ? scrollController : null,
      physics: isWebLayout ? NeverScrollableScrollPhysics() : null,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          _buildHeader(context, summary, color),
          const SizedBox(height: 24),

          // Executive Summary
          if (summary.summary.isNotEmpty) _buildSummary(color, summary.summary),
          const SizedBox(height: 24),

          ...questions.map((question) {
            switch (question.type) {
              case QuestionType.text:
                final textTheme = summary.textThemes.firstWhere(
                  (t) => t.questionId == question.id,
                );
                return _TextThemeCard(theme: textTheme, color: color);
              case QuestionType.number:
                final stat = summary.numberStats.firstWhere(
                  (e) => e.questionId == question.id,
                );
                return _NumberQuestionCard(stat: stat, color: color);
              case QuestionType.singleChoice:
              case QuestionType.multipleChoice:
                final stat = summary.choiceStats.firstWhere(
                  (e) => e.questionId == question.id,
                );
                return _ChoiceQuestionCard(
                  context: context,
                  stat: stat,
                  color: color,
                );
            }
          }),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    SurveySummary summary,
    Color color,
  ) {
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Survey Results',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
                _StatusBadge(status: summary.status.name),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildStatChip(
                  context,
                  Icons.people,
                  '${summary.totalResponses}',
                  'Responses',
                  // color,
                ),
                const SizedBox(width: 12),
                _buildStatChip(
                  context,
                  Icons.text_fields,
                  '${summary.processedTextAnswers}',
                  'Text Analyzed',
                  // color,
                ),
                if (summary.completedAt != null) ...[
                  const SizedBox(width: 12),
                  _buildStatChip(
                    context,
                    Icons.access_time,
                    DateFormat('MMM d').format(summary.completedAt!),
                    'Completed',
                    // color,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatChip(
    BuildContext context,
    IconData icon,
    String label,
    String sublabel,
    // Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 18),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              sublabel,
              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummary(Color color, String summary) {
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.auto_awesome, color: color, size: 20),
                const SizedBox(width: 8),
                const Text(
                  'Summary',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(summary, style: const TextStyle(fontSize: 14, height: 1.6)),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    switch (status.toLowerCase()) {
      case 'completed':
        bgColor = Colors.green.shade100;
        textColor = Colors.green.shade800;
        break;
      case 'failed':
        bgColor = Colors.red.shade100;
        textColor = Colors.red.shade800;
        break;
      default:
        bgColor = Colors.orange.shade100;
        textColor = Colors.orange.shade800;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _ChoiceQuestionCard extends StatelessWidget {
  final BuildContext context;
  final ChoiceStatModel stat;
  final Color color;
  const _ChoiceQuestionCard({
    required this.context,
    required this.stat,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: Card.filled(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stat.question,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${stat.totalAnswers} responses',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),
              Card.outlined(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                  child: Column(
                    children: [
                      ...stat.choices.map(
                        (choice) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      choice.text,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${choice.percent.toStringAsFixed(1)}%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: color,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: choice.percent / 100,
                                  backgroundColor: Theme.of(
                                    context,
                                  ).highlightColor,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    color,
                                  ),
                                  minHeight: 6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NumberQuestionCard extends StatelessWidget {
  final NumberStatModel stat;
  final Color color;
  const _NumberQuestionCard({required this.stat, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: Card.filled(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stat.question,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildStatBox(
                      'Average',
                      stat.average.toStringAsFixed(2),
                      Icons.analytics,
                      color,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatBox(
                      'Min',
                      stat.min?.toStringAsFixed(2) ?? '-',
                      Icons.arrow_downward,
                      Colors.red,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatBox(
                      'Max',
                      stat.max?.toStringAsFixed(2) ?? '-',
                      Icons.arrow_upward,
                      Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatBox(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[700])),
        ],
      ),
    );
  }
}

class _TextThemeCard extends StatelessWidget {
  final TextThemeModel theme;
  final Color color;
  const _TextThemeCard({required this.theme, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: Card.filled(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                theme.question,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${theme.processedAnswers} responses analyzed',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).hintColor,
                ),
              ),
              const SizedBox(height: 16),
              Card.outlined(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  child: Text(
                    theme.summary,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ),
              ),
              if (theme.clusters.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Text(
                  'Key Themes',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ...theme.clusters.map(
                  (cluster) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _ClusterCard(cluster: cluster, color: color),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ClusterCard extends StatelessWidget {
  final ClusterModel cluster;
  final Color color;
  const _ClusterCard({required this.cluster, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  cluster.label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${cluster.size}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (cluster.summary.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              cluster.summary,
              style: const TextStyle(fontSize: 13, height: 1.4),
            ),
          ],
          if (cluster.representativeTexts.isNotEmpty) ...[
            const SizedBox(height: 12),
            const Text(
              'Example responses:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 8),
            ...cluster.representativeTexts
                .take(3)
                .map(
                  (text) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• ', style: TextStyle(color: color)),
                        Expanded(
                          child: Text(
                            text,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[800],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ],
        ],
      ),
    );
  }
}
