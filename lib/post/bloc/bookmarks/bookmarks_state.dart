part of 'bookmarks_cubit.dart';

@freezed
class BookmarksState with _$BookmarksState {
  const factory BookmarksState.initial() = BookmarksInitial;
  const factory BookmarksState.loading() = BookmarksLoading;
  const factory BookmarksState.loaded({required List<Post> posts}) =
      BookmarksLoaded;
  const factory BookmarksState.failure() = BookmarksFailure;
}
