part of 'user_community_notes_bloc.dart';

@freezed
class UserCommunityNotesEvent with _$UserCommunityNotesEvent {
  const factory UserCommunityNotesEvent.get({
    required User user,
    List<Post>? previousPosts,
  }) = _Get;
  const factory UserCommunityNotesEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory UserCommunityNotesEvent.update({required List<Post> posts}) =
      _Update;
}
