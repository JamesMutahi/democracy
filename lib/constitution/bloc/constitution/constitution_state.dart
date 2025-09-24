part of 'constitution_bloc.dart';

@freezed
abstract class ConstitutionState with _$ConstitutionState {
  const factory ConstitutionState.initial() = ConstitutionInitial;

  const factory ConstitutionState.loading() = ConstitutionLoading;

  const factory ConstitutionState.loaded({required List<Section> sections}) =
      ConstitutionLoaded;

  const factory ConstitutionState.failure({required String error}) =
      ConstitutionFailure;
}
