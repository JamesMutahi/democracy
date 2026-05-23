import 'package:democracy/app/bloc/connectivity/connectivity_bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/pages/search_results.dart';
import 'package:democracy/app/shared/pages/splash_page.dart';
import 'package:democracy/app/shared/widgets/app_logo.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/main_page.dart';
import 'package:democracy/app/view/pages/index.dart';
import 'package:democracy/app/view/widgets/bookmarks.dart';
import 'package:democracy/app/view/widgets/settings.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/bloc/login/login_cubit.dart';
import 'package:democracy/auth/view/login.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/constitution/view/constitution.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/meeting/view/meeting_create.dart';
import 'package:democracy/notification/bloc/notifications/notifications_bloc.dart';
import 'package:democracy/notification/view/notifications.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/petition_create.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_create.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/user/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

GoRouter createAppRouter({required Listenable? refreshListenable}) {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: $appRoutes,
    refreshListenable: refreshListenable,
    redirect: (context, state) {
      final authState = context.read<AuthBloc>().state;
      final socketState = context.read<WebsocketBloc>().state;

      final isLoggingIn = state.matchedLocation == '/login';
      final isOnSplash = state.matchedLocation == '/splash';
      final isOnError = state.matchedLocation == '/error';

      if (authState.status == AuthStatus.authenticating) {
        return null;
      }

      if (authState.status == AuthStatus.failure) {
        return isOnError
            ? null
            : FailureRoute(errorMessage: authState.error).location;
      }

      if (authState.status == AuthStatus.unAuthenticated) {
        return isLoggingIn ? null : const LoginRoute().location;
      }

      if (authState.status == AuthStatus.authenticated &&
          !socketState.initialConnectionAchieved) {
        return isOnSplash ? null : const SplashRoute().location;
      }

      if (isLoggingIn || isOnSplash || isOnError) {
        return const HomeRoute().location;
      }

      return null;
    },
  );
}

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: [
    TypedStatefulShellBranch<HomeBranchData>(
      routes: [
        TypedGoRoute<HomeRoute>(path: '/'),
        TypedGoRoute<ExploreRoute>(path: '/explore'),
        TypedGoRoute<HubRoute>(path: '/hub'),
        TypedGoRoute<ChatRoute>(path: '/chat'),
        TypedGoRoute<BookmarksRoute>(path: '/bookmarks'),
        TypedGoRoute<NotificationsRoute>(path: '/notifications'),
        TypedGoRoute<ConstitutionRoute>(path: '/constitution'),
        TypedGoRoute<SettingsRoute>(path: '/settings'),
        TypedGoRoute<ProfileRoute>(path: '/profile/:userId'),
        TypedGoRoute<CreatePostRoute>(path: '/create-post'),
        TypedGoRoute<CreateMeetingRoute>(path: '/create-meeting'),
        TypedGoRoute<CreateLiveStreamRoute>(path: '/create-live-stream'),
        TypedGoRoute<CreatePetitionRoute>(path: '/create-petition'),
        TypedGoRoute<SearchResultsRoute>(path: '/search-results'),
      ],
    ),
  ],
)
class AppShellRouteData extends StatefulShellRouteData {
  const AppShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return _Listeners(
      child: ThemeMod(child: MainPage(navigationShell: navigationShell)),
    );
  }
}

// =============================================================================
// 2. ROOT ROUTES
// =============================================================================

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}

@TypedGoRoute<FailureRoute>(path: '/error')
class FailureRoute extends GoRouteData with $FailureRoute {
  final String errorMessage;
  const FailureRoute({required this.errorMessage});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      _FailurePage(error: errorMessage);
}

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashPage();
}

// =============================================================================
// 3. SHELL ROUTES
// =============================================================================

class HomeBranchData extends StatefulShellBranchData {
  const HomeBranchData();
}

// Home
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return fadeInTransition(state: state, child: HomePage());
  }
}

// Explore
class ExploreRoute extends GoRouteData with $ExploreRoute {
  const ExploreRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return fadeInTransition(state: state, child: ExplorePage());
  }
}

// Hub
class HubRoute extends GoRouteData with $HubRoute {
  const HubRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return fadeInTransition(state: state, child: Hub());
  }
}

// Chat
class ChatRoute extends GoRouteData with $ChatRoute {
  const ChatRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return fadeInTransition(state: state, child: ChatPage());
  }
}

// Bookmarks
class BookmarksRoute extends GoRouteData with $BookmarksRoute {
  const BookmarksRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const Bookmarks();
}

// Notifications
class NotificationsRoute extends GoRouteData with $NotificationsRoute {
  const NotificationsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Notifications();
}

// Constitution
class ConstitutionRoute extends GoRouteData with $ConstitutionRoute {
  const ConstitutionRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Constitution();
}

// Settings
class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const Settings();
}

// Profile
class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute({required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProfilePage(userId: userId);
}

// Create Post
class CreatePostRoute extends GoRouteData with $CreatePostRoute {
  const CreatePostRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>? ?? {};

    return slideUpTransition(
      state: state,
      child: PostCreatePage(
        replyTo: extra['replyTo'] as Post?,
        repostOf: extra['repostOf'] as Post?,
        ballot: extra['ballot'] as Ballot?,
        survey: extra['survey'] as Survey?,
        petition: extra['petition'] as Petition?,
        meeting: extra['meeting'] as Meeting?,
        section: extra['section'] as Section?,
      ),
    );
  }
}

// Create Meeting
class CreateMeetingRoute extends GoRouteData with $CreateMeetingRoute {
  const CreateMeetingRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return slideUpTransition(
      state: state,
      child: MeetingCreate(isLiveStream: false),
    );
  }
}

// Create Live Stream
class CreateLiveStreamRoute extends GoRouteData with $CreateLiveStreamRoute {
  const CreateLiveStreamRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return slideUpTransition(
      state: state,
      child: MeetingCreate(isLiveStream: true),
    );
  }
}

// Create Petition
class CreatePetitionRoute extends GoRouteData with $CreatePetitionRoute {
  const CreatePetitionRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return slideUpTransition(state: state, child: CreatePetition());
  }
}

// Search Results
class SearchResultsRoute extends GoRouteData with $SearchResultsRoute {
  const SearchResultsRoute({
    required this.searchTerm,
    this.startDate,
    this.endDate,
    required this.filterCount,
  });

  final String searchTerm;
  final DateTime? startDate;
  final DateTime? endDate;
  final int filterCount;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchResults(
      searchTerm: searchTerm,
      startDate: startDate,
      endDate: endDate,
      filterCount: filterCount,
    );
  }
}

class _FailurePage extends StatelessWidget {
  const _FailurePage({required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLogo(),
              Text(error, textAlign: TextAlign.center),
              SizedBox(height: 10),
              FailureRetryButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthEvent.authenticate());
                },
              ),
            ],
          ),
        ),
      ),
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
            switch (state) {
              case LoggedOut():
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

CustomTransitionPage<T> slideUpTransition<T>({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: Curves.ease));
      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

CustomTransitionPage<T> fadeInTransition<T>({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
