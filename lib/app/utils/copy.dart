import 'package:democracy/app.dart' show navigatorKey;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

void copyLink(String className, int objectId) async {
  try {
    String baseUrl = dotenv.env['BASE_URL']!;
    String text = '$baseUrl$className/$objectId/';
    await Clipboard.setData(ClipboardData(text: text));
    showSuccessToast('Copied');
  } catch (e) {
    showFailureToast('Failed to copy link');
  }
}

void showSuccessToast(String text) {
  if (navigatorKey.currentContext != null) {
    FToast fToast = FToast();
    fToast.init(navigatorKey.currentContext!);

    fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(navigatorKey.currentContext!).canvasColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Symbols.content_copy, size: 20),
            SizedBox(width: 12),
            Text(text, style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}

void showFailureToast(String text) {
  if (navigatorKey.currentContext != null) {
    FToast()
        .init(navigatorKey.currentContext!)
        .showToast(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.red[700],
            ),
            child: Text(text, style: TextStyle(color: Colors.white)),
          ),
          gravity: ToastGravity.BOTTOM,
        );
  }
}
