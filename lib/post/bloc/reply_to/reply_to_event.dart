part of 'reply_to_bloc.dart';

@freezed
sealed class ReplyToEvent with _$ReplyToEvent {
  const factory ReplyToEvent.get({required Post post}) = _Get;
  const factory ReplyToEvent.received({required Map<String, dynamic> payload}) =
      _Received;
}
