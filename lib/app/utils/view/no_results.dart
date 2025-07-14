import 'package:flutter/material.dart';

class NoResults extends StatelessWidget {
  const NoResults({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.info_rounded, size: 50), Text(text)],
      ),
    );
  }
}
