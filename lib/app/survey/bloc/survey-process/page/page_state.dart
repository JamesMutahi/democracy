part of 'page_bloc.dart';

@freezed
class PageState with _$PageState {
  const factory PageState.initial() = PageInitial;
  const factory PageState.loading() = PageLoading;
  const factory PageState.loaded({
    required List<Question> questions,
  }) = PageLoaded;
}
