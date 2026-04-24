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

  const factory ChatDetailEvent.markAsRead({required Chat chat}) = _MarkAsRead;

  const factory ChatDetailEvent.unsubscribe({required Chat chat}) =
      _Unsubscribe;
}
