import 'package:democracy/app.dart';
import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/bloc/forms_tab_bar/forms_tab_bar_cubit.dart';
import 'package:democracy/app/bloc/location/location_cubit.dart';
import 'package:democracy/app/bloc/repository/api_repository.dart';
import 'package:democracy/app/bloc/global/global_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/shared/utils/app_bloc_observer.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_bloc.dart';
import 'package:democracy/ballot/bloc/ballot_filter/ballot_filter_cubit.dart';
import 'package:democracy/ballot/bloc/ballots/ballots_bloc.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/chat/bloc/chat_filter/chat_filter_cubit.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/message_detail/message_detail_bloc.dart';
import 'package:democracy/constitution/bloc/constitution/constitution_bloc.dart';
import 'package:democracy/constitution/bloc/section_detail/section_detail_bloc.dart';
import 'package:democracy/constitution/bloc/sections/sections_bloc.dart';
import 'package:democracy/geo/bloc/geo/geo_bloc.dart';
import 'package:democracy/meet/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meet/bloc/meeting_filter/meeting_filter_cubit.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/notification/bloc/notifications/notifications_bloc.dart';
import 'package:democracy/notification/bloc/preferences/preferences_bloc.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/petition/bloc/petition_filter/petition_filter_cubit.dart';
import 'package:democracy/petition/bloc/supporters/supporters_bloc.dart';
import 'package:democracy/post/bloc/bookmarks/bookmarks_bloc.dart';
import 'package:democracy/post/bloc/draft_posts/draft_posts_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/post_filter/post_filter_cubit.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_bloc.dart';
import 'package:democracy/survey/bloc/survey_filter/survey_filter_cubit.dart';
import 'package:democracy/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/page/page_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/survey_bottom_navigation/survey_bottom_navigation_bloc.dart';
import 'package:democracy/user/bloc/blocked/blocked_bloc.dart';
import 'package:democracy/user/bloc/muted/muted_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dotenv.load(fileName: ".env");
  final options = BaseOptions(
    baseUrl: dotenv.env['BASE_URL']!,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    validateStatus: (status) {
      return status! < 520;
    },
  );

  final dio = Dio(options);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: AuthRepository(authProvider: AuthProvider(dio: dio)),
        ),
        RepositoryProvider.value(value: WebSocketService()),
        RepositoryProvider.value(value: APIRepository(dio: dio)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GlobalCubit()
              ..check()
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
            create: (context) =>
                AuthBloc(authRepository: context.read<AuthRepository>())
                  ..add(const AuthEvent.authenticate()),
            lazy: false,
          ),
          BlocProvider(
            create: (context) =>
                LoginCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) => WebsocketBloc(
              authRepository: context.read<AuthRepository>(),
              webSocketService: context.read<WebSocketService>(),
            ),
          ),
          BlocProvider(create: (context) => BottomNavBarCubit()),
          BlocProvider(create: (context) => PageBloc()),
          BlocProvider(create: (context) => SurveyBottomNavigationBloc()),
          BlocProvider(
            create: (context) =>
                BallotsBloc(webSocketService: context.read<WebSocketService>()),
          ),
          BlocProvider(create: (context) => BallotFilterCubit()),
          BlocProvider(
            create: (context) => BallotDetailBloc(
              webSocketService: context.read<WebSocketService>(),
            ),
          ),
          BlocProvider(create: (context) => PostFilterCubit()),
          BlocProvider(
            create: (context) => PostDetailBloc(
              webSocketService: context.read<WebSocketService>(),
              authRepository: context.read<AuthRepository>(),
              apiRepository: context.read<APIRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => BookmarksBloc(
              webSocketService: context.read<WebSocketService>(),
            ),
          ),
          BlocProvider(
            create: (context) => DraftPostsBloc(
              webSocketService: context.read<WebSocketService>(),
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
          BlocProvider(create: (context) => MessageActionsCubit()),
          BlocProvider(create: (context) => SurveyFilterCubit()),
          BlocProvider(
            create: (context) => SurveyDetailBloc(
              webSocketService: context.read<WebSocketService>(),
            ),
          ),
          BlocProvider(
            create: (context) =>
                AnswerBloc(webSocketService: context.read<WebSocketService>()),
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
            create: (context) =>
                UsersBloc(webSocketService: context.read<WebSocketService>()),
          ),
          BlocProvider(
            create: (context) => UserDetailBloc(
              webSocketService: context.read<WebSocketService>(),
              authRepository: context.read<AuthRepository>(),
              apiRepository: context.read<APIRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) =>
                MutedBloc(webSocketService: context.read<WebSocketService>()),
          ),
          BlocProvider(
            create: (context) =>
                BlockedBloc(webSocketService: context.read<WebSocketService>()),
          ),
          BlocProvider(
            create: (context) => PreferencesBloc(
              webSocketService: context.read<WebSocketService>(),
            ),
          ),
          BlocProvider(create: (context) => PetitionFilterCubit()),
          BlocProvider(
            create: (context) => PetitionDetailBloc(
              webSocketService: context.read<WebSocketService>(),
              authRepository: context.read<AuthRepository>(),
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
          BlocProvider(create: (context) => FormsTabBarCubit()),
          BlocProvider(create: (context) => MeetingFilterCubit()),
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
}
