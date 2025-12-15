import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/bloc/theme/theme_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/app_theme.dart';
import 'package:democracy/app/utils/snack_bar_content.dart';
import 'package:democracy/app/utils/splash_page.dart';
import 'package:democracy/app/view/dashboard.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/auth/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        ThemeMode themeMode = ThemeMode.system;
        if (state.index != null) {
          themeMode = ThemeMode.values[state.index!];
        }
        return MaterialApp(
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
          title: 'Democracy',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          home: _Listeners(
            child: ThemeMod(
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  switch (state) {
                    case Unauthenticated():
                      return LoginPage();
                    case Authenticated():
                      return BlocBuilder<WebsocketBloc, WebsocketState>(
                        builder: (context, socketState) {
                          return socketState.initialConnectionAchieved
                              ? Dashboard()
                              : SplashPage();
                        },
                      );
                    default:
                      return SplashPage();
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class ThemeMod extends StatelessWidget {
  const ThemeMod({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    return Theme(
      data: theme.copyWith(
        textTheme: theme.textTheme.apply(fontSizeFactor: 1.05),
      ),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: isDarkMode
            ? SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: theme.appBarTheme.backgroundColor,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: theme.appBarTheme.backgroundColor,
                systemNavigationBarIconBrightness: Brightness.light,
              )
            : SystemUiOverlayStyle.light.copyWith(
                statusBarColor: theme.appBarTheme.backgroundColor,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: theme.appBarTheme.backgroundColor,
                systemNavigationBarIconBrightness: Brightness.dark,
              ),
        child: child,
      ),
    );
  }
}

class _Listeners extends StatelessWidget {
  const _Listeners({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    void showSnackBar({required SnackBar snackBar}) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<ConnectivityBloc, ConnectivityState>(
          listener: (context, state) {
            switch (state) {
              case ConnectivitySuccess():
                final snackBar = getSnackBar(
                  context: context,
                  message: 'You are online',
                  status: SnackBarStatus.success,
                );
                showSnackBar(snackBar: snackBar);
              case ConnectivityFailure():
                final snackBar = getSnackBar(
                  context: context,
                  message: 'You are offline',
                  status: SnackBarStatus.failure,
                );
                showSnackBar(snackBar: snackBar);
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              context.read<WebsocketBloc>().add(WebsocketEvent.connect());
            }
          },
        ),
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            switch (state) {
              case LoggedIn():
                context.read<AuthBloc>().add(const AuthEvent.authenticate());
              case LoggedOut():
                context.read<BottomNavBarCubit>().changePage(0);
                context.read<AuthBloc>().add(const AuthEvent.authenticate());
                final snackBar = getSnackBar(
                  context: context,
                  message: 'Logged out',
                  status: SnackBarStatus.info,
                );
                showSnackBar(snackBar: snackBar);
            }
          },
        ),
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              final snackBar = getSnackBar(
                context: context,
                message: 'Connected',
                status: SnackBarStatus.success,
              );
              showSnackBar(snackBar: snackBar);
            }
            if (state.status == WebsocketStatus.failure) {
              final snackBar = getSnackBar(
                context: context,
                message: 'Server error',
                status: SnackBarStatus.failure,
              );
              showSnackBar(snackBar: snackBar);
            }
            if (state.status == WebsocketStatus.disconnected) {
              final snackBar = getSnackBar(
                context: context,
                message: 'Server connection lost',
                status: SnackBarStatus.failure,
              );
              showSnackBar(snackBar: snackBar);
            }
          },
        ),
      ],
      child: child,
    );
  }
}
