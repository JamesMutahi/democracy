import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/view/router/router.gr.dart';

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
          page: ChatWrapper.page,
          children: [
            AutoRoute(path: ':id', page: ChatDetail.page),
            AutoRoute(path: 'create-message', page: CreateMessage.page),
            AutoRoute(path: 'edit-message', page: EditMessage.page),
            RedirectRoute(path: '', redirectTo: '/'),
          ],
        ),

        // POSTS
        AutoRoute(path: 'create-post', page: PostCreateRoute.page),
        AutoRoute(path: 'post/:id', page: PostDetail.page),
        AutoRoute(path: 'post/:id/community-notes', page: CommunityNotes.page),
        AutoRoute(
          path: 'post/:id/create-community-note',
          page: CommunityNoteCreate.page,
        ),
        AutoRoute(path: 'community-note/:id', page: CommunityNoteDetail.page),

        AutoRoute(path: 'drafts', page: DraftPosts.page),
        AutoRoute(path: 'draft/:id', page: PostUpdate.page),

        // PROFILE
        AutoRoute(
          path: 'profile',
          page: ProfileWrapper.page,
          children: [
            AutoRoute(path: ':username', page: ProfileRoute.page),
            AutoRoute(path: 'edit', page: EditProfile.page),
            AutoRoute(path: ':username/following', page: FollowingRoute.page),
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
          page: PetitionWrapper.page,
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

      ],
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
