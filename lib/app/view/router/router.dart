import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/view/router/router.gr.dart';
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
        AutoRoute(path: '', page: HomeRoute.page, initial: true),
        AutoRoute(path: 'explore', page: ExploreRoute.page),

        AutoRoute(
          path: 'hub',
          page: HubShell.page,
          children: [
            AutoRoute(path: '', page: Hub.page),
            AutoRoute(path: 'results', page: HubResults.page),
            RedirectRoute(path: '', redirectTo: '/'),
          ],
        ),

        AutoRoute(path: 'chats', page: ChatRoute.page),

        AutoRoute(path: 'constitution', page: Constitution.page),
        AutoRoute(path: 'bookmarks', page: Bookmarks.page),
        AutoRoute(path: 'notifications', page: Notifications.page),
        AutoRoute(path: 'preferences', page: PreferencesRoute.page),
        AutoRoute(path: 'settings', page: Settings.page, children: []),
        AutoRoute(path: 'location', page: Location.page),
        AutoRoute(path: 'search-results', page: SearchResults.page),

        // BALLOTS
        AutoRoute(path: 'ballots', page: BallotRoute.page),
        AutoRoute(path: 'ballot/:id', page: BallotDetail.page),

        // MESSAGES
        AutoRoute(
          path: 'chat',
          page: ChatShell.page,
          children: [
            AutoRoute(path: ':id', page: ChatDetail.page),
            AutoRoute(path: 'create-message', page: CreateMessage.page),
            AutoRoute(path: 'edit-message', page: EditMessage.page),
            RedirectRoute(path: '', redirectTo: '/'),
          ],
        ),

        // POSTS
        AutoRoute(path: 'create-post', page: PostCreateRoute.page),
        AutoRoute(
          path: 'post',
          page: PostShell.page,
          children: [
            AutoRoute(path: ':id', page: PostDetail.page),
            AutoRoute(path: ':id/community-notes', page: CommunityNotes.page),
            AutoRoute(
              path: ':id/create-community-note',
              page: CommunityNoteCreate.page,
            ),
            RedirectRoute(path: '', redirectTo: '/'),
          ],
        ),
        AutoRoute(path: 'community-note/:id', page: CommunityNoteDetail.page),

        AutoRoute(path: 'drafts', page: DraftPosts.page),
        AutoRoute(path: 'draft/:id', page: PostUpdate.page),

        // PROFILE
        AutoRoute(
          path: 'profile',
          page: ProfileShell.page,
          children: [
            AutoRoute(path: ':id', page: ProfileRoute.page),
            AutoRoute(path: 'edit', page: EditProfile.page),
            AutoRoute(path: ':id/:name/following', page: FollowingRoute.page),
            RedirectRoute(path: '', redirectTo: '/'),
          ],
        ),

        AutoRoute(path: 'muted-and-blocked', page: MutedAndBlocked.page),

        AutoRoute(
          path: 'follow-recommendations',
          page: FollowRecommendations.page,
        ),

        AutoRoute(path: 'users', page: UsersRoute.page),

        // BROADCASTS
        AutoRoute(path: 'meetings', page: MeetingRoute.page),
        AutoRoute(path: 'create-broadcast', page: BroadcastCreate.page),
        AutoRoute(path: 'meeting/:id', page: MeetingDetail.page),
        AutoRoute(path: 'live-stream/:id', page: LiveStream.page),

        // PETITIONS
        AutoRoute(path: 'petitions', page: PetitionRoute.page),
        AutoRoute(path: 'create-petition', page: PetitionCreate.page),
        AutoRoute(
          path: 'petition',
          page: PetitionShell.page,
          children: [
            AutoRoute(path: ':id', page: PetitionDetail.page),
            AutoRoute(path: ':id/supporters', page: Supporters.page),
            RedirectRoute(path: '', redirectTo: '/'),
          ],
        ),

        // SURVEYS
        AutoRoute(path: 'surveys', page: SurveyRoute.page),
        AutoRoute(path: 'survey/:id/process', page: SurveyProcess.page),
        AutoRoute(path: 'survey/:id/response', page: ResponseRoute.page),

        CustomRoute(
          page: CreationBottomSheet.page,
          customRouteBuilder: <T>(context, child, page) {
            return ModalBottomSheetRoute<T>(
              builder: (context) => child,
              isScrollControlled: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              settings: page, // Ensures arguments pass properly
            );
          },
        ),
      ],
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
