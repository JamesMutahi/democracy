part of 'draft_detail_bloc.dart';

@freezed
sealed class DraftDetailEvent with _$DraftDetailEvent {
  const factory DraftDetailEvent.create({
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
  }) = _Create;
  const factory DraftDetailEvent.update({required DraftPost draft}) = _Update;
  const factory DraftDetailEvent.delete({required DraftPost draft}) = _Delete;
}
