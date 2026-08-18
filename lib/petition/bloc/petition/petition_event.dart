part of 'petition_bloc.dart';

@freezed
class PetitionEvent with _$PetitionEvent {
  const factory PetitionEvent.load({required int petitionId}) = _Load;
  const factory PetitionEvent.loaded({required Map<String, dynamic> payload}) =
      _Loaded;
  const factory PetitionEvent.detailUpdated({
    required String title,
    required String description,
    required County? county,
    required Constituency? constituency,
    required Ward? ward,
    required int supporters,
    required List<SimpleUser> recentSupporters,
    required String image,
    required String? video,
    required int views,
    required bool isOpen,
    required bool isActive,
  }) = _DetailUpdated;
  const factory PetitionEvent.supportUpdated({
    required bool isSupported,
    required int supporters,
  }) = _SupportUpdated;
}
