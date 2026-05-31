part of 'petition_bloc.dart';

@freezed
class PetitionEvent with _$PetitionEvent {
  const factory PetitionEvent.load({required int petitionId}) = _Load;
  const factory PetitionEvent.loaded({required Map<String, dynamic> payload}) =
      _Loaded;
  const factory PetitionEvent.updated({required Petition petition}) = _Updated;
}
