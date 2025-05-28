part of 'page_bloc.dart';

@freezed
abstract class PageEvent with _$PageEvent {
  const factory PageEvent.started({required Survey survey}) = _Started;
}
