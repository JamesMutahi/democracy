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
import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_cubit.dart';
import 'package:democracy/ballot/bloc/ballots/ballots_cubit.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_cubit.dart';
import 'package:democracy/chat/bloc/chats/chats_cubit.dart';
import 'package:democracy/chat/bloc/message_detail/message_detail_cubit.dart';
import 'package:democracy/chat/bloc/messages/messages_cubit.dart';
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
import 'package:democracy/survey/bloc/surveys/surveys_cubit.dart';
import 'package:democracy/user/bloc/blocked/blocked_cubit.dart';
import 'package:democracy/user/bloc/followers/followers_cubit.dart';
import 'package:democracy/user/bloc/following/following_cubit.dart';
import 'package:democracy/user/bloc/muted/muted_cubit.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_cubit.dart';
import 'package:democracy/user/bloc/users/users_cubit.dart';
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
        value:
            isDarkMode
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
            if (state.status == WebsocketStatus.success) {
              final message = state.message;
              switch (message['stream']) {
                case postsStream:
                  switch (message['payload']['action']) {
                    case 'for_you':
                      context.read<ForYouCubit>().loaded(
                        payload: message['payload'],
                      );
                    case 'list':
                      context.read<PostsCubit>().loaded(
                        payload: message['payload'],
                      );
                    case 'create':
                      context.read<PostDetailCubit>().created(
                        payload: message['payload'],
                      );
                    case 'retrieve':
                      context.read<PostDetailCubit>().loaded(
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
                    case 'bookmark':
                      final snackBar = getSnackBar(
                        context: context,
                        message: message['payload']['data']['message'],
                        status: SnackBarStatus.info,
                      );
                      showSnackBar(snackBar: snackBar);
                    case 'report':
                      context.read<PostDetailCubit>().reported(
                        payload: message['payload'],
                      );
                    case 'following':
                      context.read<FollowingPostsCubit>().loaded(
                        payload: message['payload'],
                      );
                    case 'replies':
                      context.read<RepliesCubit>().loaded(
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
                    case 'draft_posts':
                      context.read<DraftPostsCubit>().loaded(
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
                    case 'retrieve':
                      context.read<ChatDetailCubit>().loaded(
                        payload: message['payload'],
                      );
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
                case ballotsStream:
                  switch (message['payload']['action']) {
                    case 'list':
                      context.read<BallotsCubit>().loaded(
                        payload: message['payload'],
                      );
                    case 'create':
                      context.read<BallotDetailCubit>().created(
                        payload: message['payload'],
                      );
                    case 'update':
                      context.read<BallotDetailCubit>().updated(
                        payload: message['payload'],
                      );
                    case 'delete':
                      context.read<BallotDetailCubit>().deleted(
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
                      if (message['payload']['request_id'] == surveyRequestId) {
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
                    case 'mute':
                      context.read<UserDetailCubit>().updated(
                        payload: message['payload'],
                      );
                      if (message['payload']['response_status'] == 200) {
                        late String msg;
                        if (message['payload']['data']['is_muted']) {
                          msg = 'Muted';
                        } else {
                          msg = 'Mute removed';
                        }
                        final snackBar = getSnackBar(
                          context: context,
                          message: msg,
                          status: SnackBarStatus.info,
                          actionLabel: 'Undo',
                          onActionPressed: () {
                            context.read<WebsocketBloc>().add(
                              WebsocketEvent.muteUser(
                                id: message['payload']['data']['id'],
                              ),
                            );
                          },
                        );
                        showSnackBar(snackBar: snackBar);
                      }
                    case 'block':
                      context.read<UserDetailCubit>().updated(
                        payload: message['payload'],
                      );
                      if (message['payload']['response_status'] == 200) {
                        late String msg;
                        if (message['payload']['data']['is_blocked']) {
                          msg = 'Blocked';
                        } else {
                          msg = 'Block removed';
                        }
                        final snackBar = getSnackBar(
                          context: context,
                          message: msg,
                          status: SnackBarStatus.info,
                          actionLabel: 'Undo',
                          onActionPressed: () {
                            context.read<WebsocketBloc>().add(
                              WebsocketEvent.blockUser(
                                id: message['payload']['data']['id'],
                              ),
                            );
                          },
                        );
                        showSnackBar(snackBar: snackBar);
                      }
                    case 'following':
                      context.read<FollowingCubit>().loaded(
                        payload: message['payload'],
                      );
                    case 'followers':
                      context.read<FollowersCubit>().loaded(
                        payload: message['payload'],
                      );
                    case 'muted':
                      context.read<MutedCubit>().loaded(
                        payload: message['payload'],
                      );
                    case 'blocked':
                      context.read<BlockedCubit>().loaded(
                        payload: message['payload'],
                      );
                    case 'petition_supporters':
                      context.read<SupportersCubit>().loaded(
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
                    case 'preferences':
                    case 'update_preferences':
                      context.read<PreferencesCubit>().loaded(
                        payload: message['payload'],
                      );
                  }
                case petitionsStream:
                  switch (message['payload']['action']) {
                    case 'list':
                      context.read<PetitionsCubit>().loaded(
                        payload: message['payload'],
                      );
                    case 'create':
                      context.read<PetitionDetailCubit>().created(
                        payload: message['payload'],
                      );
                    case 'update':
                      context.read<PetitionDetailCubit>().updated(
                        payload: message['payload'],
                      );
                    case 'delete':
                      context.read<PetitionDetailCubit>().deleted(
                        payload: message['payload'],
                      );
                    case 'user_petitions':
                      context.read<UserPetitionsCubit>().loaded(
                        payload: message['payload'],
                      );
                  }
              }
            }
            if (state.status == WebsocketStatus.failure) {
              String error = 'Server error';
              context.read<ForYouCubit>().websocketFailure(error: error);
              context.read<PostsCubit>().websocketFailure(error: error);
              context.read<RepliesCubit>().websocketFailure(error: error);
              context.read<SurveysCubit>().websocketFailure(error: error);
              context.read<BallotsCubit>().websocketFailure(error: error);
              context.read<ChatsCubit>().websocketFailure(error: error);
              context.read<NotificationsCubit>().websocketFailure(error: error);
              final snackBar = getSnackBar(
                context: context,
                message: error,
                status: SnackBarStatus.failure,
              );
              showSnackBar(snackBar: snackBar);
            }
            if (state.status == WebsocketStatus.disconnected) {
              String error = 'Server connection lost';
              context.read<ForYouCubit>().websocketFailure(error: error);
              context.read<PostsCubit>().websocketFailure(error: error);
              context.read<RepliesCubit>().websocketFailure(error: error);
              context.read<SurveysCubit>().websocketFailure(error: error);
              context.read<BallotsCubit>().websocketFailure(error: error);
              context.read<ChatsCubit>().websocketFailure(error: error);
              context.read<NotificationsCubit>().websocketFailure(error: error);
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
