part of 'speaker_requests_bloc.dart';

enum SpeakerRequestsStatus { initial, loading, success, failure }

final class SpeakerRequestsState extends Equatable {
  const SpeakerRequestsState({
    this.status = SpeakerRequestsStatus.initial,
    this.requests = const [],
    this.hasNext = false,
  });

  final SpeakerRequestsStatus status;
  final List<SpeakerRequest> requests;
  final bool hasNext;

  SpeakerRequestsState copyWith({
    SpeakerRequestsStatus? status,
    List<SpeakerRequest>? requests,
    bool? hasNext,
  }) {
    return SpeakerRequestsState(
      status: status ?? this.status,
      requests: requests ?? this.requests,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''SpeakerRequestsState { status: $status, requests: ${requests.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, requests];
}
