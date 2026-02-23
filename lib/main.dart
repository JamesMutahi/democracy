import 'package:democracy/app.dart';
import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/bloc/forms_tab_bar/forms_tab_bar_cubit.dart';
import 'package:democracy/app/bloc/theme/theme_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_bloc.dart';
import 'package:democracy/ballot/bloc/ballot_filter/ballot_filter_cubit.dart';
import 'package:democracy/ballot/bloc/ballots/ballots_bloc.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/chat/bloc/chat_filter/chat_filter_cubit.dart';
import 'package:democracy/chat/bloc/chats/chats_bloc.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/message_detail/message_detail_bloc.dart';
import 'package:democracy/chat/bloc/messages/messages_bloc.dart';
import 'package:democracy/constitution/bloc/constitution/constitution_bloc.dart';
import 'package:democracy/constitution/bloc/section_detail/section_detail_bloc.dart';
import 'package:democracy/constitution/bloc/sections/sections_bloc.dart';
import 'package:democracy/geo/bloc/geo/geo_cubit.dart';
import 'package:democracy/meet/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meet/bloc/meeting_filter/meeting_filter_cubit.dart';
import 'package:democracy/meet/bloc/meetings/meetings_bloc.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/notification/bloc/notifications/notifications_bloc.dart';
import 'package:democracy/notification/bloc/preferences/preferences_bloc.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/petition/bloc/petition_filter/petition_filter_cubit.dart';
import 'package:democracy/petition/bloc/petitions/petitions_bloc.dart';
import 'package:democracy/petition/bloc/supporters/supporters_bloc.dart';
import 'package:democracy/petition/bloc/user_petitions/user_petitions_bloc.dart';
import 'package:democracy/post/bloc/bookmarks/bookmarks_bloc.dart';
import 'package:democracy/post/bloc/community_notes/community_notes_bloc.dart';
import 'package:democracy/post/bloc/draft_posts/draft_posts_bloc.dart';
import 'package:democracy/post/bloc/following_posts/following_posts_bloc.dart';
import 'package:democracy/post/bloc/for_you/for_you_bloc.dart';
import 'package:democracy/post/bloc/likes/likes_bloc.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/post_filter/post_filter_cubit.dart';
import 'package:democracy/post/bloc/posts/posts_bloc.dart';
import 'package:democracy/post/bloc/replies/replies_bloc.dart';
import 'package:democracy/post/bloc/reply_to/reply_to_bloc.dart';
import 'package:democracy/post/bloc/user_community_notes/user_community_notes_bloc.dart';
import 'package:democracy/post/bloc/user_posts/user_posts_bloc.dart';
import 'package:democracy/post/bloc/user_replies/user_replies_bloc.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_bloc.dart';
import 'package:democracy/survey/bloc/survey_filter/survey_filter_cubit.dart';
import 'package:democracy/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/page/page_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/survey_bottom_navigation/survey_bottom_navigation_bloc.dart';
import 'package:democracy/survey/bloc/surveys/surveys_bloc.dart';
import 'package:democracy/user/bloc/blocked/blocked_bloc.dart';
import 'package:democracy/user/bloc/followers/followers_bloc.dart';
import 'package:democracy/user/bloc/following/following_bloc.dart';
import 'package:democracy/user/bloc/muted/muted_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final options = BaseOptions(
    baseUrl: dotenv.env['BASE_URL']!,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    validateStatus: (status) {
      return status! < 520;
    },
  );

  final dio = Dio(options);
  final webSocketService = WebSocketService();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: AuthRepository(authProvider: AuthProvider(dio: dio)),
        ),
        RepositoryProvider.value(value: GeoRepository(dio: dio)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()..check(), lazy: false),
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
              webSocketService: webSocketService,
            ),
          ),
          BlocProvider(create: (context) => BottomNavBarCubit()),
          BlocProvider(create: (context) => PageBloc()),
          BlocProvider(create: (context) => SurveyBottomNavigationBloc()),
          BlocProvider(
            create: (context) =>
                BallotsBloc(webSocketService: webSocketService),
          ),
          BlocProvider(create: (context) => BallotFilterCubit()),
          BlocProvider(
            create: (context) =>
                BallotDetailBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) => ForYouBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) => PostsBloc(webSocketService: webSocketService),
          ),
          BlocProvider(create: (context) => PostFilterCubit()),
          BlocProvider(
            create: (context) =>
                PostDetailBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                FollowingPostsBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                ReplyToBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                RepliesBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                UserPostsBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                BookmarksBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) => LikesBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                DraftPostsBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                UserRepliesBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) => ChatsBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                ChatDetailBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                MessagesBloc(webSocketService: webSocketService),
          ),
          BlocProvider(create: (context) => ChatFilterCubit()),
          BlocProvider(
            create: (context) =>
                MessageDetailBloc(webSocketService: webSocketService),
          ),
          BlocProvider(create: (context) => MessageActionsCubit()),
          BlocProvider(
            create: (context) =>
                SurveysBloc(webSocketService: webSocketService),
          ),
          BlocProvider(create: (context) => SurveyFilterCubit()),
          BlocProvider(
            create: (context) =>
                SurveyDetailBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) => AnswerBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                NotificationsBloc(webSocketService: webSocketService),
            lazy: false,
          ),
          BlocProvider(
            create: (context) =>
                NotificationDetailBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) => UsersBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                UserDetailBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) => MutedBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                BlockedBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                FollowingBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                FollowersBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                PreferencesBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                PetitionsBloc(webSocketService: webSocketService),
          ),
          BlocProvider(create: (context) => PetitionFilterCubit()),
          BlocProvider(
            create: (context) =>
                PetitionDetailBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                SupportersBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                UserPetitionsBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                ConstitutionBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                SectionsBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                SectionDetailBloc(webSocketService: webSocketService),
          ),
          BlocProvider(create: (context) => FormsTabBarCubit()),
          BlocProvider(
            create: (context) =>
                MeetingsBloc(webSocketService: webSocketService),
          ),
          BlocProvider(create: (context) => MeetingFilterCubit()),
          BlocProvider(
            create: (context) =>
                MeetingDetailBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                CommunityNotesBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) =>
                UserCommunityNotesBloc(webSocketService: webSocketService),
          ),
          BlocProvider(
            create: (context) => GeoCubit(
              authRepository: context.read<AuthRepository>(),
              geoRepository: context.read<GeoRepository>(),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class AppBlocObserver extends BlocObserver {
  final _toIgnore = [BottomNavBarCubit];

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      if (!_toIgnore.contains(bloc.runtimeType)) {
        print('onChange(${bloc.runtimeType}, $change)');
      }
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('onError(${bloc.runtimeType}, $error, $stackTrace)');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    if (kDebugMode) {
      print('onEvent(${bloc.runtimeType}, $event)');
    }
    super.onEvent(bloc, event);
  }
}
