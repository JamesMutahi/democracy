// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i46;
import 'package:collection/collection.dart' as _i59;
import 'package:democracy/app/shared/pages/location.dart' as _i22;
import 'package:democracy/app/shared/pages/search_results.dart' as _i39;
import 'package:democracy/app/view/pages/chat_page.dart' as _i5;
import 'package:democracy/app/view/pages/explore_page.dart' as _i15;
import 'package:democracy/app/view/pages/home_page.dart' as _i19;
import 'package:democracy/app/view/pages/hub.dart' as _i20;
import 'package:democracy/app/view/root.dart' as _i38;
import 'package:democracy/app/view/widgets/bookmarks.dart' as _i3;
import 'package:democracy/app/view/widgets/creation_bottom_sheet.dart' as _i11;
import 'package:democracy/app/view/widgets/settings.dart' as _i40;
import 'package:democracy/auth/view/failure.dart' as _i16;
import 'package:democracy/auth/view/login.dart' as _i23;
import 'package:democracy/auth/view/splash.dart' as _i41;
import 'package:democracy/ballot/models/ballot.dart' as _i53;
import 'package:democracy/ballot/view/ballot_detail.dart' as _i1;
import 'package:democracy/ballot/view/ballot_page.dart' as _i2;
import 'package:democracy/chat/models/chat.dart' as _i49;
import 'package:democracy/chat/models/message.dart' as _i50;
import 'package:democracy/chat/view/chat_detail.dart' as _i4;
import 'package:democracy/chat/view/create_message.dart' as _i10;
import 'package:democracy/chat/view/edit_message.dart' as _i13;
import 'package:democracy/constitution/models/section.dart' as _i57;
import 'package:democracy/constitution/view/constitution.dart' as _i9;
import 'package:democracy/meeting/models/meeting.dart' as _i56;
import 'package:democracy/meeting/view/live_stream.dart' as _i21;
import 'package:democracy/meeting/view/meeting_create.dart' as _i24;
import 'package:democracy/meeting/view/meeting_detail.dart' as _i25;
import 'package:democracy/meeting/view/meeting_page.dart' as _i26;
import 'package:democracy/notification/view/notifications.dart' as _i28;
import 'package:democracy/notification/view/preferences.dart' as _i35;
import 'package:democracy/petition/models/petition.dart' as _i55;
import 'package:democracy/petition/view/petition_create.dart' as _i29;
import 'package:democracy/petition/view/petition_detail.dart' as _i30;
import 'package:democracy/petition/view/petition_page.dart' as _i31;
import 'package:democracy/petition/view/widgets/supporters.dart' as _i42;
import 'package:democracy/post/models/draft_post.dart' as _i58;
import 'package:democracy/post/models/post.dart' as _i48;
import 'package:democracy/post/view/community_note_create.dart' as _i6;
import 'package:democracy/post/view/community_note_detail.dart' as _i7;
import 'package:democracy/post/view/community_notes.dart' as _i8;
import 'package:democracy/post/view/draft_posts.dart' as _i12;
import 'package:democracy/post/view/post_create.dart' as _i32;
import 'package:democracy/post/view/post_detail.dart' as _i33;
import 'package:democracy/post/view/post_update.dart' as _i34;
import 'package:democracy/survey/models/survey.dart' as _i54;
import 'package:democracy/survey/view/survey_page.dart' as _i43;
import 'package:democracy/survey/view/survey_process/page.dart' as _i44;
import 'package:democracy/survey/view/survey_process/response_page.dart'
    as _i37;
import 'package:democracy/user/models/user.dart' as _i51;
import 'package:democracy/user/view/edit_profile.dart' as _i14;
import 'package:democracy/user/view/pages/follow_recommendations.dart' as _i17;
import 'package:democracy/user/view/pages/following.dart' as _i18;
import 'package:democracy/user/view/pages/muted_and_blocked.dart' as _i27;
import 'package:democracy/user/view/pages/users.dart' as _i45;
import 'package:democracy/user/view/profile.dart' as _i36;
import 'package:flutter/material.dart' as _i47;
import 'package:latlong2/latlong.dart' as _i52;

/// generated route for
/// [_i1.BallotDetail]
class BallotDetail extends _i46.PageRouteInfo<BallotDetailArgs> {
  BallotDetail({
    _i47.Key? key,
    required int ballotId,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         BallotDetail.name,
         args: BallotDetailArgs(key: key, ballotId: ballotId),
         rawPathParams: {'id': ballotId},
         initialChildren: children,
       );

  static const String name = 'BallotDetail';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<BallotDetailArgs>(
        orElse: () => BallotDetailArgs(ballotId: pathParams.getInt('id')),
      );
      return _i1.BallotDetail(key: args.key, ballotId: args.ballotId);
    },
  );
}

class BallotDetailArgs {
  const BallotDetailArgs({this.key, required this.ballotId});

  final _i47.Key? key;

  final int ballotId;

  @override
  String toString() {
    return 'BallotDetailArgs{key: $key, ballotId: $ballotId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BallotDetailArgs) return false;
    return key == other.key && ballotId == other.ballotId;
  }

  @override
  int get hashCode => key.hashCode ^ ballotId.hashCode;
}

/// generated route for
/// [_i2.BallotPage]
class BallotRoute extends _i46.PageRouteInfo<void> {
  const BallotRoute({List<_i46.PageRouteInfo>? children})
    : super(BallotRoute.name, initialChildren: children);

  static const String name = 'BallotRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i2.BallotPage();
    },
  );
}

/// generated route for
/// [_i3.Bookmarks]
class Bookmarks extends _i46.PageRouteInfo<void> {
  const Bookmarks({List<_i46.PageRouteInfo>? children})
    : super(Bookmarks.name, initialChildren: children);

  static const String name = 'Bookmarks';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i3.Bookmarks();
    },
  );
}

/// generated route for
/// [_i4.ChatDetail]
class ChatDetail extends _i46.PageRouteInfo<ChatDetailArgs> {
  ChatDetail({
    _i47.Key? key,
    required int chatId,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         ChatDetail.name,
         args: ChatDetailArgs(key: key, chatId: chatId),
         rawPathParams: {'id': chatId},
         initialChildren: children,
       );

  static const String name = 'ChatDetail';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ChatDetailArgs>(
        orElse: () => ChatDetailArgs(chatId: pathParams.getInt('id')),
      );
      return _i4.ChatDetail(key: args.key, chatId: args.chatId);
    },
  );
}

class ChatDetailArgs {
  const ChatDetailArgs({this.key, required this.chatId});

  final _i47.Key? key;

  final int chatId;

  @override
  String toString() {
    return 'ChatDetailArgs{key: $key, chatId: $chatId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChatDetailArgs) return false;
    return key == other.key && chatId == other.chatId;
  }

  @override
  int get hashCode => key.hashCode ^ chatId.hashCode;
}

/// generated route for
/// [_i5.ChatPage]
class ChatRoute extends _i46.PageRouteInfo<void> {
  const ChatRoute({List<_i46.PageRouteInfo>? children})
    : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i5.ChatPage();
    },
  );
}

/// generated route for
/// [_i6.CommunityNoteCreate]
class CommunityNoteCreate extends _i46.PageRouteInfo<CommunityNoteCreateArgs> {
  CommunityNoteCreate({
    _i47.Key? key,
    required _i48.Post post,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         CommunityNoteCreate.name,
         args: CommunityNoteCreateArgs(key: key, post: post),
         initialChildren: children,
       );

  static const String name = 'CommunityNoteCreate';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CommunityNoteCreateArgs>();
      return _i6.CommunityNoteCreate(key: args.key, post: args.post);
    },
  );
}

class CommunityNoteCreateArgs {
  const CommunityNoteCreateArgs({this.key, required this.post});

  final _i47.Key? key;

  final _i48.Post post;

  @override
  String toString() {
    return 'CommunityNoteCreateArgs{key: $key, post: $post}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CommunityNoteCreateArgs) return false;
    return key == other.key && post == other.post;
  }

  @override
  int get hashCode => key.hashCode ^ post.hashCode;
}

/// generated route for
/// [_i7.CommunityNoteDetail]
class CommunityNoteDetail extends _i46.PageRouteInfo<CommunityNoteDetailArgs> {
  CommunityNoteDetail({
    _i47.Key? key,
    required int postId,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         CommunityNoteDetail.name,
         args: CommunityNoteDetailArgs(key: key, postId: postId),
         rawPathParams: {'id': postId},
         initialChildren: children,
       );

  static const String name = 'CommunityNoteDetail';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<CommunityNoteDetailArgs>(
        orElse: () => CommunityNoteDetailArgs(postId: pathParams.getInt('id')),
      );
      return _i7.CommunityNoteDetail(key: args.key, postId: args.postId);
    },
  );
}

class CommunityNoteDetailArgs {
  const CommunityNoteDetailArgs({this.key, required this.postId});

  final _i47.Key? key;

  final int postId;

  @override
  String toString() {
    return 'CommunityNoteDetailArgs{key: $key, postId: $postId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CommunityNoteDetailArgs) return false;
    return key == other.key && postId == other.postId;
  }

  @override
  int get hashCode => key.hashCode ^ postId.hashCode;
}

/// generated route for
/// [_i8.CommunityNotes]
class CommunityNotes extends _i46.PageRouteInfo<CommunityNotesArgs> {
  CommunityNotes({
    _i47.Key? key,
    required _i48.Post post,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         CommunityNotes.name,
         args: CommunityNotesArgs(key: key, post: post),
         initialChildren: children,
       );

  static const String name = 'CommunityNotes';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CommunityNotesArgs>();
      return _i8.CommunityNotes(key: args.key, post: args.post);
    },
  );
}

class CommunityNotesArgs {
  const CommunityNotesArgs({this.key, required this.post});

  final _i47.Key? key;

  final _i48.Post post;

  @override
  String toString() {
    return 'CommunityNotesArgs{key: $key, post: $post}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CommunityNotesArgs) return false;
    return key == other.key && post == other.post;
  }

  @override
  int get hashCode => key.hashCode ^ post.hashCode;
}

/// generated route for
/// [_i9.Constitution]
class Constitution extends _i46.PageRouteInfo<ConstitutionArgs> {
  Constitution({
    _i47.Key? key,
    int? sectionId,
    bool selectionMode = false,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         Constitution.name,
         args: ConstitutionArgs(
           key: key,
           sectionId: sectionId,
           selectionMode: selectionMode,
         ),
         rawQueryParams: {'id': sectionId, 'select': selectionMode},
         initialChildren: children,
       );

  static const String name = 'Constitution';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<ConstitutionArgs>(
        orElse: () => ConstitutionArgs(
          sectionId: queryParams.optInt('id'),
          selectionMode: queryParams.getBool('select', false),
        ),
      );
      return _i9.Constitution(
        key: args.key,
        sectionId: args.sectionId,
        selectionMode: args.selectionMode,
      );
    },
  );
}

class ConstitutionArgs {
  const ConstitutionArgs({
    this.key,
    this.sectionId,
    this.selectionMode = false,
  });

  final _i47.Key? key;

  final int? sectionId;

  final bool selectionMode;

  @override
  String toString() {
    return 'ConstitutionArgs{key: $key, sectionId: $sectionId, selectionMode: $selectionMode}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ConstitutionArgs) return false;
    return key == other.key &&
        sectionId == other.sectionId &&
        selectionMode == other.selectionMode;
  }

  @override
  int get hashCode =>
      key.hashCode ^ sectionId.hashCode ^ selectionMode.hashCode;
}

/// generated route for
/// [_i10.CreateMessage]
class CreateMessage extends _i46.PageRouteInfo<void> {
  const CreateMessage({List<_i46.PageRouteInfo>? children})
    : super(CreateMessage.name, initialChildren: children);

  static const String name = 'CreateMessage';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i10.CreateMessage();
    },
  );
}

/// generated route for
/// [_i11.CreationBottomSheet]
class CreationBottomSheet extends _i46.PageRouteInfo<void> {
  const CreationBottomSheet({List<_i46.PageRouteInfo>? children})
    : super(CreationBottomSheet.name, initialChildren: children);

  static const String name = 'CreationBottomSheet';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i11.CreationBottomSheet();
    },
  );
}

/// generated route for
/// [_i12.DraftPosts]
class DraftPosts extends _i46.PageRouteInfo<void> {
  const DraftPosts({List<_i46.PageRouteInfo>? children})
    : super(DraftPosts.name, initialChildren: children);

  static const String name = 'DraftPosts';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i12.DraftPosts();
    },
  );
}

/// generated route for
/// [_i13.EditMessage]
class EditMessage extends _i46.PageRouteInfo<EditMessageArgs> {
  EditMessage({
    _i47.Key? key,
    required _i49.Chat chat,
    required _i50.Message message,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         EditMessage.name,
         args: EditMessageArgs(key: key, chat: chat, message: message),
         initialChildren: children,
       );

  static const String name = 'EditMessage';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditMessageArgs>();
      return _i13.EditMessage(
        key: args.key,
        chat: args.chat,
        message: args.message,
      );
    },
  );
}

class EditMessageArgs {
  const EditMessageArgs({this.key, required this.chat, required this.message});

  final _i47.Key? key;

  final _i49.Chat chat;

  final _i50.Message message;

  @override
  String toString() {
    return 'EditMessageArgs{key: $key, chat: $chat, message: $message}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditMessageArgs) return false;
    return key == other.key && chat == other.chat && message == other.message;
  }

  @override
  int get hashCode => key.hashCode ^ chat.hashCode ^ message.hashCode;
}

/// generated route for
/// [_i14.EditProfile]
class EditProfile extends _i46.PageRouteInfo<EditProfileArgs> {
  EditProfile({
    _i47.Key? key,
    required _i51.User user,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         EditProfile.name,
         args: EditProfileArgs(key: key, user: user),
         initialChildren: children,
       );

  static const String name = 'EditProfile';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditProfileArgs>();
      return _i14.EditProfile(key: args.key, user: args.user);
    },
  );
}

class EditProfileArgs {
  const EditProfileArgs({this.key, required this.user});

  final _i47.Key? key;

  final _i51.User user;

  @override
  String toString() {
    return 'EditProfileArgs{key: $key, user: $user}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditProfileArgs) return false;
    return key == other.key && user == other.user;
  }

  @override
  int get hashCode => key.hashCode ^ user.hashCode;
}

/// generated route for
/// [_i15.ExplorePage]
class ExploreRoute extends _i46.PageRouteInfo<void> {
  const ExploreRoute({List<_i46.PageRouteInfo>? children})
    : super(ExploreRoute.name, initialChildren: children);

  static const String name = 'ExploreRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i15.ExplorePage();
    },
  );
}

/// generated route for
/// [_i16.FailurePage]
class FailureRoute extends _i46.PageRouteInfo<FailureRouteArgs> {
  FailureRoute({
    _i47.Key? key,
    required String error,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         FailureRoute.name,
         args: FailureRouteArgs(key: key, error: error),
         initialChildren: children,
       );

  static const String name = 'FailureRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FailureRouteArgs>();
      return _i16.FailurePage(key: args.key, error: args.error);
    },
  );
}

class FailureRouteArgs {
  const FailureRouteArgs({this.key, required this.error});

  final _i47.Key? key;

  final String error;

  @override
  String toString() {
    return 'FailureRouteArgs{key: $key, error: $error}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FailureRouteArgs) return false;
    return key == other.key && error == other.error;
  }

  @override
  int get hashCode => key.hashCode ^ error.hashCode;
}

/// generated route for
/// [_i17.FollowRecommendations]
class FollowRecommendations extends _i46.PageRouteInfo<void> {
  const FollowRecommendations({List<_i46.PageRouteInfo>? children})
    : super(FollowRecommendations.name, initialChildren: children);

  static const String name = 'FollowRecommendations';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i17.FollowRecommendations();
    },
  );
}

/// generated route for
/// [_i18.FollowingPage]
class FollowingRoute extends _i46.PageRouteInfo<FollowingRouteArgs> {
  FollowingRoute({
    _i47.Key? key,
    required int userId,
    required String userName,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         FollowingRoute.name,
         args: FollowingRouteArgs(key: key, userId: userId, userName: userName),
         initialChildren: children,
       );

  static const String name = 'FollowingRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FollowingRouteArgs>();
      return _i18.FollowingPage(
        key: args.key,
        userId: args.userId,
        userName: args.userName,
      );
    },
  );
}

class FollowingRouteArgs {
  const FollowingRouteArgs({
    this.key,
    required this.userId,
    required this.userName,
  });

  final _i47.Key? key;

  final int userId;

  final String userName;

  @override
  String toString() {
    return 'FollowingRouteArgs{key: $key, userId: $userId, userName: $userName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FollowingRouteArgs) return false;
    return key == other.key &&
        userId == other.userId &&
        userName == other.userName;
  }

  @override
  int get hashCode => key.hashCode ^ userId.hashCode ^ userName.hashCode;
}

/// generated route for
/// [_i19.HomePage]
class HomeRoute extends _i46.PageRouteInfo<void> {
  const HomeRoute({List<_i46.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i19.HomePage();
    },
  );
}

/// generated route for
/// [_i20.Hub]
class Hub extends _i46.PageRouteInfo<void> {
  const Hub({List<_i46.PageRouteInfo>? children})
    : super(Hub.name, initialChildren: children);

  static const String name = 'Hub';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i20.Hub();
    },
  );
}

/// generated route for
/// [_i21.LiveStream]
class LiveStream extends _i46.PageRouteInfo<LiveStreamArgs> {
  LiveStream({
    _i47.Key? key,
    required int meetingId,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         LiveStream.name,
         args: LiveStreamArgs(key: key, meetingId: meetingId),
         rawPathParams: {'id': meetingId},
         initialChildren: children,
       );

  static const String name = 'LiveStream';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<LiveStreamArgs>(
        orElse: () => LiveStreamArgs(meetingId: pathParams.getInt('id')),
      );
      return _i21.LiveStream(key: args.key, meetingId: args.meetingId);
    },
  );
}

class LiveStreamArgs {
  const LiveStreamArgs({this.key, required this.meetingId});

  final _i47.Key? key;

  final int meetingId;

  @override
  String toString() {
    return 'LiveStreamArgs{key: $key, meetingId: $meetingId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LiveStreamArgs) return false;
    return key == other.key && meetingId == other.meetingId;
  }

  @override
  int get hashCode => key.hashCode ^ meetingId.hashCode;
}

/// generated route for
/// [_i22.Location]
class Location extends _i46.PageRouteInfo<LocationArgs> {
  Location({
    _i47.Key? key,
    required void Function(_i52.LatLng) onLocation,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         Location.name,
         args: LocationArgs(key: key, onLocation: onLocation),
         initialChildren: children,
       );

  static const String name = 'Location';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LocationArgs>();
      return _i22.Location(key: args.key, onLocation: args.onLocation);
    },
  );
}

class LocationArgs {
  const LocationArgs({this.key, required this.onLocation});

  final _i47.Key? key;

  final void Function(_i52.LatLng) onLocation;

  @override
  String toString() {
    return 'LocationArgs{key: $key, onLocation: $onLocation}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LocationArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i23.LoginPage]
class LoginRoute extends _i46.PageRouteInfo<void> {
  const LoginRoute({List<_i46.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i23.LoginPage();
    },
  );
}

/// generated route for
/// [_i24.MeetingCreate]
class MeetingCreate extends _i46.PageRouteInfo<MeetingCreateArgs> {
  MeetingCreate({
    _i47.Key? key,
    required bool isLiveStream,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         MeetingCreate.name,
         args: MeetingCreateArgs(key: key, isLiveStream: isLiveStream),
         initialChildren: children,
       );

  static const String name = 'MeetingCreate';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MeetingCreateArgs>();
      return _i24.MeetingCreate(key: args.key, isLiveStream: args.isLiveStream);
    },
  );
}

class MeetingCreateArgs {
  const MeetingCreateArgs({this.key, required this.isLiveStream});

  final _i47.Key? key;

  final bool isLiveStream;

  @override
  String toString() {
    return 'MeetingCreateArgs{key: $key, isLiveStream: $isLiveStream}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MeetingCreateArgs) return false;
    return key == other.key && isLiveStream == other.isLiveStream;
  }

  @override
  int get hashCode => key.hashCode ^ isLiveStream.hashCode;
}

/// generated route for
/// [_i25.MeetingDetail]
class MeetingDetail extends _i46.PageRouteInfo<MeetingDetailArgs> {
  MeetingDetail({
    _i47.Key? key,
    required int meetingId,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         MeetingDetail.name,
         args: MeetingDetailArgs(key: key, meetingId: meetingId),
         rawPathParams: {'id': meetingId},
         initialChildren: children,
       );

  static const String name = 'MeetingDetail';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<MeetingDetailArgs>(
        orElse: () => MeetingDetailArgs(meetingId: pathParams.getInt('id')),
      );
      return _i25.MeetingDetail(key: args.key, meetingId: args.meetingId);
    },
  );
}

class MeetingDetailArgs {
  const MeetingDetailArgs({this.key, required this.meetingId});

  final _i47.Key? key;

  final int meetingId;

  @override
  String toString() {
    return 'MeetingDetailArgs{key: $key, meetingId: $meetingId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MeetingDetailArgs) return false;
    return key == other.key && meetingId == other.meetingId;
  }

  @override
  int get hashCode => key.hashCode ^ meetingId.hashCode;
}

/// generated route for
/// [_i26.MeetingPage]
class MeetingRoute extends _i46.PageRouteInfo<void> {
  const MeetingRoute({List<_i46.PageRouteInfo>? children})
    : super(MeetingRoute.name, initialChildren: children);

  static const String name = 'MeetingRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i26.MeetingPage();
    },
  );
}

/// generated route for
/// [_i27.MutedAndBlocked]
class MutedAndBlocked extends _i46.PageRouteInfo<void> {
  const MutedAndBlocked({List<_i46.PageRouteInfo>? children})
    : super(MutedAndBlocked.name, initialChildren: children);

  static const String name = 'MutedAndBlocked';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i27.MutedAndBlocked();
    },
  );
}

/// generated route for
/// [_i28.Notifications]
class Notifications extends _i46.PageRouteInfo<void> {
  const Notifications({List<_i46.PageRouteInfo>? children})
    : super(Notifications.name, initialChildren: children);

  static const String name = 'Notifications';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i28.Notifications();
    },
  );
}

/// generated route for
/// [_i29.PetitionCreate]
class PetitionCreate extends _i46.PageRouteInfo<void> {
  const PetitionCreate({List<_i46.PageRouteInfo>? children})
    : super(PetitionCreate.name, initialChildren: children);

  static const String name = 'PetitionCreate';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i29.PetitionCreate();
    },
  );
}

/// generated route for
/// [_i30.PetitionDetail]
class PetitionDetail extends _i46.PageRouteInfo<PetitionDetailArgs> {
  PetitionDetail({
    _i47.Key? key,
    required int petitionId,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         PetitionDetail.name,
         args: PetitionDetailArgs(key: key, petitionId: petitionId),
         rawPathParams: {'id': petitionId},
         initialChildren: children,
       );

  static const String name = 'PetitionDetail';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PetitionDetailArgs>(
        orElse: () => PetitionDetailArgs(petitionId: pathParams.getInt('id')),
      );
      return _i30.PetitionDetail(key: args.key, petitionId: args.petitionId);
    },
  );
}

class PetitionDetailArgs {
  const PetitionDetailArgs({this.key, required this.petitionId});

  final _i47.Key? key;

  final int petitionId;

  @override
  String toString() {
    return 'PetitionDetailArgs{key: $key, petitionId: $petitionId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PetitionDetailArgs) return false;
    return key == other.key && petitionId == other.petitionId;
  }

  @override
  int get hashCode => key.hashCode ^ petitionId.hashCode;
}

/// generated route for
/// [_i31.PetitionPage]
class PetitionRoute extends _i46.PageRouteInfo<void> {
  const PetitionRoute({List<_i46.PageRouteInfo>? children})
    : super(PetitionRoute.name, initialChildren: children);

  static const String name = 'PetitionRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i31.PetitionPage();
    },
  );
}

/// generated route for
/// [_i32.PostCreatePage]
class PostCreateRoute extends _i46.PageRouteInfo<PostCreateRouteArgs> {
  PostCreateRoute({
    _i47.Key? key,
    _i48.Post? replyTo,
    _i48.Post? repostOf,
    _i53.Ballot? ballot,
    _i54.Survey? survey,
    _i55.Petition? petition,
    _i56.Meeting? meeting,
    _i57.Section? section,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         PostCreateRoute.name,
         args: PostCreateRouteArgs(
           key: key,
           replyTo: replyTo,
           repostOf: repostOf,
           ballot: ballot,
           survey: survey,
           petition: petition,
           meeting: meeting,
           section: section,
         ),
         initialChildren: children,
       );

  static const String name = 'PostCreateRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PostCreateRouteArgs>(
        orElse: () => const PostCreateRouteArgs(),
      );
      return _i32.PostCreatePage(
        key: args.key,
        replyTo: args.replyTo,
        repostOf: args.repostOf,
        ballot: args.ballot,
        survey: args.survey,
        petition: args.petition,
        meeting: args.meeting,
        section: args.section,
      );
    },
  );
}

class PostCreateRouteArgs {
  const PostCreateRouteArgs({
    this.key,
    this.replyTo,
    this.repostOf,
    this.ballot,
    this.survey,
    this.petition,
    this.meeting,
    this.section,
  });

  final _i47.Key? key;

  final _i48.Post? replyTo;

  final _i48.Post? repostOf;

  final _i53.Ballot? ballot;

  final _i54.Survey? survey;

  final _i55.Petition? petition;

  final _i56.Meeting? meeting;

  final _i57.Section? section;

  @override
  String toString() {
    return 'PostCreateRouteArgs{key: $key, replyTo: $replyTo, repostOf: $repostOf, ballot: $ballot, survey: $survey, petition: $petition, meeting: $meeting, section: $section}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PostCreateRouteArgs) return false;
    return key == other.key &&
        replyTo == other.replyTo &&
        repostOf == other.repostOf &&
        ballot == other.ballot &&
        survey == other.survey &&
        petition == other.petition &&
        meeting == other.meeting &&
        section == other.section;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      replyTo.hashCode ^
      repostOf.hashCode ^
      ballot.hashCode ^
      survey.hashCode ^
      petition.hashCode ^
      meeting.hashCode ^
      section.hashCode;
}

/// generated route for
/// [_i33.PostDetail]
class PostDetail extends _i46.PageRouteInfo<PostDetailArgs> {
  PostDetail({
    _i47.Key? key,
    required int postId,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         PostDetail.name,
         args: PostDetailArgs(key: key, postId: postId),
         rawPathParams: {'id': postId},
         initialChildren: children,
       );

  static const String name = 'PostDetail';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PostDetailArgs>(
        orElse: () => PostDetailArgs(postId: pathParams.getInt('id')),
      );
      return _i33.PostDetail(key: args.key, postId: args.postId);
    },
  );
}

class PostDetailArgs {
  const PostDetailArgs({this.key, required this.postId});

  final _i47.Key? key;

  final int postId;

  @override
  String toString() {
    return 'PostDetailArgs{key: $key, postId: $postId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PostDetailArgs) return false;
    return key == other.key && postId == other.postId;
  }

  @override
  int get hashCode => key.hashCode ^ postId.hashCode;
}

/// generated route for
/// [_i34.PostUpdatePage]
class PostUpdateRoute extends _i46.PageRouteInfo<PostUpdateRouteArgs> {
  PostUpdateRoute({
    _i47.Key? key,
    required _i58.DraftPost draft,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         PostUpdateRoute.name,
         args: PostUpdateRouteArgs(key: key, draft: draft),
         initialChildren: children,
       );

  static const String name = 'PostUpdateRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PostUpdateRouteArgs>();
      return _i34.PostUpdatePage(key: args.key, draft: args.draft);
    },
  );
}

class PostUpdateRouteArgs {
  const PostUpdateRouteArgs({this.key, required this.draft});

  final _i47.Key? key;

  final _i58.DraftPost draft;

  @override
  String toString() {
    return 'PostUpdateRouteArgs{key: $key, draft: $draft}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PostUpdateRouteArgs) return false;
    return key == other.key && draft == other.draft;
  }

  @override
  int get hashCode => key.hashCode ^ draft.hashCode;
}

/// generated route for
/// [_i35.PreferencesPage]
class PreferencesRoute extends _i46.PageRouteInfo<void> {
  const PreferencesRoute({List<_i46.PageRouteInfo>? children})
    : super(PreferencesRoute.name, initialChildren: children);

  static const String name = 'PreferencesRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i35.PreferencesPage();
    },
  );
}

/// generated route for
/// [_i36.ProfilePage]
class ProfileRoute extends _i46.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i47.Key? key,
    required int userId,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         ProfileRoute.name,
         args: ProfileRouteArgs(key: key, userId: userId),
         rawPathParams: {'id': userId},
         initialChildren: children,
       );

  static const String name = 'ProfileRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ProfileRouteArgs>(
        orElse: () => ProfileRouteArgs(userId: pathParams.getInt('id')),
      );
      return _i36.ProfilePage(key: args.key, userId: args.userId);
    },
  );
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key, required this.userId});

  final _i47.Key? key;

  final int userId;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, userId: $userId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProfileRouteArgs) return false;
    return key == other.key && userId == other.userId;
  }

  @override
  int get hashCode => key.hashCode ^ userId.hashCode;
}

/// generated route for
/// [_i37.ResponsePage]
class ResponseRoute extends _i46.PageRouteInfo<ResponseRouteArgs> {
  ResponseRoute({
    _i47.Key? key,
    required int surveyId,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         ResponseRoute.name,
         args: ResponseRouteArgs(key: key, surveyId: surveyId),
         rawPathParams: {'id': surveyId},
         initialChildren: children,
       );

  static const String name = 'ResponseRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ResponseRouteArgs>(
        orElse: () => ResponseRouteArgs(surveyId: pathParams.getInt('id')),
      );
      return _i37.ResponsePage(key: args.key, surveyId: args.surveyId);
    },
  );
}

class ResponseRouteArgs {
  const ResponseRouteArgs({this.key, required this.surveyId});

  final _i47.Key? key;

  final int surveyId;

  @override
  String toString() {
    return 'ResponseRouteArgs{key: $key, surveyId: $surveyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResponseRouteArgs) return false;
    return key == other.key && surveyId == other.surveyId;
  }

  @override
  int get hashCode => key.hashCode ^ surveyId.hashCode;
}

/// generated route for
/// [_i20.ResultsPage]
class ResultsRoute extends _i46.PageRouteInfo<ResultsRouteArgs> {
  ResultsRoute({
    _i47.Key? key,
    required String searchTerm,
    required bool filterByRegion,
    required String sortBy,
    required DateTime? startDate,
    required DateTime? endDate,
    required int filterCount,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         ResultsRoute.name,
         args: ResultsRouteArgs(
           key: key,
           searchTerm: searchTerm,
           filterByRegion: filterByRegion,
           sortBy: sortBy,
           startDate: startDate,
           endDate: endDate,
           filterCount: filterCount,
         ),
         initialChildren: children,
       );

  static const String name = 'ResultsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResultsRouteArgs>();
      return _i20.ResultsPage(
        key: args.key,
        searchTerm: args.searchTerm,
        filterByRegion: args.filterByRegion,
        sortBy: args.sortBy,
        startDate: args.startDate,
        endDate: args.endDate,
        filterCount: args.filterCount,
      );
    },
  );
}

class ResultsRouteArgs {
  const ResultsRouteArgs({
    this.key,
    required this.searchTerm,
    required this.filterByRegion,
    required this.sortBy,
    required this.startDate,
    required this.endDate,
    required this.filterCount,
  });

  final _i47.Key? key;

  final String searchTerm;

  final bool filterByRegion;

  final String sortBy;

  final DateTime? startDate;

  final DateTime? endDate;

  final int filterCount;

  @override
  String toString() {
    return 'ResultsRouteArgs{key: $key, searchTerm: $searchTerm, filterByRegion: $filterByRegion, sortBy: $sortBy, startDate: $startDate, endDate: $endDate, filterCount: $filterCount}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResultsRouteArgs) return false;
    return key == other.key &&
        searchTerm == other.searchTerm &&
        filterByRegion == other.filterByRegion &&
        sortBy == other.sortBy &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        filterCount == other.filterCount;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      searchTerm.hashCode ^
      filterByRegion.hashCode ^
      sortBy.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      filterCount.hashCode;
}

/// generated route for
/// [_i38.RootRoute]
class RootRoute extends _i46.PageRouteInfo<void> {
  const RootRoute({List<_i46.PageRouteInfo>? children})
    : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i38.RootRoute();
    },
  );
}

/// generated route for
/// [_i39.SearchResults]
class SearchResults extends _i46.PageRouteInfo<SearchResultsArgs> {
  SearchResults({
    _i47.Key? key,
    required String searchTerm,
    required DateTime? startDate,
    required DateTime? endDate,
    required int filterCount,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         SearchResults.name,
         args: SearchResultsArgs(
           key: key,
           searchTerm: searchTerm,
           startDate: startDate,
           endDate: endDate,
           filterCount: filterCount,
         ),
         initialChildren: children,
       );

  static const String name = 'SearchResults';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchResultsArgs>();
      return _i39.SearchResults(
        key: args.key,
        searchTerm: args.searchTerm,
        startDate: args.startDate,
        endDate: args.endDate,
        filterCount: args.filterCount,
      );
    },
  );
}

class SearchResultsArgs {
  const SearchResultsArgs({
    this.key,
    required this.searchTerm,
    required this.startDate,
    required this.endDate,
    required this.filterCount,
  });

  final _i47.Key? key;

  final String searchTerm;

  final DateTime? startDate;

  final DateTime? endDate;

  final int filterCount;

  @override
  String toString() {
    return 'SearchResultsArgs{key: $key, searchTerm: $searchTerm, startDate: $startDate, endDate: $endDate, filterCount: $filterCount}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SearchResultsArgs) return false;
    return key == other.key &&
        searchTerm == other.searchTerm &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        filterCount == other.filterCount;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      searchTerm.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      filterCount.hashCode;
}

/// generated route for
/// [_i40.Settings]
class Settings extends _i46.PageRouteInfo<void> {
  const Settings({List<_i46.PageRouteInfo>? children})
    : super(Settings.name, initialChildren: children);

  static const String name = 'Settings';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i40.Settings();
    },
  );
}

/// generated route for
/// [_i41.SplashPage]
class SplashRoute extends _i46.PageRouteInfo<void> {
  const SplashRoute({List<_i46.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i41.SplashPage();
    },
  );
}

/// generated route for
/// [_i42.Supporters]
class Supporters extends _i46.PageRouteInfo<SupportersArgs> {
  Supporters({
    _i47.Key? key,
    required _i55.Petition petition,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         Supporters.name,
         args: SupportersArgs(key: key, petition: petition),
         initialChildren: children,
       );

  static const String name = 'Supporters';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SupportersArgs>();
      return _i42.Supporters(key: args.key, petition: args.petition);
    },
  );
}

class SupportersArgs {
  const SupportersArgs({this.key, required this.petition});

  final _i47.Key? key;

  final _i55.Petition petition;

  @override
  String toString() {
    return 'SupportersArgs{key: $key, petition: $petition}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SupportersArgs) return false;
    return key == other.key && petition == other.petition;
  }

  @override
  int get hashCode => key.hashCode ^ petition.hashCode;
}

/// generated route for
/// [_i43.SurveyPage]
class SurveyRoute extends _i46.PageRouteInfo<void> {
  const SurveyRoute({List<_i46.PageRouteInfo>? children})
    : super(SurveyRoute.name, initialChildren: children);

  static const String name = 'SurveyRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i43.SurveyPage();
    },
  );
}

/// generated route for
/// [_i44.SurveyProcess]
class SurveyProcess extends _i46.PageRouteInfo<SurveyProcessArgs> {
  SurveyProcess({
    _i47.Key? key,
    required int surveyId,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         SurveyProcess.name,
         args: SurveyProcessArgs(key: key, surveyId: surveyId),
         rawPathParams: {'id': surveyId},
         initialChildren: children,
       );

  static const String name = 'SurveyProcess';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<SurveyProcessArgs>(
        orElse: () => SurveyProcessArgs(surveyId: pathParams.getInt('id')),
      );
      return _i44.SurveyProcess(key: args.key, surveyId: args.surveyId);
    },
  );
}

class SurveyProcessArgs {
  const SurveyProcessArgs({this.key, required this.surveyId});

  final _i47.Key? key;

  final int surveyId;

  @override
  String toString() {
    return 'SurveyProcessArgs{key: $key, surveyId: $surveyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SurveyProcessArgs) return false;
    return key == other.key && surveyId == other.surveyId;
  }

  @override
  int get hashCode => key.hashCode ^ surveyId.hashCode;
}

/// generated route for
/// [_i45.UsersPage]
class UsersRoute extends _i46.PageRouteInfo<UsersRouteArgs> {
  UsersRoute({
    _i47.Key? key,
    required String title,
    required List<_i51.User> users,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         UsersRoute.name,
         args: UsersRouteArgs(key: key, title: title, users: users),
         initialChildren: children,
       );

  static const String name = 'UsersRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UsersRouteArgs>();
      return _i45.UsersPage(
        key: args.key,
        title: args.title,
        users: args.users,
      );
    },
  );
}

class UsersRouteArgs {
  const UsersRouteArgs({this.key, required this.title, required this.users});

  final _i47.Key? key;

  final String title;

  final List<_i51.User> users;

  @override
  String toString() {
    return 'UsersRouteArgs{key: $key, title: $title, users: $users}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UsersRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        const _i59.ListEquality<_i51.User>().equals(users, other.users);
  }

  @override
  int get hashCode =>
      key.hashCode ^
      title.hashCode ^
      const _i59.ListEquality<_i51.User>().hash(users);
}
