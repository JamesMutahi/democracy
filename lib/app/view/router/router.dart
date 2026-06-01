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
      page: RootRoute.page, // Single root controlled by AuthBloc
      initial: true,
      children: [
        AutoRoute(path: '', page: HomeRoute.page, initial: true),
        AutoRoute(path: 'explore', page: ExploreRoute.page),
        AutoRoute(path: 'hub', page: Hub.page),
        AutoRoute(path: 'chat', page: ChatRoute.page),

        AutoRoute(path: 'constitution', page: Constitution.page),
        AutoRoute(path: 'bookmarks', page: Bookmarks.page),
        AutoRoute(path: 'notifications', page: Notifications.page),
        AutoRoute(path: 'preferences', page: PreferencesRoute.page),
        AutoRoute(path: 'settings', page: Settings.page, children: []),
        AutoRoute(path: 'location', page: Location.page),
        AutoRoute(path: 'search-results', page: SearchResults.page),
        AutoRoute(path: 'hub-results', page: HubResults.page),

        AutoRoute(path: 'ballots', page: BallotRoute.page),
        AutoRoute(path: 'ballot/:id', page: BallotDetail.page),

        AutoRoute(
          path: 'chat/:id',
          page: ChatDetail.page,
          children: [AutoRoute(path: 'message/:id', page: EditMessage.page)],
        ),
        AutoRoute(path: 'create-message', page: CreateMessage.page),

        AutoRoute(path: 'create-post', page: PostCreateRoute.page),
        AutoRoute(path: 'post/:id', page: PostDetail.page),
        AutoRoute(path: 'post/:id/community-notes', page: CommunityNotes.page),
        AutoRoute(
          path: 'create-community-note',
          page: CommunityNoteCreate.page,
        ),
        AutoRoute(path: 'community-note/:id', page: CommunityNoteDetail.page),

        AutoRoute(path: 'drafts', page: DraftPosts.page),
        AutoRoute(path: 'draft/:id', page: PostUpdateRoute.page),

        AutoRoute(path: 'profile/:id', page: ProfileRoute.page),
        AutoRoute(path: 'profile/:id/edit', page: EditProfile.page),
        AutoRoute(path: 'profile/:id/following', page: FollowingRoute.page),
        AutoRoute(path: 'muted-and-blocked', page: MutedAndBlocked.page),

        AutoRoute(
          path: 'follow-recommendations',
          page: FollowRecommendations.page,
        ),

        AutoRoute(path: 'users', page: UsersRoute.page),

        AutoRoute(path: 'meetings', page: MeetingRoute.page),
        AutoRoute(path: 'create-meeting', page: MeetingCreate.page),
        AutoRoute(path: 'meeting/:id', page: MeetingDetail.page),
        AutoRoute(path: 'live-stream/:id', page: LiveStream.page),

        AutoRoute(path: 'petitions', page: PetitionRoute.page),
        AutoRoute(path: 'create-petition', page: PetitionCreate.page),
        AutoRoute(
          path: 'petition/:id',
          page: PetitionDetail.page,
          children: [AutoRoute(path: 'supporters', page: Supporters.page)],
        ),

        AutoRoute(path: 'surveys', page: SurveyRoute.page),
        AutoRoute(path: 'survey-process', page: SurveyProcess.page),
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
              settings: page, // This line ensures arguments pass properly
            );
          },
        ),
      ],
    ),
  ];
}
