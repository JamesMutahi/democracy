import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/survey_process/page.dart';
import 'package:democracy/survey/view/survey_process/response_page.dart';
import 'package:flutter/material.dart';

class SurveyDetail extends StatelessWidget {
  const SurveyDetail({super.key, required this.survey});

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    bool surveyIsClosed =
        survey.endTime.difference(DateTime.now()) < Duration(seconds: 0);
    bool alreadyResponded = survey.response != null;
    return Scaffold(
      appBar: AppBar(title: Text(survey.name)),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(survey.description),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment:
                  surveyIsClosed
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: !surveyIsClosed,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => SurveyProcessPage(survey: survey),
                        ),
                      );
                    },
                    child: Text('Submit response'),
                  ),
                ),
                if (alreadyResponded)
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
