part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.loaded({required Profile profile}) = ProfileLoaded;
  const factory ProfileState.failure() = ProfileFailure;
}
