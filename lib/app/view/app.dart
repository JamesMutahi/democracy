import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/bloc/theme/theme_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/view/dashboard.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/auth/view/login.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_cubit.dart';
import 'package:democracy/chat/bloc/chats/chats_cubit.dart';
import 'package:democracy/chat/bloc/message_detail/message_detail_cubit.dart';
import 'package:democracy/chat/bloc/messages/messages_cubit.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_cubit.dart';
import 'package:democracy/notification/bloc/notifications/notifications_cubit.dart';
import 'package:democracy/poll/bloc/poll_detail/poll_detail_cubit.dart';
import 'package:democracy/poll/bloc/polls/polls_cubit.dart';
import 'package:democracy/post/bloc/bookmarks/bookmarks_cubit.dart';
import 'package:democracy/post/bloc/following/following_cubit.dart';
import 'package:democracy/post/bloc/likes/likes_cubit.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/bloc/post_list/post_list_cubit.dart';
import 'package:democracy/post/bloc/replies/replies_cubit.dart';
import 'package:democracy/app/utils/view/app_theme.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/app/utils/view/splash_page.dart';
import 'package:democracy/post/bloc/user_posts/user_posts_cubit.dart';
import 'package:democracy/post/bloc/user_replies/user_replies_cubit.dart';
import 'package:democracy/survey/bloc/survey_detail/survey_detail_cubit.dart';
import 'package:democracy/survey/bloc/survey_process/answer/answer_cubit.dart';
import 'package:democracy/survey/bloc/surveys/surveys_cubit.dart';
import 'package:democracy/user/bloc/users/users_cubit.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_cubit.dart';
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
            switch (state) {
              case WebsocketConnected():
                context.read<WebsocketBloc>().add(WebsocketEvent.getPosts());
                context.read<WebsocketBloc>().add(
                  WebsocketEvent.getNotifications(),
                );
                context.read<WebsocketBloc>().add(WebsocketEvent.getPolls());
                context.read<WebsocketBloc>().add(WebsocketEvent.getSurveys());
                context.read<WebsocketBloc>().add(WebsocketEvent.getChats());
              case WebsocketSuccess(:final message):
                switch (message['stream']) {
                  case postsStream:
                    switch (message['payload']['action']) {
                      case 'list':
                        context.read<PostListCubit>().loadPosts(
                          payload: message['payload'],
                        );
                      case 'create':
                        context.read<PostDetailCubit>().created(
                          payload: message['payload'],
                        );
                      case 'update':
                        context.read<PostDetailCubit>().updated(
                          payload: message['payload'],
                        );
                      case 'delete':
                        context.read<PostDetailCubit>().deleted(
                          payload: message['payload'],
                        );
                      case 'report':
                        context.read<PostDetailCubit>().reported(
                          payload: message['payload'],
                        );
                      case 'following':
                        context.read<FollowingCubit>().loadPosts(
                          payload: message['payload'],
                        );
                      case 'replies':
                        context.read<RepliesCubit>().loadReplies(
                          payload: message['payload'],
                        );
                      case 'user_posts':
                        context.read<UserPostsCubit>().loaded(
                          payload: message['payload'],
                        );
                      case 'bookmarks':
                        context.read<BookmarksCubit>().loaded(
                          payload: message['payload'],
                        );
                      case 'liked_posts':
                        context.read<LikesCubit>().loaded(
                          payload: message['payload'],
                        );
                      case 'user_replies':
                        context.read<UserRepliesCubit>().loaded(
                          payload: message['payload'],
                        );
                    }
                  case chatsStream:
                    switch (message['payload']['action']) {
                      case 'list':
                        context.read<ChatsCubit>().loaded(
                          payload: message['payload'],
                        );
                      case 'messages':
                        context.read<MessagesCubit>().loaded(
                          payload: message['payload'],
                        );
                      case 'create':
                        if (message['payload']['request_id'] !=
                            messageRequestId) {
                          context.read<ChatDetailCubit>().created(
                            payload: message['payload'],
                          );
                        }
                        if (message['payload']['request_id'] ==
                            messageRequestId) {
                          context.read<MessageDetailCubit>().created(
                            payload: message['payload'],
                          );
                        }
                      case 'update':
                        if (message['payload']['request_id'] == chatRequestId) {
                          context.read<ChatDetailCubit>().updated(
                            payload: message['payload'],
                          );
                        }
                        if (message['payload']['request_id'] ==
                            messageRequestId) {
                          context.read<MessageDetailCubit>().updated(
                            payload: message['payload'],
                          );
                        }
                      case 'delete':
                        if (message['payload']['request_id'] ==
                            messageRequestId) {
                          context.read<MessageDetailCubit>().deleted(
                            payload: message['payload'],
                          );
                        }
                        if (message['payload']['request_id'] == chatRequestId) {
                          context.read<ChatDetailCubit>().deleted(
                            payload: message['payload'],
                          );
                        }
                      case 'direct_message':
                        context.read<ChatDetailCubit>().directMessageSent(
                          payload: message['payload'],
                        );
                    }
                  case pollsStream:
                    switch (message['payload']['action']) {
                      case 'list':
                        context.read<PollsCubit>().loaded(
                          payload: message['payload'],
                        );
                      case 'create':
                        context.read<PollDetailCubit>().created(
                          payload: message['payload'],
                        );
                      case 'update':
                        context.read<PollDetailCubit>().updated(
                          payload: message['payload'],
                        );
                      case 'delete':
                        context.read<PollDetailCubit>().deleted(
                          payload: message['payload'],
                        );
                    }
                  case surveysStream:
                    switch (message['payload']['action']) {
                      case 'list':
                        context.read<SurveysCubit>().loaded(
                          payload: message['payload'],
                        );
                      case 'create':
                        if (message['payload']['request_id'] ==
                            surveyRequestId) {
                          context.read<SurveyDetailCubit>().created(
                            payload: message['payload'],
                          );
                        }
                        if (message['payload']['request_id'] ==
                            responseRequestId) {
                          context.read<AnswerCubit>().submitted(
                            payload: message['payload'],
                          );
                        }
                      case 'update':
                        context.read<SurveyDetailCubit>().updated(
                          payload: message['payload'],
                        );
                      case 'delete':
                        context.read<SurveyDetailCubit>().deleted(
                          payload: message['payload'],
                        );
                    }
                  case usersStream:
                    switch (message['payload']['action']) {
                      case 'list':
                        context.read<UsersCubit>().loaded(
                          payload: message['payload'],
                        );
                      case 'retrieve':
                        context.read<UserDetailCubit>().loaded(
                          payload: message['payload'],
                        );
                      case 'update':
                        context.read<UserDetailCubit>().updated(
                          payload: message['payload'],
                        );
                    }
                  case notificationsStream:
                    switch (message['payload']['action']) {
                      case 'list':
                        context.read<NotificationsCubit>().loaded(
                          payload: message['payload'],
                        );
                      case 'create':
                        context.read<NotificationDetailCubit>().created(
                          payload: message['payload'],
                        );
                      case 'update':
                        context.read<NotificationDetailCubit>().updated(
                          payload: message['payload'],
                        );
                      case 'delete':
                        context.read<NotificationDetailCubit>().deleted(
                          payload: message['payload'],
                        );
                    }
                }
              case WebsocketFailure(:final error):
                context.read<PostListCubit>().websocketFailure(error: error);
                context.read<RepliesCubit>().websocketFailure(error: error);
                context.read<SurveysCubit>().websocketFailure(error: error);
                context.read<PollsCubit>().websocketFailure(error: error);
                context.read<ChatsCubit>().websocketFailure(error: error);
                context.read<NotificationsCubit>().websocketFailure(
                  error: error,
                );
                final snackBar = getSnackBar(
                  context: context,
                  message: error,
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
