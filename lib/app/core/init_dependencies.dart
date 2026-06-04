import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/token_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/post/models/draft_post.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

Future<String> getRelease() async {
  final info = await PackageInfo.fromPlatform();

  String appName = info.appName;
  String version = info.version;
  String buildNumber = info.buildNumber;

  return '$appName@$version+$buildNumber';
}

class MyTalkerObserver extends TalkerObserver {
  @override
  void onError(TalkerError err) {
    Sentry.captureException(
      err.error,
      stackTrace: err.stackTrace,
      withScope: (scope) => scope.setTag('type', 'talker_error'),
    );
    super.onError(err);
  }

  @override
  void onException(TalkerException err) {
    Sentry.captureException(
      err.exception,
      stackTrace: err.stackTrace,
      withScope: (scope) => scope.setTag('type', 'talker_exception'),
    );
    super.onException(err);
  }

  @override
  void onLog(TalkerData log) {
    // Send logs as "Breadcrumbs" so Sentry shows the path leading to a crash
    Sentry.addBreadcrumb(
      Breadcrumb(
        message: log.generateTextMessage(),
        level: _mapLogLevel(log.logLevel),
        category: 'talker_log',
      ),
    );
    super.onLog(log);
  }

  // Helper to sync Talker levels with Sentry levels
  SentryLevel _mapLogLevel(LogLevel? level) {
    switch (level) {
      case LogLevel.critical:
        return SentryLevel.fatal;
      case LogLevel.error:
        return SentryLevel.error;
      case LogLevel.warning:
        return SentryLevel.warning;
      case LogLevel.info:
        return SentryLevel.info;
      case LogLevel.debug:
      case LogLevel.verbose:
      case null:
        return SentryLevel.debug;
    }
  }
}

TalkerSettings getTalkerSettings() {
  return TalkerSettings(
    enabled: true,
    useHistory: true,
    maxHistoryItems: 200,
    useConsoleLogs: kDebugMode,
  );
}

class SentryTalkerBlocObserver extends TalkerBlocObserver {
  SentryTalkerBlocObserver({
    required super.talker,
    required super.settings,
  });

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // 1. Maintain local logging via Talker
    super.onError(bloc, error, stackTrace);

    // 2. Filter out noisy blocs from Sentry (reusing your logic)
    final blocName = bloc.runtimeType.toString();
    if (_isNoisyBloc(blocName)) return;

    // 3. Automatically send unhandled errors to Sentry
    Sentry.captureException(
      error,
      stackTrace: stackTrace,
      withScope: (scope) {
        scope.setTag('bloc', blocName);
      },
    );
  }
}

TalkerBlocLoggerSettings getBlocLogSettings() {
  return TalkerBlocLoggerSettings(
    // Core control
    enabled: kDebugMode,

    // What to print
    printEvents: true,
    printTransitions: true,
    printChanges: false,
    printCreations: false,
    printClosings: false,

    // How much detail to show
    printEventFullData: true,
    printStateFullData: true,

    // Filters - Very Important for clean logs
    eventFilter: (bloc, event) {
      // Skip noisy low-level blocs
      final blocName = bloc.runtimeType.toString();
      return !_isNoisyBloc(blocName);
    },

    transitionFilter: (bloc, transition) {
      final blocName = bloc.runtimeType.toString();
      return !_isNoisyBloc(blocName);
    },
  );
}

// Helper to define noisy blocs
bool _isNoisyBloc(String blocName) {
  const noisyBlocs = ['ConnectivityBloc'];
  return noisyBlocs.contains(blocName);
}

Future<void> initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DraftPostAdapter());
  Hive.registerAdapter(ChatAdapter());
  Hive.registerAdapter(MessageAdapter());
}

class MyNetworkClient {
  static Dio create(Talker talker, TokenStorage tokenStorage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: const String.fromEnvironment('BASE_URL'),
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        validateStatus: (status) {
          return status != null && status >= 200 && status < 300;
        },
      ),
    );

    // Add the Talker Logger
    // Network logging only in Debug (to avoid leaking sensitive data in production)
    if (kDebugMode) {
      dio.interceptors.add(
        TalkerDioLogger(
          talker: talker,
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printRequestData: true,
            printResponseHeaders: true,
            printResponseMessage: true,
            printResponseData: true,
          ),
        ),
      );
    }

    return dio;
  }
}
