import 'package:freezed_annotation/freezed_annotation.dart';

part 'section.freezed.dart';
part 'section.g.dart';

@freezed
sealed class Section with _$Section {
  const factory Section({
    required final int id,
    required final String numeral,
    required final String text,
    @JsonKey(name: 'is_title') required final bool isTitle,
    @JsonKey(name: 'parent_count') required final int parentCount,
  }) = _Section;

  factory Section.fromJson(Map<String, Object?> json) =>
      _$SectionFromJson(json);
}
