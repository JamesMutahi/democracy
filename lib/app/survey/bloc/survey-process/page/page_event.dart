part of 'page_bloc.dart';

@freezed
abstract class PageEvent with _$PageEvent {
  const factory PageEvent.pageLoaded({
    required Survey survey,
    required int page,
  }) = _PageLoaded;
}
