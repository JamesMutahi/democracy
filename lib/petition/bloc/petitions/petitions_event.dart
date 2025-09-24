part of 'petitions_bloc.dart';

@freezed
sealed class PetitionsEvent with _$PetitionsEvent {
  const factory PetitionsEvent.get({
    String? searchTerm,
    Petition? lastPetition,
  }) = _Get;
  const factory PetitionsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory PetitionsEvent.resubscribe({
    required List<Petition> petitions,
  }) = _Resubscribe;
}
