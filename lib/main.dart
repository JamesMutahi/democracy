import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/bloc/theme/theme_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/view/app.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/chat/bloc/chat_actions/chat_actions_cubit.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/chats/chats_cubit.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_cubit.dart';
import 'package:democracy/poll/bloc/poll_detail/poll_detail_cubit.dart';
import 'package:democracy/poll/bloc/polls/polls_cubit.dart';
import 'package:democracy/post/bloc/bookmarks/bookmarks_cubit.dart';
import 'package:democracy/post/bloc/likes/likes_cubit.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/bloc/post_list/post_list_cubit.dart';
import 'package:democracy/post/bloc/replies/replies_cubit.dart';
import 'package:democracy/post/bloc/user_posts/user_posts_cubit.dart';
import 'package:democracy/post/bloc/user_replies/user_replies_cubit.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_cubit.dart';
import 'package:democracy/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/page/page_bloc.dart';
import 'package:democracy/survey/bloc/survey_process/survey_bottom_navigation/survey_bottom_navigation_bloc.dart';
import 'package:democracy/survey/bloc/surveys/surveys_cubit.dart';
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
                (context) => WebsocketBloc(
                  authRepository: context.read<AuthRepository>(),
                ),
          ),
          BlocProvider(
            create:
                (context) =>
                    LoginCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider(create: (context) => BottomNavBarCubit()),
          BlocProvider(create: (context) => PageBloc()),
          BlocProvider(create: (context) => PageBloc()),
          BlocProvider(create: (context) => SurveyBottomNavigationBloc()),
          BlocProvider(create: (context) => PollsCubit()),
          BlocProvider(create: (context) => PollDetailCubit()),
          BlocProvider(create: (context) => PostListCubit()),
          BlocProvider(create: (context) => PostDetailCubit()),
          BlocProvider(create: (context) => RepliesCubit()),
          BlocProvider(create: (context) => UserPostsCubit()),
          BlocProvider(create: (context) => BookmarksCubit()),
          BlocProvider(create: (context) => LikesCubit()),
          BlocProvider(create: (context) => UserRepliesCubit()),
          BlocProvider(create: (context) => ChatsCubit(), lazy: false),
          BlocProvider(create: (context) => ChatActionsCubit()),
          BlocProvider(create: (context) => ChatDetailCubit(), lazy: false),
          BlocProvider(create: (context) => MessageActionsCubit()),
          BlocProvider(create: (context) => SurveysCubit()),
          BlocProvider(create: (context) => SurveyDetailCubit()),
          BlocProvider(create: (context) => AnswerBloc()),
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
