part of 'petition_detail_bloc.dart';

@freezed
class PetitionDetailState with _$PetitionDetailState {
  const factory PetitionDetailState.initial() = PetitionDetailInitial;

  const factory PetitionDetailState.loading() = PetitionDetailLoading;

  const factory PetitionDetailState.created({required Petition petition}) =
      PetitionCreated;

  const factory PetitionDetailState.loaded({required Petition petition}) =
      PetitionLoaded;

  const factory PetitionDetailState.updated({required Petition petition}) =
      PetitionUpdated;

  const factory PetitionDetailState.viewed({required int postId}) =
      PetitionViewed;

  const factory PetitionDetailState.clicked({required int postId}) =
      PetitionClicked;

  const factory PetitionDetailState.deleted({required int petitionId}) =
      PetitionDeleted;

  const factory PetitionDetailState.failure({required String error}) =
      PetitionDetailFailure;
}
