part of 'sections_cubit.dart';

@freezed
class SectionsState with _$SectionsState {
  const factory SectionsState.initial() = SectionsInitial;
  const factory SectionsState.loading() = SectionsLoading;
  const factory SectionsState.loaded({required List<Section> sections}) =
      SectionsLoaded;
  const factory SectionsState.failure() = SectionsFailure;
}
