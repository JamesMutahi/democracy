import 'package:democracy/poll/view/polls.dart';
import 'package:democracy/survey/view/surveys.dart';
import 'package:flutter/material.dart';

class PollPage extends StatelessWidget {
  const PollPage({super.key});

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
