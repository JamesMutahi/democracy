import 'package:democracy/app.dart';
import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/bloc/forms_search_and_filter/forms_search_and_filter_cubit.dart';
import 'package:democracy/app/bloc/theme/theme_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_cubit.dart';
import 'package:democracy/ballot/bloc/ballots/ballots_cubit.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_cubit.dart';
import 'package:democracy/chat/bloc/chats/chats_cubit.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/message_detail/message_detail_cubit.dart';
import 'package:democracy/chat/bloc/messages/messages_cubit.dart';
import 'package:democracy/constitution/bloc/constitution/constitution_cubit.dart';
import 'package:democracy/constitution/bloc/section_detail/section_detail_cubit.dart';
import 'package:democracy/constitution/bloc/sections/sections_cubit.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_cubit.dart';
import 'package:democracy/notification/bloc/notifications/notifications_cubit.dart';
import 'package:democracy/notification/bloc/preferences/preferences_cubit.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_cubit.dart';
import 'package:democracy/petition/bloc/petitions/petitions_cubit.dart';
import 'package:democracy/petition/bloc/supporters/supporters_cubit.dart';
import 'package:democracy/petition/bloc/user_petitions/user_petitions_cubit.dart';
import 'package:democracy/post/bloc/bookmarks/bookmarks_cubit.dart';
import 'package:democracy/post/bloc/draft_posts/draft_posts_cubit.dart';
import 'package:democracy/post/bloc/following_posts/following_posts_cubit.dart';
import 'package:democracy/post/bloc/for_you/for_you_cubit.dart';
import 'package:democracy/post/bloc/likes/likes_cubit.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/bloc/posts/posts_cubit.dart';
import 'package:democracy/post/bloc/replies/replies_cubit.dart';
import 'package:democracy/post/bloc/user_posts/user_posts_cubit.dart';
import 'package:democracy/post/bloc/user_replies/user_replies_cubit.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_cubit.dart';
import 'package:democracy/survey/bloc/survey_process/answer/answer_cubit.dart';
import 'package:democracy/survey/bloc/survey_process/page/page_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/survey_bottom_navigation/survey_bottom_navigation_bloc.dart';
import 'package:democracy/survey/bloc/surveys/surveys_cubit.dart';
import 'package:democracy/user/bloc/blocked/blocked_cubit.dart';
import 'package:democracy/user/bloc/followers/followers_cubit.dart';
import 'package:democracy/user/bloc/following/following_cubit.dart';
import 'package:democracy/user/bloc/muted/muted_cubit.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_cubit.dart';
import 'package:democracy/user/bloc/users/users_cubit.dart';
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
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: AuthRepository(authProvider: AuthProvider(dio: dio)),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()..check(), lazy: false),
          BlocProvider(
            create:
                (context) =>
                    ConnectivityBloc()
                      ..add(const ConnectivityEvent.listenConnection()),
            lazy: false,
          ),
          BlocProvider(
            create:
                (context) =>
                    AuthBloc(authRepository: context.read<AuthRepository>())
                      ..add(const AuthEvent.authenticate()),
            lazy: false,
          ),
          BlocProvider(
            create:
                (context) =>
                    LoginCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider(
            create:
                (context) => WebsocketBloc(
                  authRepository: context.read<AuthRepository>(),
                ),
          ),
          BlocProvider(create: (context) => BottomNavBarCubit()),
          BlocProvider(create: (context) => PageBloc()),
          BlocProvider(create: (context) => SurveyBottomNavigationBloc()),
          BlocProvider(create: (context) => BallotsCubit()),
          BlocProvider(create: (context) => BallotDetailCubit()),
          BlocProvider(create: (context) => ForYouCubit()),
          BlocProvider(create: (context) => PostsCubit()),
          BlocProvider(create: (context) => PostDetailCubit()),
          BlocProvider(create: (context) => FollowingPostsCubit()),
          BlocProvider(create: (context) => RepliesCubit()),
          BlocProvider(create: (context) => UserPostsCubit()),
          BlocProvider(create: (context) => BookmarksCubit()),
          BlocProvider(create: (context) => LikesCubit()),
          BlocProvider(create: (context) => DraftPostsCubit()),
          BlocProvider(create: (context) => UserRepliesCubit()),
          BlocProvider(create: (context) => ChatsCubit()),
          BlocProvider(create: (context) => ChatDetailCubit()),
          BlocProvider(create: (context) => MessagesCubit()),
          BlocProvider(create: (context) => MessageDetailCubit()),
          BlocProvider(create: (context) => MessageActionsCubit()),
          BlocProvider(create: (context) => SurveysCubit()),
          BlocProvider(create: (context) => SurveyDetailCubit()),
          BlocProvider(create: (context) => AnswerCubit()),
          BlocProvider(create: (context) => NotificationsCubit(), lazy: false),
          BlocProvider(create: (context) => NotificationDetailCubit()),
          BlocProvider(create: (context) => UsersCubit()),
          BlocProvider(create: (context) => UserDetailCubit()),
          BlocProvider(create: (context) => MutedCubit()),
          BlocProvider(create: (context) => BlockedCubit()),
          BlocProvider(create: (context) => FollowingCubit()),
          BlocProvider(create: (context) => FollowersCubit()),
          BlocProvider(create: (context) => PreferencesCubit()),
          BlocProvider(create: (context) => PetitionsCubit()),
          BlocProvider(create: (context) => PetitionDetailCubit()),
          BlocProvider(create: (context) => SupportersCubit()),
          BlocProvider(create: (context) => UserPetitionsCubit()),
          BlocProvider(create: (context) => ConstitutionCubit()),
          BlocProvider(create: (context) => SectionsCubit()),
          BlocProvider(create: (context) => SectionDetailCubit()),
          BlocProvider(create: (context) => FormsSearchAndFilterCubit()),
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
