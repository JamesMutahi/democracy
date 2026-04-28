import 'package:democracy/app/bloc/services/token_storage.dart';
import 'package:democracy/post/models/draft_post.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

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

// lib/app/shared/utils/init_dependencies.dart

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
    printEventFullData: false,
    printStateFullData: false,

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

// Helper to define noisy blocs (easy to maintain)
bool _isNoisyBloc(String blocName) {
  const noisyBlocs = ['BottomNavBarCubit', 'ConnectivityBloc'];
  return noisyBlocs.contains(blocName);
}

Future<Isar> openDatabase() async {
  final dir = await getApplicationDocumentsDirectory();

  return await Isar.open(
    [DraftPostSchema], // List generated schemas
    directory: dir.path,
    name: 'drafts', // Optional: for multiple instances
  );
}

class MyNetworkClient {
  static Dio create(Talker talker, TokenStorage tokenStorage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL'] ?? 'https://example.com',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        validateStatus: (status) => status! < 520,
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
