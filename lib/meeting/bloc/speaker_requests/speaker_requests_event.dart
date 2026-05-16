part of 'speaker_requests_bloc.dart';

@freezed
class SpeakerRequestsEvent with _$SpeakerRequestsEvent {
  const factory SpeakerRequestsEvent.get({
    required Meeting meeting,
    @Default([]) List<SpeakerRequest> previousRequests,
  }) = _Get;
  const factory SpeakerRequestsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory SpeakerRequestsEvent.add({required SpeakerRequest request}) =
      _Add;
  const factory SpeakerRequestsEvent.update({required SpeakerRequest request}) =
      _Update;
  const factory SpeakerRequestsEvent.remove({required int requestId}) = _Remove;
}
