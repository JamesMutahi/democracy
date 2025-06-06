// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Option _$OptionFromJson(Map<String, dynamic> json) => _Option(
  id: (json['id'] as num).toInt(),
  survey: (json['survey'] as num).toInt(),
  text: json['text'] as String,
);

Map<String, dynamic> _$OptionToJson(_Option instance) => <String, dynamic>{
  'id': instance.id,
  'survey': instance.survey,
  'text': instance.text,
};
