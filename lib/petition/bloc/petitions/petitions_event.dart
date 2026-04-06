part of 'petitions_bloc.dart';

@freezed
sealed class PetitionsEvent with _$PetitionsEvent {
  const factory PetitionsEvent.get({
    String? searchTerm,
    List<Petition>? previousPetitions,
    bool? isOpen,
    String? sortBy,
    bool? filterByRegion,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Get;
  const factory PetitionsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory PetitionsEvent.add({required Petition petition}) = _Add;
  const factory PetitionsEvent.update({required Petition petition}) = _Update;
  const factory PetitionsEvent.remove({required int petitionId}) = _Remove;
}
