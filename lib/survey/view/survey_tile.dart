import 'package:democracy/app/utils/custom_bottom_sheet.dart';
import 'package:democracy/app/utils/more_pop_up.dart';
import 'package:democracy/ballot/view/ballot_tile.dart' show TimeLeft;
import 'package:democracy/post/view/post_create.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/survey_detail.dart';
import 'package:flutter/material.dart';

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
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SurveyDetail(survey: survey)),
        );
      },
      child: Stack(
        children: [
          Container(
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
                Container(
                  margin: EdgeInsets.only(right: isDependency ? 0 : 20),
                  child: Text(
                    survey.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeLeft(
                      key: ValueKey(survey),
                      startTime: survey.startTime,
                      endTime: survey.endTime,
                    ),
                    if (!isDependency)
                      Text(
                        '${survey.totalResponses} ${survey.totalResponses == 1 ? 'response' : 'responses'}',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (!isDependency)
            Align(
              alignment: Alignment.topRight,
              child: SurveyPopUpMenu(survey: survey),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostCreate(survey: survey),
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
    );
  }
}
