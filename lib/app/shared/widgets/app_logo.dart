import 'package:democracy/app/shared/widgets/logo.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Logo(width: 120, height: 120),
        SizedBox(width: 15),
        Text(
          'People \nOf \nKenya',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
