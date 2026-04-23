part of 'post_create_bloc.dart';

@freezed
class PostCreateEvent with _$PostCreateEvent {
  const factory PostCreateEvent.create({
    required String body,
    required PostStatus status,
    Post? repostOf,
    Post? replyTo,
    Post? communityNoteOf,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Meeting? meeting,
    Section? section,
    @Default([]) List<Map<String, dynamic>> tags,
    @Default([]) List<String> filePaths,
    LatLng? location,
  }) = _Create;

  const factory PostCreateEvent.uploadAssets({required List<dynamic> uploads}) =
      _UploadAssets;

  const factory PostCreateEvent.retry() = _Retry;
}
