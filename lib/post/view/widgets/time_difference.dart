import 'dart:async';

import 'package:flutter/material.dart';

class TimeDifferenceInfo extends StatefulWidget {
  const TimeDifferenceInfo({super.key, required this.publishedAt});

  final DateTime publishedAt;

  @override
  State<TimeDifferenceInfo> createState() => _TimeDifferenceInfoState();
}

class _TimeDifferenceInfoState extends State<TimeDifferenceInfo> {
  Timer? timer;
  String timeSince = '';

  @override
  void initState() {
    super.initState();
    getTimeSince();
    timer = Timer.periodic(Duration(minutes: 1), (Timer t) => getTimeSince());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void getTimeSince() {
    Duration diff = DateTime.now().difference(widget.publishedAt);
    setState(() {
      var diffSeconds = diff.inSeconds;
      var unit = 's';
      var difference = diffSeconds;
      if (diffSeconds > 1 || diffSeconds < 1) {
        unit = 's';
      }
      if (diffSeconds > 59) {
        final diffMinutes = diff.inMinutes;
        difference = diffMinutes;
        unit = 'min';
        if (diffMinutes > 1) {
          unit = 'min';
        }
        if (diffMinutes > 59) {
          final diffHours = diff.inHours;
          difference = diffHours;
          unit = 'h';
          if (diffHours > 1) {
            unit = 'h';
          }
          if (diffHours > 24) {
            final diffDays = diff.inDays;
            difference = diffDays;
            unit = 'd';
            if (diffDays > 1) {
              unit = 'd';
            }
            if (diffDays > 30) {
              final diffMonths = (diffDays / 30).floor();
              difference = diffMonths;
              unit = 'm';
              if (diffMonths > 1) {
                unit = 'm';
              }
              if (diffDays > 365) {
                final diffYears = (diffDays / 365).floor();
                difference = diffYears;
                unit = 'y';
                if (diffYears > 1) {
                  unit = 'yrs';
                }
              }
            }
          }
        }
      }
      timeSince = '$difference$unit';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      timeSince,
      style: TextStyle(color: Theme.of(context).colorScheme.outline),
    );
  }
}
