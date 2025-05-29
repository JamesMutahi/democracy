import 'package:democracy/app/survey/models/question.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question.text),
        SizedBox(height: 10),
        TextFormField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
        ),
      ],
    );
  }
}
