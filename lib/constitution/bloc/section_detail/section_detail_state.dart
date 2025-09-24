part of 'section_detail_bloc.dart';

@freezed
class SectionDetailState with _$SectionDetailState {
  const factory SectionDetailState.initial() = _Initial;

  const factory SectionDetailState.loading() = _Loading;

  const factory SectionDetailState.loaded({required Section section}) =
      SectionLoaded;

  const factory SectionDetailState.updated({required Section section}) =
      SectionUpdated;

  const factory SectionDetailState.deleted({required int sectionId}) =
      SectionDeleted;

  const factory SectionDetailState.failure({required String error}) =
      SectionDetailFailure;
}
