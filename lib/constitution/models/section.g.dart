// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Section _$SectionFromJson(Map<String, dynamic> json) => _Section(
  id: (json['id'] as num).toInt(),
  position: (json['position'] as num).toInt(),
  tag: json['tag'] as String?,
  text: json['text'] as String,
  isTitle: json['is_title'] as bool,
  subsections:
      (json['subsections'] as List<dynamic>)
          .map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
  isBookmarked: json['is_bookmarked'] as bool,
);

Map<String, dynamic> _$SectionToJson(_Section instance) => <String, dynamic>{
  'id': instance.id,
  'position': instance.position,
  'tag': instance.tag,
  'text': instance.text,
  'is_title': instance.isTitle,
  'subsections': instance.subsections,
  'is_bookmarked': instance.isBookmarked,
};
