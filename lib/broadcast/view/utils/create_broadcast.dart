import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/view/broadcast_create_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void createBroadcast({
  required BuildContext context,
  required BroadcastType type,
}) {
  final responsive = ResponsiveBreakpoints.of(context);

  if (kIsWeb && responsive.largerThan(MOBILE)) {
    showDialog(
      context: context,
      builder: (context) =>
          BroadcastCreateWebDialog(type: BroadcastTypeConverter().toJson(type)),
    );
  } else {
    context.router.push(
      BroadcastCreate(type: BroadcastTypeConverter().toJson(type)),
    );
  }
}
