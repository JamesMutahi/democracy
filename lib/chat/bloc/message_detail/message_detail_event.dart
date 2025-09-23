part of 'message_detail_bloc.dart';

@freezed
sealed class MessageDetailEvent with _$MessageDetailEvent {
  const factory MessageDetailEvent.created({
    required Map<String, dynamic> payload,
  }) = _Created;

  const factory MessageDetailEvent.updated({
    required Map<String, dynamic> payload,
  }) = _Updated;

  const factory MessageDetailEvent.deleted({
    required Map<String, dynamic> payload,
  }) = _Deleted;

  const factory MessageDetailEvent.create({
    required Chat chat,
    required String text,
    Post? post,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
  }) = _Create;

  const factory MessageDetailEvent.edit({
    required int messageId,
    required String text,
  }) = _Edit;

  const factory MessageDetailEvent.delete({required List<Message> messages}) =
      _Delete;
}
