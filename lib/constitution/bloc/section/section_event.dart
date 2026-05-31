part of 'section_bloc.dart';

@freezed
class SectionEvent with _$SectionEvent {
  const factory SectionEvent.load({required int sectionId}) = _Load;
  const factory SectionEvent.loaded({required Map<String, dynamic> payload}) =
      _Loaded;
  const factory SectionEvent.updated({required Section section}) = _Updated;
}
