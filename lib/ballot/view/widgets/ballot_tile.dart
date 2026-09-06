import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/more_pop_up.dart';
import 'package:democracy/app/shared/widgets/share_bottom_sheet.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/models/option.dart';
import 'package:democracy/geo/view/widgets/geo_chip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BallotTile extends StatelessWidget {
  const BallotTile({
    super.key,
    required this.ballot,
    required this.isDependency,
    this.animateToInitialPercent = false,
  });

  final Ballot ballot;
  final bool isDependency;
  final bool animateToInitialPercent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isClosed = DateTime.now().isAfter(ballot.endTime);

    return GestureDetector(
      onTap: () => context.router.push(BallotDetail(ballotId: ballot.id)),
      child: Container(
        decoration: BoxDecoration(
          color: isDependency
              ? colorScheme.surfaceContainerLow
              : colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: isDependency
              ? Border.all(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                )
              : null,
          boxShadow: isDependency
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header: Status Icon & Popup
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isClosed
                          ? colorScheme.errorContainer
                          : colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      isClosed
                          ? Icons.lock_clock_rounded
                          : Icons.how_to_vote_rounded,
                      color: isClosed
                          ? colorScheme.onErrorContainer
                          : colorScheme.onPrimaryContainer,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isClosed ? 'Closed' : 'Active',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: isClosed
                                ? colorScheme.onErrorContainer
                                : colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!isDependency) BallotPopUp(ballot: ballot),
                ],
              ),
            ),

            // 2. Location Chips
            if (ballot.county != null) ...[
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GeoChipRow(
                  county: ballot.county,
                  constituency: ballot.constituency,
                  ward: ballot.ward,
                ),
              ),
            ],

            // 3. Title
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Text(
                ballot.title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // 4. Meta Row (Time & Votes)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TimeLeft(
                      key: ValueKey('ballot_${ballot.id}'),
                      startTime: ballot.startTime,
                      endTime: ballot.endTime,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.how_to_vote_outlined,
                          size: 14,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          NumberFormat.compact().format(ballot.totalVotes),
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
            ),

            // 5. Voting Options
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                children: ballot.options.map((option) {
                  return BallotPercentIndicator(
                    key: ValueKey('option_${option.id}'),
                    ballot: ballot,
                    option: option,
                    animateToInitialPercent: animateToInitialPercent,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Ballot Percent Indicator
// -----------------------------------------------------------------------------

class BallotPercentIndicator extends StatelessWidget {
  const BallotPercentIndicator({
    super.key,
    required this.ballot,
    required this.option,
    required this.animateToInitialPercent,
  });

  final Ballot ballot;
  final Option option;
  final bool animateToInitialPercent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isVoted = ballot.votedOption == option.id;
    final percent = ballot.totalVotes == 0
        ? 0.0
        : option.votes / ballot.totalVotes;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: isVoted
            ? Border.all(color: colorScheme.primary, width: 1.5)
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: LinearPercentIndicator(
        lineHeight: 52,
        padding: EdgeInsets.zero,
        percent: percent,
        animation: animateToInitialPercent,
        animationDuration: 600,
        backgroundColor: colorScheme.surfaceContainerHighest,
        progressColor: isVoted
            ? colorScheme.primary.withValues(alpha: 0.15)
            : colorScheme.primary.withValues(alpha: 0.08),
        barRadius: const Radius.circular(12),
        center: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  option.text,
                  style: TextStyle(
                    fontWeight: isVoted ? FontWeight.w600 : FontWeight.normal,
                    color: colorScheme.onSurface,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isVoted) ...[
                const SizedBox(width: 8),
                Icon(
                  Icons.check_circle_rounded,
                  color: colorScheme.primary,
                  size: 20,
                ),
              ],
              const SizedBox(width: 12),
              Text(
                ballot.totalVotes == 0
                    ? '0%'
                    : '${(percent * 100).toStringAsFixed(1)}%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Time Left Badge
// -----------------------------------------------------------------------------

class TimeLeft extends StatefulWidget {
  const TimeLeft({super.key, required this.startTime, required this.endTime});

  final DateTime startTime;
  final DateTime endTime;

  @override
  State<TimeLeft> createState() => _TimeLeftState();
}

class _TimeLeftState extends State<TimeLeft> {
  Timer? _timer;
  String _displayText = '';
  String _status = 'upcoming'; // 'upcoming', 'active', or 'closed'

  @override
  void initState() {
    super.initState();
    _updateTime();
    // 🚨 OPTIMIZATION: Update every 30 seconds instead of 1 second to save battery/CPU
    _timer = Timer.periodic(const Duration(seconds: 30), (_) => _updateTime());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    if (!mounted) return;

    final now = DateTime.now();

    if (now.isBefore(widget.startTime)) {
      final diff = widget.startTime.difference(now);
      setState(() {
        _displayText = _formatDuration(diff, 'Opens');
        _status = 'upcoming';
      });
    } else if (now.isBefore(widget.endTime)) {
      final diff = widget.endTime.difference(now);
      setState(() {
        _displayText = _formatDuration(diff, 'Closes');
        _status = 'active';
      });
    } else {
      setState(() {
        _displayText = 'Closed';
        _status = 'closed';
      });
      _timer?.cancel(); // Stop timer once closed
    }
  }

  String _formatDuration(Duration duration, String prefix) {
    if (duration.inDays > 365) {
      final years = (duration.inDays / 365).floor();
      return '$prefix in $years ${years == 1 ? "year" : "years"}';
    }
    if (duration.inDays > 30) {
      final months = (duration.inDays / 30).floor();
      return '$prefix in $months ${months == 1 ? "month" : "months"}';
    }
    if (duration.inDays > 0) {
      final days = duration.inDays;
      return '$prefix in $days ${days == 1 ? "day" : "days"}';
    }
    if (duration.inHours > 0) {
      final hours = duration.inHours;
      return '$prefix in $hours ${hours == 1 ? "hour" : "hours"}';
    }
    if (duration.inMinutes > 0) {
      final minutes = duration.inMinutes;
      return '$prefix in $minutes ${minutes == 1 ? "minute" : "minutes"}';
    }
    return '$prefix in ${duration.inSeconds} seconds';
  }

  @override
  Widget build(BuildContext context) {
    // 🚨 FIX: Theme lookup now happens safely inside build()
    final colorScheme = Theme.of(context).colorScheme;

    Color textColor;
    IconData icon;

    switch (_status) {
      case 'upcoming':
        textColor = colorScheme.tertiary;
        icon = Icons.schedule_rounded;
        break;
      case 'active':
        textColor = colorScheme.primary;
        icon = Icons.timer_rounded;
        break;
      case 'closed':
      default:
        textColor = colorScheme.error;
        icon = Icons.lock_clock_rounded;
        break;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: textColor),
        const SizedBox(width: 6),
        Text(
          _displayText,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class BallotPopUp extends StatelessWidget {
  const BallotPopUp({super.key, required this.ballot});

  final Ballot ballot;

  @override
  Widget build(BuildContext context) {
    return MorePopUp(
      onSelected: (selected) {
        switch (selected) {
          case 'Post':
            context.router.push(PostCreate(ballot: ballot));
          case 'Share':
            showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => ShareBottomSheet(ballot: ballot),
            );
        }
      },
      texts: const ['Post', 'Share'],
    );
  }
}
