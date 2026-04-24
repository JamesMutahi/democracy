part of 'message_create_bloc.dart';

@freezed
class MessageCreateEvent with _$MessageCreateEvent {
  const factory MessageCreateEvent.create({
    required Chat chat,
    required String text,
    Post? post,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Meeting? meeting,
    Section? section,
    @Default([]) List<String> filePaths,
    LatLng? location,
  }) = _Create;

  const factory MessageCreateEvent.uploadAssets({
    required List<dynamic> uploads,
  }) = _UploadAssets;

  const factory MessageCreateEvent.retry() = _Retry;
}
