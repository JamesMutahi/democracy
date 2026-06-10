import 'package:democracy/app/bloc/global/global_cubit.dart';
import 'package:democracy/app/bloc/route/route_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/core/app_theme.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/view/router/route_observer.dart';
import 'package:democracy/app/view/router/router.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:flutter/gestures.dart';
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
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return _Listeners(
      child: Builder(
        builder: (context) {
          return BlocBuilder<GlobalCubit, GlobalState>(
            builder: (context, state) {
              final themeMode = state.index != null
                  ? ThemeMode.values[state.index!]
                  : ThemeMode.system;
              final routeCubit = context.read<RouteCubit>();
              return MaterialApp.router(
                builder: (context, child) => ResponsiveBreakpoints.builder(
                  child: FToastBuilder()(context, child),
                  breakpoints: breakpoints,
                ),
                title: 'People of Kenya',
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: themeMode,
                routerConfig: _appRouter.config(
                  navigatorObservers: () => [
                    AppRouteObserver(routeCubit: routeCubit),
                  ],
                ),
                scrollBehavior: const MaterialScrollBehavior().copyWith(
                  scrollbars: false,
                  physics: const BouncingScrollPhysics(),
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.trackpad,
                    PointerDeviceKind.stylus,
                  },
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
  const Breakpoint(start: 0, end: 500, name: MOBILE),
  const Breakpoint(start: 500, end: 1100, name: TABLET),
  const Breakpoint(start: 1100, end: double.infinity, name: DESKTOP),
  const Breakpoint(start: 1280, end: 1280, name: expandSideMenu),
  const Breakpoint(start: 1010, end: 1010, name: expandSidePanel),
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
