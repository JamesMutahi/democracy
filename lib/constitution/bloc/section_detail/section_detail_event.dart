part of 'section_detail_bloc.dart';

@freezed
sealed class SectionDetailEvent with _$SectionDetailEvent {
  const factory SectionDetailEvent.created({
    required Map<String, dynamic> payload,
  }) = _Created;

  const factory SectionDetailEvent.updated({
    required Map<String, dynamic> payload,
  }) = _Updated;

  const factory SectionDetailEvent.deleted({
    required Map<String, dynamic> payload,
  }) = _Deleted;

  const factory SectionDetailEvent.bookmark({required Section section}) =
      _Bookmark;
}
