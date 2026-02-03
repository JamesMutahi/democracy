import 'dart:async';

import 'package:democracy/app/utils/custom_bottom_sheet.dart';
import 'package:democracy/app/utils/more_pop_up.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/models/option.dart';
import 'package:democracy/ballot/view/ballot_detail.dart';
import 'package:democracy/geo/view/widgets/geo_chip.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BallotDetail(ballot: ballot)),
        );
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: isDependency
                  ? Colors.transparent
                  : Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (ballot.county != null)
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: GeoChipRow(
                      county: ballot.county,
                      constituency: ballot.constituency,
                      ward: ballot.ward,
                    ),
                  ),
                Container(
                  margin: EdgeInsets.only(right: isDependency ? 0 : 20),
                  child: Text(
                    ballot.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
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
                    if (!isDependency)
                      Text(
                        '${ballot.totalVotes} ${ballot.totalVotes == 1 ? 'vote' : 'votes'}',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
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
          if (!isDependency)
            Align(
              alignment: Alignment.topRight,
              child: BallotPopUp(ballot: ballot),
            ),
        ],
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
    double percent = ballot.totalVotes == 0
        ? 0
        : option.votes / ballot.totalVotes;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
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
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        progressColor: ballot.totalVotes == 0
            ? Colors.blue.withValues(alpha: 0.0)
            : Colors.blue.withValues(
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
      mainAxisAlignment: widget.alignCenter
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
