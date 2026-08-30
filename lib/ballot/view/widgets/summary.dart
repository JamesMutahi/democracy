import 'package:democracy/ballot/models/summary.dart';
import 'package:flutter/material.dart';

class BallotSummaryWidget extends StatelessWidget {
  final BallotSummary summary;

  const BallotSummaryWidget({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Summary Section
          ...[
            const SizedBox(height: 24),
            if (summary.summary.isNotEmpty) _buildSummary(context, color),
            const SizedBox(height: 24),

            // Overall Themes
            if (summary.themes.isNotEmpty) ...[
              _buildSectionTitle('Overall Voter Themes'),
              const SizedBox(height: 16),
              ...summary.themes.map(
                (theme) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _BallotThemeCard(theme: theme, color: color),
                ),
              ),
              const SizedBox(height: 24),
            ],

            // Option Specific Themes
            if (summary.optionThemes.isNotEmpty) ...[
              _buildSectionTitle('Reasons by Option'),
              const SizedBox(height: 16),
              ...summary.optionThemes.map(
                (optTheme) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _OptionThemeGroupCard(
                    optTheme: optTheme,
                    color: color,
                  ),
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSummary(BuildContext context, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
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
          Text(
            summary.summary,
            style: const TextStyle(fontSize: 14, height: 1.6),
          ),
        ],
      ),
    );
  }
}

class _BallotThemeCard extends StatelessWidget {
  final BallotThemeModel theme;
  final Color color;
  const _BallotThemeCard({required this.theme, required this.color});

  // Helper to map sentiment to colors
  Color get _sentimentColor {
    switch (theme.sentiment.toLowerCase()) {
      case 'positive':
        return Colors.green;
      case 'negative':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  // Helper to map sentiment to icons
  IconData get _sentimentIcon {
    switch (theme.sentiment.toLowerCase()) {
      case 'positive':
        return Icons.sentiment_satisfied;
      case 'negative':
        return Icons.sentiment_dissatisfied;
      default:
        return Icons.sentiment_neutral;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  theme.name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Sentiment & Mentions Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _sentimentColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(_sentimentIcon, size: 20, color: _sentimentColor),
                    const SizedBox(width: 4),
                    Text(
                      '${theme.mentions}', // Updated field
                      style: TextStyle(
                        color: _sentimentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Examples
          if (theme.examples.isNotEmpty) ...[
            // Updated field
            const SizedBox(height: 12),
            ...theme.examples
                .take(3)
                .map(
                  (text) => Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '“',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            text,
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontStyle: FontStyle.italic,
                            ),
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

class _OptionThemeGroupCard extends StatelessWidget {
  final BallotOptionThemeModel optTheme;
  final Color color;
  const _OptionThemeGroupCard({required this.optTheme, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Updated to use optTheme.option directly
          Text(
            'For: ${optTheme.option}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 16),
          ...optTheme.themes.map(
            (theme) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _BallotThemeCard(theme: theme, color: color),
            ),
          ),
        ],
      ),
    );
  }
}
