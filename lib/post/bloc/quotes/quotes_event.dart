part of 'quotes_bloc.dart';

@freezed
class QuotesEvent with _$QuotesEvent {
  const factory QuotesEvent.get({
    required int postId,
    List<Post>? previousPosts,
  }) = _Get;
  const factory QuotesEvent.received({required Map<String, dynamic> payload}) =
      _Received;
  const factory QuotesEvent.update({
    required int postId,
    required List<Post> posts,
  }) = _Update;
}
