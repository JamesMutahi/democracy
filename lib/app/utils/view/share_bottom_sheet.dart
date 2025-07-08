import 'package:democracy/app/utils/view/direct_message.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key, this.post, this.poll, this.survey});

  final Post? post;
  final Poll? poll;
  final Survey? survey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                post == null
                    ? poll == null
                        ? 'Share survey'
                        : 'Share poll'
                    : 'Share post',
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Symbols.close),
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Symbols.email_rounded),
              title: Text('Send via Direct Message'),
              onTap: () {
                Navigator.of(context).pop();
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  isScrollControlled: true,
                  useSafeArea: true,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  shape: const BeveledRectangleBorder(),
                  builder:
                      (context) =>
                          DirectMessage(post: post, poll: poll, survey: survey),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
