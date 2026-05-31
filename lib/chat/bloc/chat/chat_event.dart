part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.load({required int chatId}) = _Load;
  const factory ChatEvent.loaded({required Map<String, dynamic> payload}) =
  _Loaded;
  const factory ChatEvent.updated({required Chat chat}) = _Updated;
}
