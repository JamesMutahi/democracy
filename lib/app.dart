import 'package:democracy/app/bloc/global/global_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/core/app_theme.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/view/router/refresh_stream.dart';
import 'package:democracy/app/view/router/router.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoRouterRefreshStream? _refreshListenable;

  @override
  void dispose() {
    _refreshListenable?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _Listeners(
      child: Builder(
        builder: (context) {
          _refreshListenable ??= GoRouterRefreshStream([
            context.read<AuthBloc>().stream,
            context.read<WebsocketBloc>().stream,
          ]);

          return BlocBuilder<GlobalCubit, GlobalState>(
            builder: (context, state) {
              final themeMode = state.index != null
                  ? ThemeMode.values[state.index!]
                  : ThemeMode.system;

              return MaterialApp.router(
                builder: (context, child) => ResponsiveBreakpoints.builder(
                  child: FToastBuilder()(context, child),
                  breakpoints: breakpoints,
                ),
                title: 'Democracy',
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: themeMode,
                routerConfig: createAppRouter(
                  refreshListenable: _refreshListenable,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

List<Breakpoint> breakpoints = [
  const Breakpoint(start: 0, end: 850, name: MOBILE),
  const Breakpoint(start: 850, end: 1100, name: TABLET),
  const Breakpoint(start: 1100, end: double.infinity, name: DESKTOP),
  const Breakpoint(start: 1400, end: 1400, name: expandSidePanel),
  const Breakpoint(start: 2600, end: double.infinity, name: centerMainPage),
];

class _Listeners extends StatelessWidget {
  const _Listeners({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.status == AuthStatus.authenticated) {
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
                context.read<AuthBloc>().add(const AuthEvent.authenticate());
            }
          },
        ),
      ],
      child: child,
    );
  }
}
