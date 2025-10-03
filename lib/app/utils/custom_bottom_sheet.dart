import 'package:democracy/app/utils/direct_message.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Center(
        child: Container(
          height: 5,
          width: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outlineVariant,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).disabledColor.withAlpha(30),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Symbols.close),
            ),
          ],
        ),
      ),
    ];
    widgets.addAll(children);
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
    );
  }
}

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({
    super.key,
    this.post,
    this.ballot,
    this.survey,
    this.petition,
    this.meeting,
  });

  final Post? post;
  final Ballot? ballot;
  final Survey? survey;
  final Petition? petition;
  final Meeting? meeting;

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title:
          post == null
              ? ballot == null
                  ? 'Share survey'
                  : 'Share ballot'
              : 'Share post',
      children: [
        CustomBottomSheetContainer(
          text: 'Send via Direct Message',
          iconData: Symbols.email_rounded,
          onTap: () {
            Navigator.pop(context);
            showModalBottomSheet(
              context: context,
              showDragHandle: true,
              isScrollControlled: true,
              useSafeArea: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: const BeveledRectangleBorder(),
              builder:
                  (context) => DirectMessage(
                    post: post,
                    ballot: ballot,
                    survey: survey,
                    petition: petition,
                    meeting: meeting,
                  ),
            );
          },
        ),
      ],
    );
  }
}

class CustomBottomSheetContainer extends StatelessWidget {
  const CustomBottomSheetContainer({
    super.key,
    required this.text,
    required this.iconData,
    required this.onTap,
  });

  final String text;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).disabledColor.withAlpha(30),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(text), Icon(iconData)],
          ),
        ),
      ),
    );
  }
}
