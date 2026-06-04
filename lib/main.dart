import 'dart:async';

import 'package:democracy/app.dart';
import 'package:democracy/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/bloc/location/location_cubit.dart';
import 'package:democracy/app/bloc/menu_controller/menu_controller_cubit.dart';
import 'package:democracy/app/bloc/repository/api/api_repository.dart';
import 'package:democracy/app/bloc/global/global_cubit.dart';
import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/app/bloc/route/route_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/bloc/services/token_interceptor.dart';
import 'package:democracy/app/bloc/services/token_storage.dart';
import 'package:democracy/app/core/app_logger.dart';
import 'package:democracy/app/core/init_dependencies.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_bloc.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/chat/bloc/chat_filter/chat_filter_cubit.dart';
import 'package:democracy/chat/bloc/direct_message/direct_message_bloc.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/message_detail/message_detail_bloc.dart';
import 'package:democracy/constitution/bloc/constitution/constitution_bloc.dart';
import 'package:democracy/constitution/bloc/section_detail/section_detail_bloc.dart';
import 'package:democracy/constitution/bloc/sections/sections_bloc.dart';
import 'package:democracy/geo/bloc/geo/geo_bloc.dart';
import 'package:democracy/meeting/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/notification/bloc/notifications/notifications_bloc.dart';
import 'package:democracy/notification/bloc/preferences/preferences_bloc.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/petition/bloc/supporters/supporters_bloc.dart';
import 'package:democracy/post/bloc/bookmarks/bookmarks_bloc.dart';
import 'package:democracy/post/bloc/draft_post/draft_post_bloc.dart';
import 'package:democracy/post/bloc/draft_posts/draft_posts_bloc.dart';
import 'package:democracy/post/bloc/hashtags/hashtags_bloc.dart';
import 'package:democracy/post/bloc/post_create/post_create_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/trending_topics/trending_topics_bloc.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/page/page_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/survey_bottom_navigation/survey_bottom_navigation_bloc.dart';
import 'package:democracy/user/bloc/blocked/blocked_bloc.dart';
import 'package:democracy/user/bloc/muted/muted_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker/talker.dart';

void main() {
  // Force zone errors to be fatal immediately
  BindingBase.debugZoneErrorsAreFatal = true;

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Initialize Sentry
      await SentryFlutter.init(
        (options) async {
          options.dsn = const String.fromEnvironment('SENTRY_DSN');
          options.environment = kDebugMode ? 'development' : 'production';
          options.release = await getRelease();
          options.tracesSampleRate = kDebugMode ? 1.0 : 0.2;
          options.profilesSampleRate = kDebugMode ? 1.0 : 0.0;
          options.beforeSend = (event, hint) => event;
          options.debug = kDebugMode;
        },
        appRunner: () async {
          // Initialize Talker and Logger
          final talker = Talker(
            settings: getTalkerSettings(),
            observer: MyTalkerObserver(),
          );
          AppLogger.init(talker);

          // Forward Flutter Framework errors to Talker & Sentry
          FlutterError.onError = (details) {
            AppLogger.error(
              'Flutter Framework Error',
              details.exception,
              details.stack,
            );
            Sentry.captureException(
              details.exception,
              stackTrace: details.stack,
            );
          };

          // Forward Platform/Native errors to Talker & Sentry
          PlatformDispatcher.instance.onError = (error, stack) {
            AppLogger.error('Platform Error', error, stack);
            Sentry.captureException(error, stackTrace: stack);
            return true;
          };

          // Setup Bloc observer
          Bloc.observer = SentryTalkerBlocObserver(
            talker: talker,
            settings: getBlocLogSettings(),
          );

          // Setup Network Clients
          final tokenStorage = TokenStorage();
          final dio = MyNetworkClient.create(talker, tokenStorage);
          final tokenInterceptor = TokenInterceptor(
            dio: dio,
            tokenStorage: tokenStorage,
          );
          dio.interceptors.add(tokenInterceptor);

          // Initialize Database
          await initializeHive();

          print("API Base: ${const String.fromEnvironment('BASE_URL')}");

          // Finally run the app
          runApp(
            MultiRepositoryProvider(
              providers: [
                RepositoryProvider.value(
                  value: AuthRepository(authProvider: AuthProvider(dio: dio)),
                ),
                RepositoryProvider.value(value: WebSocketService()),
                RepositoryProvider.value(value: tokenStorage),
                RepositoryProvider.value(
                  value: APIRepository(apiProvider: APIProvider(dio: dio)),
                ),
                RepositoryProvider.value(value: DatabaseRepository()),
              ],
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) {
                      final cubit = GlobalCubit();
                      if (!kIsWeb) {
                        cubit.getCameras();
                      }
                      return cubit;
                    },
                    lazy: false,
                  ),
                  BlocProvider(
                    create: (context) =>
                        ConnectivityBloc()
                          ..add(const ConnectivityEvent.listenConnection()),
                    lazy: false,
                  ),
                  BlocProvider(
                    create: (context) => AuthBloc(
                      authRepository: context.read<AuthRepository>(),
                      tokenStorage: tokenStorage,
                      tokenInterceptor: tokenInterceptor,
                    )..add(const AuthEvent.authenticate()),
                    lazy: false,
                  ),
                  BlocProvider(
                    create: (context) => LoginCubit(
                      authRepository: context.read<AuthRepository>(),
                      tokenStorage: tokenStorage,
                      databaseRepository: context.read<DatabaseRepository>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => WebsocketBloc(
                      authRepository: context.read<AuthRepository>(),
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                  BlocProvider(create: (context) => RouteCubit()),
                  BlocProvider(create: (context) => MenuControllerCubit()),
                  BlocProvider(
                    create: (context) => BallotDetailBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => PostDetailBloc(
                      webSocketService: context.read<WebSocketService>(),
                      authRepository: context.read<AuthRepository>(),
                      apiRepository: context.read<APIRepository>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => PostCreateBloc(
                      apiRepository: context.read<APIRepository>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => BookmarksBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => DraftPostBloc(
                      databaseRepository: context.read<DatabaseRepository>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => DraftPostsBloc(
                      databaseRepository: context.read<DatabaseRepository>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => ChatDetailBloc(
                      webSocketService: context.read<WebSocketService>(),
                      authRepository: context.read<AuthRepository>(),
                      apiRepository: context.read<APIRepository>(),
                      databaseRepository: context.read<DatabaseRepository>(),
                    ),
                  ),
                  BlocProvider(create: (context) => ChatFilterCubit()),
                  BlocProvider(
                    create: (context) => MessageDetailBloc(
                      webSocketService: context.read<WebSocketService>(),
                      authRepository: context.read<AuthRepository>(),
                      apiRepository: context.read<APIRepository>(),
                      databaseRepository: context.read<DatabaseRepository>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => DirectMessageBloc(
                      apiRepository: context.read<APIRepository>(),
                    ),
                  ),
                  BlocProvider(create: (context) => MessageActionsCubit()),
                  BlocProvider(
                    create: (context) => SurveyDetailBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                  BlocProvider(create: (context) => PageBloc()),
                  BlocProvider(
                    create: (context) => SurveyBottomNavigationBloc(),
                  ),
                  BlocProvider(
                    create: (context) => AnswerBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => NotificationsBloc(
                      webSocketService: context.read<WebSocketService>(),
                      databaseRepository: context.read<DatabaseRepository>(),
                    ),
                    lazy: false,
                  ),
                  BlocProvider(
                    create: (context) => NotificationDetailBloc(
                      webSocketService: context.read<WebSocketService>(),
                      databaseRepository: context.read<DatabaseRepository>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => UsersBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => UserDetailBloc(
                      webSocketService: context.read<WebSocketService>(),
                      apiRepository: context.read<APIRepository>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => MutedBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => BlockedBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => PreferencesBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => PetitionDetailBloc(
                      webSocketService: context.read<WebSocketService>(),
                      apiRepository: context.read<APIRepository>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => SupportersBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => ConstitutionBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => SectionsBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => SectionDetailBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => MeetingDetailBloc(
                      webSocketService: context.read<WebSocketService>(),
                      apiRepository: context.read<APIRepository>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => GeoBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                  BlocProvider(create: (context) => LocationCubit()),
                  BlocProvider(
                    create: (context) => HashtagsBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => TrendingTopicsBloc(
                      webSocketService: context.read<WebSocketService>(),
                    ),
                  ),
                ],
                child: const MyApp(),
              ),
            ),
          );
        },
      );
    },
    (error, stack) {
      // Catch any uncaught async/zone errors globally
      Sentry.captureException(error, stackTrace: stack);
    },
  );
}
