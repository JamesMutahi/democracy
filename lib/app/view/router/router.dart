import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:flutter/foundation.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: RootRoute.page, // Single root controlled by Auth Bloc
      initial: true,
      children: [
        AutoRoute(path: '', page: HomeRoute.page, initial: true),
        AutoRoute(path: 'explore', page: ExploreRoute.page),

        AutoRoute(
          path: 'hub',
          page: HubWrapper.page,
          children: [
            AutoRoute(path: '', page: HubRoute.page),
            AutoRoute(path: 'results', page: HubResults.page),
            RedirectRoute(path: '', redirectTo: '/'),
          ],
        ),

        AutoRoute(path: 'chats', page: ChatRoute.page),
        if (kIsWeb) ...otherRoutes,
      ],
    ),
    if (!kIsWeb) ...otherRoutes,
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}

final otherRoutes = [
  AutoRoute(path: '${kIsWeb ? '' : '/'}constitution', page: Constitution.page),
  AutoRoute(path: '${kIsWeb ? '' : '/'}bookmarks', page: Bookmarks.page),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}notifications',
    page: Notifications.page,
  ),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}preferences',
    page: PreferencesRoute.page,
  ),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}settings',
    page: Settings.page,
    children: [],
  ),
  AutoRoute(path: '${kIsWeb ? '' : '/'}location', page: Location.page),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}search-results',
    page: SearchResults.page,
  ),

  // BALLOTS
  AutoRoute(path: '${kIsWeb ? '' : '/'}ballots', page: BallotRoute.page),
  AutoRoute(path: '${kIsWeb ? '' : '/'}ballot/:id', page: BallotDetail.page),

  // MESSAGES
  AutoRoute(path: '${kIsWeb ? '' : '/'}chat/:id', page: ChatDetail.page),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}chat/create-message',
    page: CreateMessage.page,
  ),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}chat/edit-message',
    page: EditMessage.page,
  ),

  // POSTS
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}create-post',
    page: PostCreateRoute.page,
  ),
  AutoRoute(path: '${kIsWeb ? '' : '/'}post/:id', page: PostDetail.page),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}post/:id/community-notes',
    page: CommunityNotes.page,
  ),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}post/:id/create-community-note',
    page: CommunityNoteCreate.page,
  ),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}community-note/:id',
    page: CommunityNoteDetail.page,
  ),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}post/:id/reposts',
    page: Reposts.page,
  ),
  AutoRoute(path: '${kIsWeb ? '' : '/'}drafts', page: DraftPosts.page),
  AutoRoute(path: '${kIsWeb ? '' : '/'}draft/:id', page: PostUpdate.page),

  // PROFILE
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}profile/:username',
    page: ProfileRoute.page,
  ),
  AutoRoute(path: '${kIsWeb ? '' : '/'}profile/edit', page: EditProfile.page),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}profile/:username/following',
    page: FollowingRoute.page,
  ),

  AutoRoute(
    path: '${kIsWeb ? '' : '/'}muted-and-blocked',
    page: MutedAndBlocked.page,
  ),

  AutoRoute(
    path: '${kIsWeb ? '' : '/'}follow-recommendations',
    page: FollowRecommendations.page,
  ),

  AutoRoute(path: '${kIsWeb ? '' : '/'}users', page: UsersRoute.page),

  // BROADCASTS
  AutoRoute(path: '${kIsWeb ? '' : '/'}meetings', page: MeetingRoute.page),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}create-broadcast',
    page: BroadcastCreate.page,
  ),
  AutoRoute(path: '${kIsWeb ? '' : '/'}meeting/:id', page: MeetingDetail.page),
  AutoRoute(path: '${kIsWeb ? '' : '/'}live-stream/:id', page: LiveStream.page),

  // PETITIONS
  AutoRoute(path: '${kIsWeb ? '' : '/'}petitions', page: PetitionRoute.page),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}create-petition',
    page: PetitionCreate.page,
  ),

  AutoRoute(
    path: '${kIsWeb ? '' : '/'}petition/:id',
    page: PetitionDetail.page,
  ),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}petition/:id/supporters',
    page: Supporters.page,
  ),

  // SURVEYS
  AutoRoute(path: '${kIsWeb ? '' : '/'}surveys', page: SurveyRoute.page),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}survey/:id/process',
    page: SurveyProcess.page,
  ),
  AutoRoute(
    path: '${kIsWeb ? '' : '/'}survey/:id/response',
    page: ResponseRoute.page,
  ),
];
