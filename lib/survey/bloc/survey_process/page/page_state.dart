part of 'page_bloc.dart';

@freezed
class PageState with _$PageState {
  const factory PageState.initial() = PageInitial;

  const factory PageState.loading() = PageLoading;

  const factory PageState.loaded({required Page page}) = PageLoaded;

  const factory PageState.complete() = PageComplete;
}
