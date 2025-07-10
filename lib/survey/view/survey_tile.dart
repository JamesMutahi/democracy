import 'package:democracy/app/utils/view/more_pop_up.dart';
import 'package:democracy/app/utils/view/share_bottom_sheet.dart';
import 'package:democracy/poll/view/poll_tile.dart' show TimeLeft;
import 'package:democracy/post/view/post_create.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/survey_process/page.dart';
import 'package:democracy/survey/view/survey_process/response_page.dart';
import 'package:flutter/material.dart';

class SurveyTile extends StatelessWidget {
  const SurveyTile({
    super.key,
    required this.survey,
    required this.isChildOfPost,
  });

  final Survey survey;
  final bool isChildOfPost;

  @override
  Widget build(BuildContext context) {
    bool surveyIsClosed =
        survey.endTime.difference(DateTime.now()) < Duration(seconds: 0);
    bool alreadyResponded = survey.response != null;
    void openSurveyProcessPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SurveyProcessPage(survey: survey),
        ),
      );
    }

    List<Widget> surveyButtons = [
      Visibility(
        visible: !surveyIsClosed,
        child: OutlinedButton(
          onPressed: () {
            openSurveyProcessPage();
          },
          child: Text('Submit response'),
        ),
      ),
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
    ];

    return InkWell(
      onTap:
          alreadyResponded
              ? () {}
              : () {
                openSurveyProcessPage();
              },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color:
                  isChildOfPost
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
                  survey.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                isChildOfPost
                    ? SizedBox.shrink()
                    : MorePopUp(
                      onSelected: (selected) {
                        switch (selected) {
                          case 'Post':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => PostCreate(survey: survey),
                              ),
                            );
                          case 'Share':
                            showModalBottomSheet<void>(
                              context: context,
                              shape: const BeveledRectangleBorder(),
                              builder: (BuildContext context) {
                                return ShareBottomSheet(survey: survey);
                              },
                            );
                        }
                      },
                      texts: ['Post', 'Share'],
                    ),
              ],
            ),
            SizedBox(height: 5),
            TimeLeft(
              key: ValueKey(survey),
              startTime: survey.startTime,
              endTime: survey.endTime,
            ),
            SizedBox(height: 5),
            Text(survey.description),
            SizedBox(height: 10),
            isChildOfPost
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: surveyButtons,
                )
                : alreadyResponded
                ? Row(
                  mainAxisAlignment:
                      surveyIsClosed
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.spaceBetween,
                  children: surveyButtons,
                )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
