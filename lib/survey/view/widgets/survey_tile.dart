import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/more_pop_up.dart';
import 'package:democracy/app/shared/widgets/share_bottom_sheet.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/ballot/view/widgets/ballot_tile.dart' show TimeLeft;
import 'package:democracy/geo/view/widgets/geo_chip.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:flutter/material.dart';

import 'package:material_symbols_icons/symbols.dart';

class SurveyTile extends StatelessWidget {
  const SurveyTile({
    super.key,
    required this.survey,
    required this.isDependency,
  });

  final Survey survey;
  final bool isDependency;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        if (survey.hasEnded) {
          context.router.push(SurveyDetail(surveyId: survey.id));
        } else {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            showDragHandle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => SurveyBottomSheet(survey: survey),
          );
        }
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: isDependency
                  ? colorScheme.surfaceContainerLow
                  : colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(12),
              border: isDependency
                  ? Border.all(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                    )
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        survey.hasEnded
                            ? Symbols.poll_rounded
                            : Symbols.how_to_vote_rounded,
                        color: colorScheme.onTertiary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (survey.hasEnded)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.errorContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Ended',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.onErrorContainer,
                                ),
                              ),
                            )
                          else
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Active',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (!isDependency) SurveyPopUpMenu(survey: survey),
                  ],
                ),

                const SizedBox(height: 12),

                // Location Chips
                if (survey.county != null) ...[
                  GeoChipRow(
                    county: survey.county,
                    constituency: survey.constituency,
                    ward: survey.ward,
                  ),
                  const SizedBox(height: 12),
                ],

                // Title
                Text(
                  survey.title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 12),

                // Footer with Time and Responses
                Row(
                  children: [
                    // Time Left
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            survey.hasEnded
                                ? Symbols.event_busy
                                : Symbols.schedule_rounded,
                            size: 16,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: TimeLeft(
                              key: ValueKey('survey_${survey.id}'),
                              startTime: survey.startTime,
                              endTime: survey.endTime,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Response Count
                    if (!isDependency)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surface.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Symbols.group_rounded,
                              size: 14,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${survey.totalResponses}',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SurveyPopUpMenu extends StatelessWidget {
  const SurveyPopUpMenu({super.key, required this.survey});

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    return MorePopUp(
      onSelected: (selected) {
        switch (selected) {
          case 'Post':
            context.router.push(PostCreate(survey: survey));
          case 'Share':
            showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => ShareBottomSheet(survey: survey),
            );
        }
      },
      texts: const ['Post', 'Share'],
    );
  }
}

class SurveyBottomSheet extends StatelessWidget {
  const SurveyBottomSheet({super.key, required this.survey});

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final alreadyResponded = survey.response != null;

    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            survey.title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),
          // Location
          if (survey.county != null) ...[
            GeoChipRow(
              county: survey.county,
              constituency: survey.constituency,
              ward: survey.ward,
            ),
            const SizedBox(height: 16),
          ],

          // Description
          Text(
            survey.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),

          const SizedBox(height: 20),

          // Stats Row
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Time Info
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        survey.hasEnded
                            ? Symbols.event_busy
                            : Symbols.schedule_rounded,
                        size: 20,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TimeLeft(
                          key: ValueKey('survey_${survey.id}'),
                          startTime: survey.startTime,
                          endTime: survey.endTime,
                        ),
                      ),
                    ],
                  ),
                ),

                // Response Count
                Row(
                  children: [
                    Icon(
                      Symbols.group_rounded,
                      size: 20,
                      color: colorScheme.tertiary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${survey.totalResponses} ${survey.totalResponses == 1 ? 'response' : 'responses'}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Action Buttons
          Row(
            children: [
              if (!survey.hasEnded)
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {
                      context.router.popTop();
                      context.router.push(SurveyProcess(surveyId: survey.id));
                    },
                    icon: const Icon(Symbols.edit_note_rounded),
                    label: const Text('Submit Response'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),

              if (!survey.hasEnded && alreadyResponded)
                const SizedBox(width: 12),

              if (alreadyResponded)
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: () {
                      context.router.popTop();
                      context.router.push(SurveyDetail(surveyId: survey.id));
                    },
                    icon: const Icon(Symbols.visibility_rounded),
                    label: const Text('View Response'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
