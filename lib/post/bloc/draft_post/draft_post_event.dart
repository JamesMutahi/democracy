part of 'draft_post_bloc.dart';

@freezed
sealed class DraftPostEvent with _$DraftPostEvent {
  const factory DraftPostEvent.save({
    required int? id,
    required String body,
    Post? repostOf,
    Post? replyTo,
    Post? communityNoteOf,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Meeting? meeting,
    Section? section,
    @Default([]) List<Map<String, String>> tags,
    @Default([]) List<String> filePaths,
    LatLng? location,
  }) = _Save;
  const factory DraftPostEvent.delete({required DraftPost draft}) = _Delete;
}
