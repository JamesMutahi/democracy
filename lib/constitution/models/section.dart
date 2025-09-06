import 'package:freezed_annotation/freezed_annotation.dart';

part 'section.freezed.dart';
part 'section.g.dart';

@freezed
sealed class Section with _$Section {
  const factory Section({
    required final int id,
    required final int position,
    required final String? tag,
    required final String text,
    @JsonKey(name: 'is_title') required final bool isTitle,
    required final List<Section> subsections,
    @JsonKey(name: 'is_bookmarked') required final bool isBookmarked,
  }) = _Section;

  factory Section.fromJson(Map<String, Object?> json) =>
      _$SectionFromJson(json);
}
