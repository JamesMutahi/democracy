part of 'post_create_bloc.dart';

@freezed
class PostCreateEvent with _$PostCreateEvent {
  const factory PostCreateEvent.create({
    required String body,
    required PostStatus status,
    Post? repostOf,
    RepostType? repostType,
    Post? replyTo,
    int? communityNoteOfId,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Broadcast? broadcast,
    Section? section,
    @Default([]) List<Map<String, String>> tags,
    @Default([]) List<String> filePaths,
    LatLng? location,
  }) = _Create;

  const factory PostCreateEvent.uploadAssets({required List<dynamic> uploads}) =
      _UploadAssets;

  const factory PostCreateEvent.retry() = _Retry;
}
