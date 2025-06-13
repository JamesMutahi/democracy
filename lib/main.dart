import 'package:democracy/app/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/app/bloc/theme/theme_cubit.dart';
import 'package:democracy/app/app/view/app.dart';
import 'package:democracy/app/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/app/auth/bloc/login/login_cubit.dart';
import 'package:democracy/app/auth/bloc/otp_counter/otp_counter_bloc.dart';
import 'package:democracy/app/auth/bloc/password_change/password_change_cubit.dart';
import 'package:democracy/app/auth/bloc/password_reset/password_reset_cubit.dart';
import 'package:democracy/app/auth/bloc/registration/registration_cubit.dart';
import 'package:democracy/app/poll/bloc/poll/poll_bloc.dart';
import 'package:democracy/app/poll/bloc/vote/vote_cubit.dart';
import 'package:democracy/app/social/bloc/post/post_bloc.dart';
import 'package:democracy/app/survey/bloc/survey_process/page/page_bloc.dart';
import 'package:democracy/app/survey/bloc/survey_process/answer/answer_bloc.dart';
import 'package:democracy/app/survey/bloc/survey_process/survey_bottom_navigation/survey_bottom_navigation_bloc.dart';
import 'package:democracy/app/survey/bloc/survey/survey_bloc.dart';
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
        RepositoryProvider.value(
          value: SurveyRepository(surveyProvider: SurveyProvider(dio: dio)),
        ),
        RepositoryProvider.value(
          value: PollRepository(pollProvider: PollProvider(dio: dio)),
        ),
        RepositoryProvider.value(
          value: PostRepository(postProvider: PostProvider(dio: dio)),
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
                (context) => RegistrationCubit(
                  authRepository: context.read<AuthRepository>(),
                ),
          ),
          BlocProvider(
            create:
                (context) =>
                    LoginCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider(
            create:
                (context) => PasswordChangeCubit(
                  authRepository: context.read<AuthRepository>(),
                ),
          ),
          BlocProvider(
            create:
                (context) => PasswordResetCubit(
                  authRepository: context.read<AuthRepository>(),
                ),
          ),
          BlocProvider(create: (context) => BottomNavBarCubit()),
          BlocProvider(create: (context) => OTPCounterBloc()),
          BlocProvider(
            create:
                (context) => SurveyBloc(
                  surveyRepository: context.read<SurveyRepository>(),
                ),
          ),
          BlocProvider(create: (context) => PageBloc()),
          BlocProvider(create: (context) => PageBloc()),
          BlocProvider(create: (context) => SurveyBottomNavigationBloc()),
          BlocProvider(
            create:
                (context) => AnswerBloc(
                  surveyRepository: context.read<SurveyRepository>(),
                  authRepository: context.read<AuthRepository>(),
                ),
          ),
          BlocProvider(
            create:
                (context) => PollBloc(
                  pollRepository: context.read<PollRepository>(),
                  authRepository: context.read<AuthRepository>(),
                ),
          ),
          BlocProvider(
            create:
                (context) => VoteCubit(
                  pollRepository: context.read<PollRepository>(),
                  authRepository: context.read<AuthRepository>(),
                ),
          ),
          BlocProvider(
            create:
                (context) =>
                    PostBloc(postRepository: context.read<PostRepository>())
                      ..add(PostEvent.initialize()),
            lazy: false,
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
