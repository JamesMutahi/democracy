import 'package:flutter/material.dart';

class ThreadLine extends StatelessWidget {
  const ThreadLine({
    super.key,
    required this.showBottomThread,
    required this.showTopThread,
  });

  final bool showBottomThread;
  final bool showTopThread;

  @override
  Widget build(BuildContext context) {
    return !showBottomThread && !showTopThread
        ? SizedBox.shrink()
        : Positioned(
            // 23 -> circle avatar radius, 10 -> margin
            left: 23 + 10,
            top: 0,
            bottom: showBottomThread ? 0 : null,
            child: Container(
              margin: showTopThread ? null : EdgeInsets.only(top: 20),
              height: showBottomThread ? null : 20,
              width: 1.5,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          );
  }
}
