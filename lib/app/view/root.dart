import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/main_page.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/auth/view/failure.dart';
import 'package:democracy/auth/view/login.dart';
import 'package:democracy/auth/view/splash.dart';
import 'package:democracy/notification/bloc/notifications/notifications_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RootRoute extends StatelessWidget {
  const RootRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final socketState = context.watch<WebsocketBloc>().state;

        // Authenticating → Show Splash
        if (authState.status == AuthStatus.authenticating) {
          return const SplashPage();
        }

        // Failure → Show Error
        if (authState.status == AuthStatus.failure) {
          return FailurePage(error: authState.error);
        }

        // Not authenticated → Login
        if (authState.status == AuthStatus.unAuthenticated) {
          return const LoginPage();
        }

        // Authenticated but socket not ready → Splash
        if (!socketState.initialConnectionAchieved) {
          return const SplashPage();
        }

        // Fully authenticated + socket ready → Main App
        return _Listeners(child: ThemeMod(child: const MainPage()));
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
    return Theme(
      data: theme.copyWith(
        textTheme: theme.textTheme.apply(fontSizeFactor: 1.05),
      ),
      child: child,
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
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoggedOut) {
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
              context.read<NotificationsBloc>().add(NotificationsEvent.get());
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
                message: 'Reconnecting...',
                status: SnackBarStatus.info,
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
