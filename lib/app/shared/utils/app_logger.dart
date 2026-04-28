import 'package:flutter/foundation.dart';
import 'package:talker/talker.dart';

class AppLogger {
  static late final Talker talker;

  static void init(Talker instance) {
    talker = instance;
  }

  // Convenient shortcuts
  static void debug(String message, [dynamic error, StackTrace? stack]) =>
      talker.debug(message, error, stack);

  static void info(String message, [dynamic error, StackTrace? stack]) =>
      talker.info(message, error, stack);

  static void warning(String message, [dynamic error, StackTrace? stack]) =>
      talker.warning(message, error, stack);

  static void error(String message, [dynamic error, StackTrace? stack]) =>
      talker.error(message, error, stack);

  static void critical(String message, [dynamic error, StackTrace? stack]) =>
      talker.critical(message, error, stack);

  // === Bloc-specific helpers ===
  static void blocEvent(String blocName, dynamic event) {
    if (kDebugMode) {
      talker.debug('[$blocName] Event → $event');
    }
  }

  static void blocState(String blocName, dynamic state) {
    if (kDebugMode) {
      talker.debug('[$blocName] State  ← $state');
    }
  }

  static void blocError(
    String blocName,
    String message,
    dynamic error, [
    StackTrace? stack,
  ]) {
    talker.error('[$blocName] $message', error, stack);
  }

  // For raw Talker usage when needed
  static Talker get instance => talker;
}
