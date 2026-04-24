part of 'direct_message_bloc.dart';

@freezed
class DirectMessageEvent with _$DirectMessageEvent {
  const factory DirectMessageEvent.send({
    required List<User> users,
    required String text,
    Post? post,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Meeting? meeting,
    Section? section,
    @Default([]) List<String> filePaths,
    LatLng? location,
  }) = _Send;

  const factory DirectMessageEvent.uploadAssets({
    required List<dynamic> uploads,
  }) = _UploadAssets;

  const factory DirectMessageEvent.retry() = _Retry;
}
