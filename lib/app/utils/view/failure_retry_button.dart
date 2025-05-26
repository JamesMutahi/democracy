import 'package:flutter/material.dart';

class FailureRetryButton extends StatelessWidget {
  const FailureRetryButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: onPressed,
        child: const Text('Retry'),
      ),
    );
  }
}
