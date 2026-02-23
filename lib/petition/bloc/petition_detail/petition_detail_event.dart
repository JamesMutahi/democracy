part of 'petition_detail_bloc.dart';

@freezed
sealed class PetitionDetailEvent with _$PetitionDetailEvent {
  const factory PetitionDetailEvent.created({
    required Map<String, dynamic> payload,
  }) = _Created;
  const factory PetitionDetailEvent.updated({
    required Map<String, dynamic> payload,
  }) = _Updated;
  const factory PetitionDetailEvent.deleted({
    required Map<String, dynamic> payload,
  }) = _Deleted;
  const factory PetitionDetailEvent.create({
    required String title,
    required String imagePath,
    required String description,
    required County? county,
    required Constituency? constituency,
    required Ward? ward,
  }) = _Create;
  const factory PetitionDetailEvent.support({required Petition petition}) =
      _Support;
  const factory PetitionDetailEvent.close({required Petition petition}) =
      _Close;
  const factory PetitionDetailEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
