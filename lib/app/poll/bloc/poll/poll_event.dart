part of 'poll_bloc.dart';

@freezed
class PollEvent with _$PollEvent {
  const factory PollEvent.initialize() = _Initialize;

  const factory PollEvent.getPolls() = GetPolls;

  const factory PollEvent.filter({
    required String? searchTerm,
    required DateTime? startDate,
    required DateTime? endDate,
  }) = _Filter;

  const factory PollEvent.reload() = _Reload;
}
