part of 'petition_detail_cubit.dart';

@freezed
class PetitionDetailState with _$PetitionDetailState {
  const factory PetitionDetailState.initial() = PetitionDetailInitial;

  const factory PetitionDetailState.loading() = PetitionDetailLoading;

  const factory PetitionDetailState.created({required Petition petition}) =
      PetitionCreated;

  const factory PetitionDetailState.updated({required Petition petition}) =
      PetitionUpdated;

  const factory PetitionDetailState.deleted({required int petitionId}) =
      PetitionDeleted;

  const factory PetitionDetailState.failure({required String error}) =
      PetitionDetailFailure;
}
