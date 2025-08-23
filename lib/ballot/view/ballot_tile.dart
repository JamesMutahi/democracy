import 'dart:async';

import 'package:democracy/app/utils/view/custom_bottom_sheet.dart';
import 'package:democracy/app/utils/view/more_pop_up.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/models/option.dart';
import 'package:democracy/ballot/view/ballot_detail.dart';
import 'package:democracy/post/view/post_create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    bool ballotHasStarted =
        ballot.startTime.difference(DateTime.now()) < Duration(seconds: 0);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BallotDetail(ballot: ballot)),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color:
                  isDependency
                      ? Colors.transparent
                      : Theme.of(context).disabledColor.withAlpha(30),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ballot.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                isDependency ? SizedBox.shrink() : BallotPopUp(ballot: ballot),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeLeft(
                  key: ValueKey('ballot ${ballot.id}'),
                  startTime: ballot.startTime,
                  endTime: ballot.endTime,
                ),
                isDependency
                    ? SizedBox.shrink()
                    : ballotHasStarted
                    ? Text(
                      '${ballot.totalVotes} ${ballot.totalVotes == 1 ? 'vote' : 'votes'}',
                      style: TextStyle(color: Theme.of(context).disabledColor),
                    )
                    : SizedBox.shrink(),
              ],
            ),
            SizedBox(height: 10),
            ...ballot.options.map((option) {
              return BallotPercentIndicator(
                key: UniqueKey(),
                ballot: ballot,
                option: option,
                animateToInitialPercent: animateToInitialPercent,
              );
            }),
          ],
        ),
      ),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostCreate(ballot: ballot),
              ),
            );
          case 'Share':
            showModalBottomSheet<void>(
              context: context,
              shape: const BeveledRectangleBorder(),
              builder: (BuildContext context) {
                return ShareBottomSheet(ballot: ballot);
              },
            );
        }
      },
      texts: ['Post', 'Share'],
    );
  }
}

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
    double optionHeight = 40;
    double percent =
        ballot.totalVotes == 0 ? 0 : option.votes / ballot.totalVotes;
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(const Radius.circular(8)),
      ),
      child: LinearPercentIndicator(
        lineHeight: optionHeight,
        barRadius: const Radius.circular(8),
        padding: EdgeInsets.zero,
        percent: percent,
        animation: true,
        animateFromLastPercent: true,
        animateToInitialPercent: animateToInitialPercent,
        animationDuration: 500,
        backgroundColor: Theme.of(
          context,
        ).colorScheme.secondaryFixedDim.withValues(alpha: 0.3),
        progressColor:
            ballot.totalVotes == 0
                ? Theme.of(
                  context,
                ).colorScheme.primaryFixedDim.withValues(alpha: 0.0)
                : Theme.of(context).colorScheme.primaryFixedDim.withValues(
                  alpha: (option.votes / ballot.totalVotes) / 2,
                ),
        center: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Text(option.text),
              SizedBox(width: 20),
              if (ballot.votedOption == option.id)
                const Icon(Icons.check_circle_outline_rounded, size: 16),
              const Spacer(),
              Text(
                ballot.totalVotes == 0
                    ? "0 votes"
                    : '${(option.votes / ballot.totalVotes * 100).toStringAsFixed(1)}%',
                // style: votedPercentageTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeLeft extends StatefulWidget {
  const TimeLeft({
    super.key,
    required this.startTime,
    required this.endTime,
    this.alignCenter = false,
  });

  final DateTime startTime;
  final DateTime endTime;
  final bool alignCenter;

  @override
  State<TimeLeft> createState() => _TimeLeftState();
}

class _TimeLeftState extends State<TimeLeft> {
  Timer? timer;
  String timeLeft = '';
  Color color = Colors.transparent;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => getTimeLeft());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void getTimeLeft() {
    Duration diff = widget.startTime.difference(DateTime.now());
    bool started = false;
    if (diff.inSeconds < 0) {
      diff = widget.endTime.difference(DateTime.now());
      started = true;
    }
    setState(() {
      if (started) {
        color = Colors.green;
      } else {
        color = Colors.amber;
      }
      var diffSeconds = diff.inSeconds;
      var unit = 'second';
      var difference = diffSeconds;
      if (diffSeconds > 1 || diffSeconds < 1) {
        unit = 'seconds';
      }
      if (diffSeconds > 59) {
        final diffMinutes = diff.inMinutes;
        difference = diffMinutes;
        unit = 'minute';
        if (diffMinutes > 1) {
          unit = 'minutes';
        }
        if (diffMinutes > 59) {
          final diffHours = diff.inHours;
          difference = diffHours;
          unit = 'hour';
          if (diffHours > 1) {
            unit = 'hours';
          }
          if (diffHours > 24) {
            final diffDays = diff.inDays;
            difference = diffDays;
            unit = 'day';
            if (diffDays > 1) {
              unit = 'days';
            }
            if (diffDays > 30) {
              final diffMonths = (diffDays / 30).floor();
              difference = diffMonths;
              unit = 'month';
              if (diffMonths > 1) {
                unit = 'months';
              }
              if (diffDays > 365) {
                final diffYears = (diffDays / 365).floor();
                difference = diffYears;
                unit = 'year';
                if (diffYears > 1) {
                  unit = 'years';
                }
              }
            }
          }
        }
      }
      if (diffSeconds < 0) {
        if (started) {
          timeLeft = 'Closed';
          color = Colors.red;
        }
      } else {
        timeLeft = '${started ? 'Closes' : 'Opens'} in $difference $unit';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          widget.alignCenter
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
      children: [
        Row(
          children: [
            SpinKitPianoWave(color: color, size: 15.0),
            SizedBox(width: 5),
          ],
        ),
        Text(
          timeLeft,
          style: TextStyle(color: Theme.of(context).disabledColor),
        ),
      ],
    );
  }
}
