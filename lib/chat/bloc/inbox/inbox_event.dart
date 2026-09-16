part of 'inbox_bloc.dart';

@freezed
sealed class InboxEvent with _$InboxEvent {
  const factory InboxEvent.get({
    @Default('') String searchTerm,
    Chat? lastChat,
  }) = _Get;
  const factory InboxEvent.received({required Map<String, dynamic> payload}) =
      _Received;
  const factory InboxEvent.update() = _Update;
}
