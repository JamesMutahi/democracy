part of 'community_notes_bloc.dart';

@freezed
class CommunityNotesEvent with _$CommunityNotesEvent {
  const factory CommunityNotesEvent.get({
    required Post post,
    String? searchTerm,
    String? sortBy,
    Post? lastPost,
  }) = _Get;
  const factory CommunityNotesEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory CommunityNotesEvent.resubscribe({
    required Post post,
    required List<Post> communityNotes,
  }) = _Resubscribe;
  const factory CommunityNotesEvent.unsubscribe({
    required Post post,
    required List<Post> communityNotes,
  }) = _Unsubscribe;
}
