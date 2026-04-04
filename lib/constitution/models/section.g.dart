// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Section _$SectionFromJson(Map<String, dynamic> json) => _Section(
  id: (json['id'] as num).toInt(),
  position: (json['position'] as num).toInt(),
  tag: json['tag'] as String?,
  numeral: json['numeral'] as String,
  text: json['text'] as String,
  isTitle: json['is_title'] as bool,
  parentCount: (json['parent_count'] as num).toInt(),
);

Map<String, dynamic> _$SectionToJson(_Section instance) => <String, dynamic>{
  'id': instance.id,
  'position': instance.position,
  'tag': instance.tag,
  'numeral': instance.numeral,
  'text': instance.text,
  'is_title': instance.isTitle,
  'parent_count': instance.parentCount,
};
