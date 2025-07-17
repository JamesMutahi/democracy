import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum SnackBarStatus { loading, success, info, failure }

SnackBar getSnackBar({
  required BuildContext context,
  required String message,
  required SnackBarStatus status,
}) {
  final snackBar = SnackBar(
    // dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Theme.of(context).cardColor,
    margin: EdgeInsets.only(
      // bottom: MediaQuery.of(context).size.height - 100,
      left: 10,
      right: 10,
    ),
    content: SnackBarContent(
      message: message,
      status: status,
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
