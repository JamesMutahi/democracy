import 'package:democracy/app/shared/widgets/logo.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size = 150.0});

  final double size;

  @override
  Widget build(BuildContext context) {
    final displayStyle = Theme.of(context).textTheme.displayMedium;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Logo(width: size, height: size),

        RichText(
          text: TextSpan(
            style: displayStyle?.copyWith(
              height: 1.1,
              letterSpacing: -1.5,
              fontWeight: FontWeight.w600,
            ),
            children: [
              const TextSpan(text: 'People\n'),
              const TextSpan(text: 'of\n'),
              const TextSpan(text: 'Kenya'),
            ],
          ),
        ),
      ],
    );
  }
}
