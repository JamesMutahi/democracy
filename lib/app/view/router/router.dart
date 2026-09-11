import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
        AutoRoute(
          path: '',
          page: Dashboard.page,
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
                RedirectRoute(path: '*', redirectTo: '/hub'),
              ],
            ),

            AutoRoute(path: 'chats', page: ChatRoute.page),

            if (kIsWeb) ...otherRoutes,
          ],
        ),
        if (!kIsWeb) ...otherRoutes,
        CustomRoute(
          page: PostCreate.page,
          customRouteBuilder: <T>(context, child, page) {
            return DialogRoute<T>(
              context: context,
              builder: (context) => child,
              settings: page,
            );
          },
        ),
        CustomRoute(
          page: CommunityNoteCreate.page,
          customRouteBuilder: <T>(context, child, page) {
            return DialogRoute<T>(
              context: context,
              builder: (context) => child,
              settings: page,
            );
          },
        ),
        CustomRoute(
          page: BroadcastCreate.page,
          customRouteBuilder: <T>(context, child, page) {
            return DialogRoute<T>(
              context: context,
              builder: (context) => child,
              settings: page,
            );
          },
        ),
        CustomRoute(
          page: PetitionCreate.page,
          customRouteBuilder: <T>(context, child, page) {
            return DialogRoute<T>(
              context: context,
              builder: (context) => child,
              settings: page,
            );
          },
        ),
      ],
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}

final otherRoutes = [
  AutoRoute(path: 'constitution', page: Constitution.page),
  AutoRoute(path: 'bookmarks', page: Bookmarks.page),
  AutoRoute(path: 'notifications', page: Notifications.page),
  AutoRoute(path: 'preferences', page: PreferencesRoute.page),
  AutoRoute(path: 'settings', page: Settings.page),
  AutoRoute(path: 'location', page: Location.page),
  AutoRoute(path: 'search-results', page: SearchResults.page),

  // BALLOTS
  AutoRoute(path: 'ballots', page: BallotRoute.page),
  AutoRoute(path: 'ballot/:id', page: BallotDetail.page),

  // MESSAGES
  AutoRoute(path: 'chat/:id', page: ChatDetail.page),
  AutoRoute(path: 'chat/edit-message', page: EditMessage.page),

  // POSTS
  AutoRoute(path: 'post/:id', page: PostDetail.page),
  AutoRoute(path: 'post/:id/community-notes', page: CommunityNotes.page),
  AutoRoute(path: 'community-note/:id', page: CommunityNoteDetail.page),
  AutoRoute(path: 'post/:id/reposts', page: Reposts.page),
  AutoRoute(path: 'drafts', page: DraftPosts.page),
  AutoRoute(path: 'draft/:id', page: PostUpdate.page),

  // PROFILE
  AutoRoute(path: 'profile/:username', page: ProfileRoute.page),
  AutoRoute(path: 'profile/edit', page: EditProfile.page),
  AutoRoute(path: 'profile/:username/following', page: FollowingRoute.page),

  AutoRoute(path: 'muted-and-blocked', page: MutedAndBlocked.page),

  AutoRoute(path: 'follow-recommendations', page: FollowRecommendations.page),

  AutoRoute(path: 'users', page: UsersRoute.page),

  // BROADCASTS
  AutoRoute(path: 'meetings', page: MeetingRoute.page),
  AutoRoute(path: 'meeting/:id', page: MeetingDetail.page),
  AutoRoute(path: 'live-stream/:id', page: LiveStream.page),

  // PETITIONS
  AutoRoute(path: 'petitions', page: PetitionRoute.page),

  AutoRoute(path: 'petition/:id', page: PetitionDetail.page),
  AutoRoute(path: 'petition/:id/supporters', page: Supporters.page),

  // SURVEYS
  AutoRoute(path: 'surveys', page: SurveyRoute.page),
  AutoRoute(path: 'survey/:id', page: SurveyDetail.page),
  AutoRoute(path: 'survey/:id/process', page: SurveyProcess.page),
];
