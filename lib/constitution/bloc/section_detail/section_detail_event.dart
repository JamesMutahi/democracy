part of 'section_detail_bloc.dart';

@freezed
sealed class SectionDetailEvent with _$SectionDetailEvent {
  const factory SectionDetailEvent.load({required String tag}) = _Load;

  const factory SectionDetailEvent.loaded({
    required Map<String, dynamic> payload,
  }) = _Loaded;

  const factory SectionDetailEvent.bookmark({required Section section}) =
      _Bookmark;

  const factory SectionDetailEvent.bookmarked({
    required Map<String, dynamic> payload,
  }) = _Bookmarked;
}
