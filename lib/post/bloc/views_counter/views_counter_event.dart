part of 'views_counter_bloc.dart';

@freezed
class ViewsCounterEvent with _$ViewsCounterEvent {
  const factory ViewsCounterEvent.viewed({required Post post}) = _Viewed;
  const factory ViewsCounterEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
