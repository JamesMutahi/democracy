import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum SnackBarStatus { loading, success, info, failure }

SnackBar getSnackBar({
  required BuildContext context,
  required String message,
  required SnackBarStatus status,
  String? actionLabel,
  VoidCallback? onActionPressed,
}) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: SnackBarContent(message: message, status: status),
    action:
        actionLabel == null
            ? null
            : SnackBarAction(
              label: actionLabel,
              textColor: Theme.of(context).disabledColor,
              onPressed: onActionPressed!,
            ),
  );
  return snackBar;
}

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
    Widget icon;
    switch (status) {
      case SnackBarStatus.success:
        icon = Icon(
          Icons.check_circle_rounded,
          color: Theme.of(context).primaryColor,
        );
      case SnackBarStatus.info:
        icon = const Icon(Icons.info_rounded, color: Colors.indigo);
      case SnackBarStatus.failure:
        icon = Icon(
          Icons.error_rounded,
          color: Theme.of(context).colorScheme.error,
        );
      case SnackBarStatus.loading:
        icon = SpinKitThreeInOut(
          color: Theme.of(context).primaryColor,
          size: 10.0,
        );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(message, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ),
      ],
    );
  }
}
