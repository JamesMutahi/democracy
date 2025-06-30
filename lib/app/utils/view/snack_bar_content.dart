import 'package:flutter/material.dart';

enum SnackBarStatus { success, info, failure }

class SnackBarContent extends StatelessWidget {
  const SnackBarContent({
    super.key,
    required this.message,
    required this.status,
  });

  final String message;
  final SnackBarStatus status;

  @override
  Widget build(BuildContext context) {
    Icon icon;
    switch (status) {
      case SnackBarStatus.success:
        icon = Icon(
          Icons.check_circle_rounded,
          color: Theme.of(context).primaryColor,
        );
        break;
      case SnackBarStatus.info:
        icon = const Icon(Icons.info_rounded, color: Colors.indigo);
        break;
      case SnackBarStatus.failure:
        icon = Icon(
          Icons.error_rounded,
          color: Theme.of(context).colorScheme.error,
        );
        break;
    }
    return Center(
      child: Row(
        children: [
          icon,
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
