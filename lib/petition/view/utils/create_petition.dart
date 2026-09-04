import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/petition/view/petition_create_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void createPetition({required BuildContext context}) {
  final responsive = ResponsiveBreakpoints.of(context);

  if (kIsWeb && responsive.largerThan(MOBILE)) {
    showDialog(
      context: context,
      builder: (context) => PetitionCreateWebDialog(),
    );
  } else {
    context.router.push(PetitionCreate());
  }
}
