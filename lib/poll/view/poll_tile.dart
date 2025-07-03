import 'dart:async';

import 'package:democracy/poll/models/option.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:democracy/poll/view/poll_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PollTile extends StatelessWidget {
  const PollTile({super.key, required this.poll});

  final Poll poll;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PollDetail(poll: poll)),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).disabledColor.withAlpha(30),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(poll.name, style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            SizedBox(height: 5),
            TimeLeft(poll: poll),
            SizedBox(height: 10),
            ...poll.options.map((option) {
              return PollPercentIndicator(poll: poll, option: option);
            }),
          ],
        ),
      ),
    );
  }
}

class TimeLeft extends StatefulWidget {
  const TimeLeft({super.key, required this.poll});

  final Poll poll;

  @override
  State<TimeLeft> createState() => _TimeLeftState();
}

class _TimeLeftState extends State<TimeLeft> {
  Timer? timer;
  String timeLeft = '';
  bool outOfTime = false;

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
    Duration diff = widget.poll.endTime.difference(DateTime.now());
    setState(() {
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
        outOfTime = true;
        timeLeft = 'Closed';
      } else {
        timeLeft = '$difference $unit';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            outOfTime
                ? SizedBox.shrink()
                : Row(
                  children: [
                    SpinKitPulse(
                      color: Theme.of(context).primaryColor,
                      size: 20.0,
                    ),
                    SizedBox(width: 5),
                  ],
                ),
            Text(
              timeLeft,
              style: TextStyle(color: Theme.of(context).disabledColor),
            ),
          ],
        ),
        Text(
          '${widget.poll.totalVotes} ${widget.poll.totalVotes == 1 ? 'vote' : 'votes'}',
          style: TextStyle(color: Theme.of(context).disabledColor),
        ),
      ],
    );
  }
}

class PollPercentIndicator extends StatelessWidget {
  const PollPercentIndicator({
    super.key,
    required this.poll,
    required this.option,
  });

  final Poll poll;
  final Option option;

  @override
  Widget build(BuildContext context) {
    double optionHeight = 40;
    return Container(
      key: UniqueKey(),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(const Radius.circular(8)),
      ),
      child: LinearPercentIndicator(
        lineHeight: optionHeight,
        barRadius: const Radius.circular(8),
        padding: EdgeInsets.zero,
        percent: poll.totalVotes == 0 ? 0 : option.votes / poll.totalVotes,
        animation: true,
        animationDuration: 300,
        backgroundColor: Theme.of(context).canvasColor,
        progressColor:
            poll.totalVotes == 0
                ? Theme.of(
                  context,
                ).colorScheme.onPrimaryFixedVariant.withValues(alpha: 0.0)
                : Theme.of(context).colorScheme.onPrimaryFixedVariant
                    .withValues(alpha: option.votes / poll.totalVotes),
        center: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Text(option.text),
              SizedBox(width: 20),
              if (poll.votedOption == option.id)
                const Icon(Icons.check_circle_outline_rounded, size: 16),
              const Spacer(),
              Text(
                poll.totalVotes == 0
                    ? "0 votes"
                    : '${(option.votes / poll.totalVotes * 100).toStringAsFixed(1)}%',
                // style: votedPercentageTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
