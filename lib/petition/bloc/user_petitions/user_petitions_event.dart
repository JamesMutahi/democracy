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
  const factory UserPetitionsEvent.add({required Petition petition}) = _Add;
  const factory UserPetitionsEvent.update({required Petition petition}) =
      _Update;
  const factory UserPetitionsEvent.remove({required int petitionId}) = _Remove;
}
