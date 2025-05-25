import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/bloc/repository/app_repository.dart';
import 'package:democracy/app/bloc/survey/survey_bloc.dart';
import 'package:democracy/app/bloc/theme/theme_cubit.dart';
import 'package:democracy/app/view/dashboard.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/auth/bloc/otp_counter/otp_counter_bloc.dart';
import 'package:democracy/auth/bloc/password_change/password_change_cubit.dart';
import 'package:democracy/auth/bloc/password_reset/password_reset_cubit.dart';
import 'package:democracy/auth/bloc/registration/registration_cubit.dart';
import 'package:democracy/utils/app_bloc_observer.dart';
import 'package:democracy/utils/app_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
          value: AppRepository(appProvider: AppProvider(dio: dio)),
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
                (context) =>
                    SurveyBloc(appRepository: context.read<AppRepository>()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        ThemeMode themeMode = ThemeMode.system;
        switch (state) {
          case ThemeLoaded(themeMode: final mode):
            themeMode = mode;
        }
        return MaterialApp(
          builder:
              (context, child) => ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(
                    start: 1921,
                    end: double.infinity,
                    name: '4K',
                  ),
                ],
              ),
          title: 'Democracy',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          home: const Dashboard(),
        );
      },
    );
  }
}
