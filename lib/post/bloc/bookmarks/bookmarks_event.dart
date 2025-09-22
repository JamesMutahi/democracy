part of 'bookmarks_bloc.dart';

@freezed
sealed class BookmarksEvent with _$BookmarksEvent {
  const factory BookmarksEvent.get({Post? lastPost}) = _Get;
  const factory BookmarksEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
