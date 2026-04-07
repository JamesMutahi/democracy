part of 'chat_detail_bloc.dart';

@freezed
sealed class ChatDetailEvent with _$ChatDetailEvent {
  const factory ChatDetailEvent.created({
    required Map<String, dynamic> payload,
  }) = _Created;

  const factory ChatDetailEvent.loaded({
    required Map<String, dynamic> payload,
  }) = _Loaded;

  const factory ChatDetailEvent.updated({
    required Map<String, dynamic> payload,
  }) = _Updated;

  const factory ChatDetailEvent.deleted({
    required Map<String, dynamic> payload,
  }) = _Deleted;

  const factory ChatDetailEvent.create({required User user}) = _Create;

  const factory ChatDetailEvent.get({required Chat chat}) = _Get;

  const factory ChatDetailEvent.subscribe({required Chat chat}) = _Subscribe;

  const factory ChatDetailEvent.sendDirectMessage({
    required List<User> users,
    required String text,
    Post? post,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Meeting? meeting,
    Section? section,
    String? imagePath1,
    String? imagePath2,
    String? imagePath3,
    String? imagePath4,
    String? videoPath,
    String? filePath,
    LatLng? location,
  }) = _SendDirectMessage;

  const factory ChatDetailEvent.markAsRead({required Chat chat}) = _MarkAsRead;
}
