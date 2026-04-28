import 'package:democracy/app.dart';
import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/bloc/hub_filter/hub_filter_cubit.dart';
import 'package:democracy/app/bloc/location/location_cubit.dart';
import 'package:democracy/app/bloc/repository/api_repository.dart';
import 'package:democracy/app/bloc/global/global_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/bloc/services/token_interceptor.dart';
import 'package:democracy/app/bloc/services/token_storage.dart';
import 'package:democracy/app/shared/utils/app_logger.dart';
import 'package:democracy/app/shared/utils/init_dependencies.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_bloc.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/chat/bloc/chat_filter/chat_filter_cubit.dart';
import 'package:democracy/chat/bloc/direct_message/direct_message_bloc.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/message_create/message_create_bloc.dart';
import 'package:democracy/chat/bloc/message_detail/message_detail_bloc.dart';
import 'package:democracy/constitution/bloc/constitution/constitution_bloc.dart';
import 'package:democracy/constitution/bloc/section_detail/section_detail_bloc.dart';
import 'package:democracy/constitution/bloc/sections/sections_bloc.dart';
import 'package:democracy/geo/bloc/geo/geo_bloc.dart';
import 'package:democracy/meet/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/notification/bloc/notifications/notifications_bloc.dart';
import 'package:democracy/notification/bloc/preferences/preferences_bloc.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/petition/bloc/supporters/supporters_bloc.dart';
import 'package:democracy/post/bloc/bookmarks/bookmarks_bloc.dart';
import 'package:democracy/post/bloc/draft_post/draft_post_bloc.dart';
import 'package:democracy/post/bloc/draft_posts/draft_posts_bloc.dart';
import 'package:democracy/post/bloc/post_create/post_create_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/post_filter/post_filter_cubit.dart';
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
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await SentryFlutter.init(
    (options) {
      options.dsn = dotenv.env['SENTRY_DSN'];

      // === Core Settings ===
      options.environment = kDebugMode ? 'development' : 'production';
      options.release = 'democracy@${dotenv.env['APP_VERSION'] ?? '1.0.0'}';

      // === Performance Monitoring ===
      // 20% of transactions in production
      options.tracesSampleRate = kDebugMode ? 1.0 : 0.2;

      // === Profiling (Experimental) ===
      // Disable by default in production to avoid the warning + overhead
      options.profilesSampleRate = kDebugMode ? 1.0 : 0.0;

      // Optional: Advanced filtering / sanitization
      options.beforeSend = (event, hint) {
        // You can remove sensitive data here if needed
        return event;
      };

      // Enable debug mode only during development
      options.debug = kDebugMode;
    },
    appRunner: () async {
      // Everything inside here is automatically "Guarded" by Sentry
      final talker = Talker(
        settings: getTalkerSettings(),
        observer: MyTalkerObserver(),
      );

      AppLogger.init(talker);

      // Catch errors from the Flutter Framework (UI, Build, Layout)
      FlutterError.onError = (details) {
        AppLogger.error(
          'Flutter Framework Error',
          details.exception,
          details.stack,
        );
      };

      // Catch errors outside the Flutter Framework (Platform/Native)
      PlatformDispatcher.instance.onError = (error, stack) {
        AppLogger.error('Platform Error', error, stack);
        return true;
      };

      // Setup Bloc observer
      Bloc.observer = TalkerBlocObserver(
        talker: talker,
        settings: getBlocLogSettings(),
      );

      // Setup dio
      final tokenStorage = TokenStorage();
      final dio = MyNetworkClient.create(talker, tokenStorage);
      final tokenInterceptor = TokenInterceptor(
        dio: dio,
        tokenStorage: tokenStorage,
      );
      dio.interceptors.add(tokenInterceptor);

      // Open Isar instance
      final isar = await openDatabase();

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
            RepositoryProvider.value(value: DraftPostRepository(isar: isar)),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GlobalCubit()
                  ..checkTheme()
                  ..getCameras(),
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
                ),
              ),
              BlocProvider(
                create: (context) => WebsocketBloc(
                  authRepository: context.read<AuthRepository>(),
                  webSocketService: context.read<WebSocketService>(),
                ),
              ),
              BlocProvider(create: (context) => BottomNavBarCubit()),
              BlocProvider(
                create: (context) => BallotDetailBloc(
                  webSocketService: context.read<WebSocketService>(),
                ),
              ),
              BlocProvider(create: (context) => PostFilterCubit()),
              BlocProvider(create: (context) => HubFilterCubit()),
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
                  draftPostRepository: context.read<DraftPostRepository>(),
                ),
              ),
              BlocProvider(
                create: (context) => DraftPostsBloc(
                  draftPostRepository: context.read<DraftPostRepository>(),
                ),
              ),
              BlocProvider(
                create: (context) => ChatDetailBloc(
                  webSocketService: context.read<WebSocketService>(),
                  authRepository: context.read<AuthRepository>(),
                  apiRepository: context.read<APIRepository>(),
                ),
              ),
              BlocProvider(create: (context) => ChatFilterCubit()),
              BlocProvider(
                create: (context) => MessageDetailBloc(
                  webSocketService: context.read<WebSocketService>(),
                  authRepository: context.read<AuthRepository>(),
                  apiRepository: context.read<APIRepository>(),
                ),
              ),
              BlocProvider(
                create: (context) => MessageCreateBloc(
                  apiRepository: context.read<APIRepository>(),
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
              BlocProvider(create: (context) => SurveyBottomNavigationBloc()),
              BlocProvider(
                create: (context) => AnswerBloc(
                  webSocketService: context.read<WebSocketService>(),
                ),
              ),
              BlocProvider(
                create: (context) => NotificationsBloc(
                  webSocketService: context.read<WebSocketService>(),
                ),
                lazy: false,
              ),
              BlocProvider(
                create: (context) => NotificationDetailBloc(
                  webSocketService: context.read<WebSocketService>(),
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
                ),
              ),
              BlocProvider(
                create: (context) =>
                    GeoBloc(webSocketService: context.read<WebSocketService>()),
              ),
              BlocProvider(create: (context) => LocationCubit()),
            ],
            child: const MyApp(),
          ),
        ),
      );
    },
  );
}
