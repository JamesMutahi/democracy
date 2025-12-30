part of 'user_community_notes_bloc.dart';

@freezed
class UserCommunityNotesEvent with _$UserCommunityNotesEvent {
  const factory UserCommunityNotesEvent.get({
    required User user,
    Post? lastPost,
  }) = _Get;
  const factory UserCommunityNotesEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
