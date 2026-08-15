part of 'petition_detail_bloc.dart';

@freezed
class PetitionDetailState with _$PetitionDetailState {
  const factory PetitionDetailState.initial() = PetitionDetailInitial;

  const factory PetitionDetailState.loading() = PetitionDetailLoading;

  const factory PetitionDetailState.created({required Petition petition}) =
      PetitionCreated;

  const factory PetitionDetailState.loaded({required Petition petition}) =
      PetitionLoaded;

  const factory PetitionDetailState.updated({
    required int petitionId,
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
  }) = PetitionUpdated;

  const factory PetitionDetailState.viewed({required int petitionId}) =
      PetitionViewed;

  const factory PetitionDetailState.clicked({required int petitionId}) =
      PetitionClicked;

  const factory PetitionDetailState.supported({
    required int petitionId,
    required bool isSupported,
    required int supporters,
  }) = PetitionSupported;

  const factory PetitionDetailState.deleted({required int petitionId}) =
      PetitionDeleted;

  const factory PetitionDetailState.failure({required String error}) =
      PetitionDetailFailure;
}
