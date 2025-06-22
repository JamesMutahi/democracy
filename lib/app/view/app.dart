import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/bloc/profile/profile_cubit.dart';
import 'package:democracy/app/bloc/theme/theme_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/view/dashboard.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/auth/bloc/registration/registration_cubit.dart';
import 'package:democracy/auth/view/login.dart';
import 'package:democracy/post/bloc/bookmarks/bookmarks_cubit.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/bloc/post_list/post_list_cubit.dart';
import 'package:democracy/post/bloc/replies/replies_cubit.dart';
import 'package:democracy/app/utils/view/app_theme.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/app/utils/view/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
          home: _Listeners(
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                switch (state) {
                  case Unauthenticated():
                    return LoginPage();
                  case Authenticated():
                    return Dashboard();
                  default:
                    return SplashPage();
                }
              },
            ),
          ),
        );
      },
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
                final snackBar = SnackBar(
                  backgroundColor: Theme.of(context).cardColor,
                  behavior: SnackBarBehavior.floating,
                  content: ConnSnackBarContent(
                    text: 'You are online',
                    iconColor: Theme.of(context).primaryColor,
                  ),
                  width: 170.0,
                );
                showSnackBar(snackBar: snackBar);
              case ConnectivityFailure():
                final snackBar = SnackBar(
                  backgroundColor: Theme.of(context).cardColor,
                  behavior: SnackBarBehavior.floating,
                  content: ConnSnackBarContent(
                    text: 'You are offline',
                    iconColor: Theme.of(context).colorScheme.error,
                  ),
                  width: 170.0,
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
        BlocListener<RegistrationCubit, RegistrationState>(
          listener: (context, state) {
            switch (state) {
              case RegistrationUnverified():
                context.read<AuthBloc>().add(const AuthEvent.authenticate());
              case RegistrationVerified():
                context.read<AuthBloc>().add(const AuthEvent.authenticate());
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
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Theme.of(context).cardColor,
                  content: const SnackBarContent(
                    message: 'Logged out',
                    status: SnackBarStatus.info,
                  ),
                );
                showSnackBar(snackBar: snackBar);
            }
          },
        ),
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.success) {
              if (state.message['stream'] == postsStream) {
                switch (state.message['payload']['action']) {
                  case 'list':
                    context.read<PostListCubit>().loadPosts(
                      payload: state.message['payload'],
                    );
                  case 'create':
                    context.read<PostDetailCubit>().created(
                      payload: state.message['payload'],
                    );
                  case 'update':
                    context.read<PostDetailCubit>().updated(
                      payload: state.message['payload'],
                    );
                  case 'like':
                    context.read<PostDetailCubit>().liked(
                      payload: state.message['payload'],
                    );
                  case 'bookmark':
                    context.read<PostDetailCubit>().bookmarked(
                      payload: state.message['payload'],
                    );
                  case 'delete':
                    context.read<PostDetailCubit>().deleted(
                      payload: state.message['payload'],
                    );
                  case 'report':
                    context.read<PostDetailCubit>().reported(
                      payload: state.message['payload'],
                    );
                  case 'replies':
                    context.read<RepliesCubit>().loadReplies(
                      payload: state.message['payload'],
                    );
                  case 'profile':
                    context.read<ProfileCubit>().loaded(
                      payload: state.message['payload'],
                    );
                  case 'bookmarks':
                    context.read<BookmarksCubit>().loaded(
                      payload: state.message['payload'],
                    );
                }
              }
            }
            if (state.status == WebsocketStatus.failure) {
              String error = 'Something went wrong';
              context.read<PostDetailCubit>().websocketFailure(error: error);
              context.read<PostListCubit>().websocketFailure(error: error);
              context.read<ProfileCubit>().websocketFailure(error: error);
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: Theme.of(context).cardColor,
                content: SnackBarContent(
                  message: error,
                  status: SnackBarStatus.error,
                ),
              );
              showSnackBar(snackBar: snackBar);
            }
          },
        ),
        BlocListener<PostDetailCubit, PostDetailState>(
          listener: (context, state) {
            if (state is PostUpdated) {
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: Theme.of(context).cardColor,
                content: SnackBarContent(
                  message: 'Post updated',
                  status: SnackBarStatus.success,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is PostBookmarked) {
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: Theme.of(context).cardColor,
                content: SnackBarContent(
                  message:
                      (state.post.isBookmarked == true)
                          ? 'Bookmark added'
                          : 'Bookmark removed',
                  status: SnackBarStatus.info,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      ],
      child: child,
    );
  }
}

class ConnSnackBarContent extends StatelessWidget {
  const ConnSnackBarContent({
    super.key,
    required this.text,
    required this.iconColor,
  });

  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.wifi_outlined, color: iconColor),
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
