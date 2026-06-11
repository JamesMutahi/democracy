import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/utils/copy.dart';
import 'package:democracy/app/shared/pages/direct_message.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
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
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
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
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Symbols.close),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          ],
        ),
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
    this.broadcast,
    this.section,
  });

  final Post? post;
  final Ballot? ballot;
  final Survey? survey;
  final Petition? petition;
  final Broadcast? broadcast;
  final Section? section;

  @override
  Widget build(BuildContext context) {
    final String name = _getShareableName();
    final int id = _getShareableId();

    return CustomBottomSheet(
      title: 'Share $name',
      children: [
        CustomBottomSheetContainer(
          text: 'Send via Direct Message',
          iconData: Symbols.email_rounded,
          onTap: () {
            context.router.popTop();
            showModalBottomSheet(
              context: context,
              showDragHandle: true,
              isScrollControlled: true,
              useSafeArea: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: const BeveledRectangleBorder(),
              builder: (context) => DirectMessage(
                post: post,
                ballot: ballot,
                survey: survey,
                petition: petition,
                broadcast: broadcast,
                section: section,
              ),
            );
          },
        ),
        SizedBox(height: 5),
        Row(
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () async {
                context.router.popTop();
                String path = '$name/$id/';
                if (section != null) {
                  path = 'constitution?id=$id';
                }
                copyLink(navigatorKey: context.router.navigatorKey, path: path);
              },
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(Icons.link_rounded),
                    ),
                  ),
                  Text('Copy link'),
                ],
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () async {
                context.router.popTop();
                context.router.push(
                  PostCreateRoute(
                    ballot: ballot,
                    survey: survey,
                    petition: petition,
                    broadcast: broadcast,
                    section: section,
                  ),
                );
              },
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(Icons.post_add),
                    ),
                  ),
                  Text('Post'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getShareableName() {
    if (post != null) return 'post';
    if (ballot != null) return 'ballot';
    if (survey != null) return 'survey';
    if (broadcast != null) {
      switch (broadcast!.type) {
        case BroadcastType.meeting:
          return 'meeting';
        case BroadcastType.livestream:
          return 'livestream';
      }
    }
    if (petition != null) return 'petition';
    if (section != null) return 'section';
    throw StateError('ShareBottomSheet: No shareable item provided');
  }

  int _getShareableId() {
    if (post != null) return post!.id;
    if (ballot != null) return ballot!.id;
    if (survey != null) return survey!.id;
    if (broadcast != null) return broadcast!.id;
    if (petition != null) return petition!.id;
    if (section != null) return section!.id;
    throw StateError('ShareBottomSheet: No shareable item provided');
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
