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
    bool pollHasEnded =
        poll.endTime.difference(DateTime.now()) < Duration(seconds: 0);
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
                pollHasEnded
                    ? SizedBox.shrink()
                    : Row(
                      children: [
                        SpinKitPulse(
                          color: Theme.of(context).primaryColor,
                          size: 10.0,
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                Text(poll.name, style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            SizedBox(height: 5),
            ...poll.options.map((option) {
              return PollPercentIndicator(poll: poll, option: option);
            }),
            Row(
              children: [
                // TODO: Fill in the blanks
                Text(
                  'Total votes: ${poll.totalVotes}',
                  style: TextStyle(color: Theme.of(context).disabledColor),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.circle_rounded,
                  size: 3,
                  color: Theme.of(context).disabledColor,
                ),
                SizedBox(width: 10),
                Text(
                  '5 days left',
                  style: TextStyle(color: Theme.of(context).disabledColor),
                ),
              ],
            ),
          ],
        ),
      ),
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
                const Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.black,
                  size: 16,
                ),
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
