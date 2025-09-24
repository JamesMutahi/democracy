part of 'supporters_bloc.dart';

@freezed
sealed class SupportersEvent with _$SupportersEvent {
  const factory SupportersEvent.get({
    required Petition petition,
    User? lastUser,
  }) = _Get;
  const factory SupportersEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
