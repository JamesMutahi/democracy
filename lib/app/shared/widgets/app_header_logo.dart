import 'package:democracy/app/shared/constants/variables.dart';
import 'package:flutter/material.dart';

class AppHeaderLogo extends StatelessWidget {
  const AppHeaderLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(logo, width: 100, height: 100),
        SizedBox(width: 15),
        Text(
          'People \nOf \nKenya',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}