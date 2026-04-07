part of 'community_notes_bloc.dart';

@freezed
class CommunityNotesEvent with _$CommunityNotesEvent {
  const factory CommunityNotesEvent.initialize({required Post post}) =
      _Initialize;
  const factory CommunityNotesEvent.get({
    required Post post,
    String? searchTerm,
    String? sortBy,
    List<Post>? previousPosts,
  }) = _Get;
  const factory CommunityNotesEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory CommunityNotesEvent.update({required List<Post> posts}) =
      _Update;
}
