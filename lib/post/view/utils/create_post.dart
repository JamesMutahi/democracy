import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_create_web.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void createPost({
  required BuildContext context,
  Post? replyTo,
  Post? repostOf,
  Ballot? ballot,
  Survey? survey,
  Petition? petition,
  Broadcast? broadcast,
  Section? section,
}) {
  final responsive = ResponsiveBreakpoints.of(context);

  if (kIsWeb && responsive.largerThan(MOBILE)) {
    showDialog(
      context: context,
      builder: (context) => PostCreateWebDialog(
        replyTo: replyTo,
        repostOf: repostOf,
        ballot: ballot,
        survey: survey,
        petition: petition,
        broadcast: broadcast,
        section: section,
      ),
    );
  } else {
    context.router.push(
      PostCreateRoute(
        replyTo: replyTo,
        repostOf: repostOf,
        ballot: ballot,
        survey: survey,
        petition: petition,
        broadcast: broadcast,
        section: section,
      ),
    );
  }
}
