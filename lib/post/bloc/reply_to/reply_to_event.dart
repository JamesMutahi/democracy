part of 'reply_to_bloc.dart';

@freezed
sealed class ReplyToEvent with _$ReplyToEvent {
  const factory ReplyToEvent.get({required int postId}) = _Get;
  const factory ReplyToEvent.received({required Map<String, dynamic> payload}) =
      _Received;
  const factory ReplyToEvent.add({required Post post}) = _Add;
  const factory ReplyToEvent.update({required List<Post> posts}) = _Update;
}
