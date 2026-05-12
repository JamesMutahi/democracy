part of 'hashtags_bloc.dart';

@freezed
class HashtagsEvent with _$HashtagsEvent {
  const factory HashtagsEvent.get({@Default('') String searchTerm}) = _Get;
  const factory HashtagsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
