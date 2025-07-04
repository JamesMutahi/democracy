import 'dart:async';

import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/survey_process/page.dart';
import 'package:democracy/survey/view/survey_process/response_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SurveyTile extends StatelessWidget {
  const SurveyTile({super.key, required this.survey});

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    void openSurveyProcessPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SurveyProcessPage(survey: survey),
        ),
      );
    }

    return InkWell(
      onTap:
          survey.response != null
              ? null
              : () {
                openSurveyProcessPage();
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
            Text(survey.name, style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 5),
            SurveyTimeLeft(key: UniqueKey(), survey: survey),
            SizedBox(height: 5),
            Text(survey.description),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResponsePage(survey: survey),
                      ),
                    );
                  },
                  child: Text('View response'),
                ),
                OutlinedButton(
                  onPressed: () {
                    openSurveyProcessPage();
                  },
                  child: Text('Submit response'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SurveyTimeLeft extends StatefulWidget {
  const SurveyTimeLeft({super.key, required this.survey});

  final Survey survey;

  @override
  State<SurveyTimeLeft> createState() => _SurveyTimeLeftState();
}

class _SurveyTimeLeftState extends State<SurveyTimeLeft> {
  Timer? _timer;
  String timeLeft = '';
  bool outOfTime = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => getTimeLeft());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void getTimeLeft() {
    Duration diff = widget.survey.endTime.difference(DateTime.now());
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
        timeLeft = 'Ends in $difference $unit';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        outOfTime
            ? SizedBox.shrink()
            : Row(
              children: [
                SpinKitPulse(color: Theme.of(context).primaryColor, size: 15.0),
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
