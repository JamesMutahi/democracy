import 'package:democracy/app/poll/view/polls.dart';
import 'package:democracy/app/survey/view/surveys.dart';
import 'package:flutter/material.dart';

class BallotPage extends StatelessWidget {
  const BallotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card.outlined(
          color: Theme.of(context).disabledColor,
          child: InkWell(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Surveys()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Public Participation: Surveys'),
            ),
          ),
        ),
        Card.outlined(
          color: Theme.of(context).disabledColor,
          child: InkWell(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Polls()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Public Participation: Polls'),
            ),
          ),
        ),
      ],
    );
  }
}
