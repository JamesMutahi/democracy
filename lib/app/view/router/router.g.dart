// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $appShellRouteData,
  $loginRoute,
  $failureRoute,
  $splashRoute,
];

RouteBase get $appShellRouteData => StatefulShellRouteData.$route(
  factory: $AppShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/', factory: $HomeRoute._fromState),
        GoRouteData.$route(path: '/explore', factory: $ExploreRoute._fromState),
        GoRouteData.$route(path: '/hub', factory: $HubRoute._fromState),
        GoRouteData.$route(path: '/chat', factory: $ChatRoute._fromState),
        GoRouteData.$route(
          path: '/bookmarks',
          factory: $BookmarksRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/notifications',
          factory: $NotificationsRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/constitution',
          factory: $ConstitutionRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/settings',
          factory: $SettingsRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/profile/:userId',
          factory: $ProfileRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/create-post',
          factory: $CreatePostRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/create-meeting',
          factory: $CreateMeetingRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/create-live-stream',
          factory: $CreateLiveStreamRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/create-petition',
          factory: $CreatePetitionRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/search-results',
          factory: $SearchResultsRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      const AppShellRouteData();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ExploreRoute on GoRouteData {
  static ExploreRoute _fromState(GoRouterState state) => const ExploreRoute();

  @override
  String get location => GoRouteData.$location('/explore');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $HubRoute on GoRouteData {
  static HubRoute _fromState(GoRouterState state) => const HubRoute();

  @override
  String get location => GoRouteData.$location('/hub');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ChatRoute on GoRouteData {
  static ChatRoute _fromState(GoRouterState state) => const ChatRoute();

  @override
  String get location => GoRouteData.$location('/chat');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BookmarksRoute on GoRouteData {
  static BookmarksRoute _fromState(GoRouterState state) =>
      const BookmarksRoute();

  @override
  String get location => GoRouteData.$location('/bookmarks');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $NotificationsRoute on GoRouteData {
  static NotificationsRoute _fromState(GoRouterState state) =>
      const NotificationsRoute();

  @override
  String get location => GoRouteData.$location('/notifications');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ConstitutionRoute on GoRouteData {
  static ConstitutionRoute _fromState(GoRouterState state) =>
      const ConstitutionRoute();

  @override
  String get location => GoRouteData.$location('/constitution');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProfileRoute on GoRouteData {
  static ProfileRoute _fromState(GoRouterState state) =>
      ProfileRoute(userId: int.parse(state.pathParameters['userId']!));

  ProfileRoute get _self => this as ProfileRoute;

  @override
  String get location => GoRouteData.$location(
    '/profile/${Uri.encodeComponent(_self.userId.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreatePostRoute on GoRouteData {
  static CreatePostRoute _fromState(GoRouterState state) =>
      const CreatePostRoute();

  @override
  String get location => GoRouteData.$location('/create-post');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateMeetingRoute on GoRouteData {
  static CreateMeetingRoute _fromState(GoRouterState state) =>
      const CreateMeetingRoute();

  @override
  String get location => GoRouteData.$location('/create-meeting');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateLiveStreamRoute on GoRouteData {
  static CreateLiveStreamRoute _fromState(GoRouterState state) =>
      const CreateLiveStreamRoute();

  @override
  String get location => GoRouteData.$location('/create-live-stream');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreatePetitionRoute on GoRouteData {
  static CreatePetitionRoute _fromState(GoRouterState state) =>
      const CreatePetitionRoute();

  @override
  String get location => GoRouteData.$location('/create-petition');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SearchResultsRoute on GoRouteData {
  static SearchResultsRoute _fromState(GoRouterState state) =>
      SearchResultsRoute(
        searchTerm: state.uri.queryParameters['search-term']!,
        startDate: _$convertMapValue(
          'start-date',
          state.uri.queryParameters,
          DateTime.tryParse,
        ),
        endDate: _$convertMapValue(
          'end-date',
          state.uri.queryParameters,
          DateTime.tryParse,
        ),
        filterCount: int.parse(state.uri.queryParameters['filter-count']!),
      );

  SearchResultsRoute get _self => this as SearchResultsRoute;

  @override
  String get location => GoRouteData.$location(
    '/search-results',
    queryParams: {
      'search-term': _self.searchTerm,
      if (_self.startDate != null) 'start-date': _self.startDate!.toString(),
      if (_self.endDate != null) 'end-date': _self.endDate!.toString(),
      'filter-count': _self.filterCount.toString(),
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

RouteBase get $loginRoute =>
    GoRouteData.$route(path: '/login', factory: $LoginRoute._fromState);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $failureRoute =>
    GoRouteData.$route(path: '/error', factory: $FailureRoute._fromState);

mixin $FailureRoute on GoRouteData {
  static FailureRoute _fromState(GoRouterState state) =>
      FailureRoute(errorMessage: state.uri.queryParameters['error-message']!);

  FailureRoute get _self => this as FailureRoute;

  @override
  String get location => GoRouteData.$location(
    '/error',
    queryParams: {'error-message': _self.errorMessage},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $splashRoute =>
    GoRouteData.$route(path: '/splash', factory: $SplashRoute._fromState);

mixin $SplashRoute on GoRouteData {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  @override
  String get location => GoRouteData.$location('/splash');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
