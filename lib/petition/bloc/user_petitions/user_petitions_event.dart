part of 'user_petitions_bloc.dart';

@freezed
sealed class UserPetitionsEvent with _$UserPetitionsEvent {
  const factory UserPetitionsEvent.get({
    required User user,
    List<Petition>? previousPetitions,
  }) = _Get;
  const factory UserPetitionsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory UserPetitionsEvent.resubscribe({
    required User user,
    required List<Petition> petitions,
  }) = _Resubscribe;
  const factory UserPetitionsEvent.unsubscribe({
    required User user,
    required List<Petition> petitions,
  }) = _Unsubscribe;
}
