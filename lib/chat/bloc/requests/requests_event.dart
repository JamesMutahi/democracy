part of 'requests_bloc.dart';

@freezed
sealed class RequestsEvent with _$RequestsEvent {
  const factory RequestsEvent.get({
    @Default('') String searchTerm,
    Chat? lastChat,
  }) = _Get;
  const factory RequestsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory RequestsEvent.update() = _Update;
}
