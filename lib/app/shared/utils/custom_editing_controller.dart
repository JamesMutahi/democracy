import 'package:flutter/material.dart';

class CustomEditingController extends TextEditingController {
  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final spans = <TextSpan>[];
    // Matches both #hashtags and @mentions
    final regExp = RegExp(r'[@#][a-zA-Z0-9_]+');

    text.splitMapJoin(
      regExp,
      onMatch: (Match match) {
        final String matchedText = match.group(0)!;

        spans.add(
          TextSpan(
            text: matchedText,
            style:
                style?.copyWith(color: Colors.blueAccent) ??
                TextStyle(color: Colors.blueAccent),
          ),
        );
        return '';
      },
      onNonMatch: (String text) {
        spans.add(
          TextSpan(
            text: text,
            style: style ?? const TextStyle(color: Colors.black),
          ),
        );
        return '';
      },
    );

    return TextSpan(children: spans);
  }
}
