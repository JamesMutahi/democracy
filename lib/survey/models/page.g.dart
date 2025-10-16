// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Page _$PageFromJson(Map<String, dynamic> json) => _Page(
  id: (json['id'] as num).toInt(),
  survey: (json['survey'] as num).toInt(),
  number: (json['number'] as num).toInt(),
  questions: (json['questions'] as List<dynamic>)
      .map((e) => Question.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PageToJson(_Page instance) => <String, dynamic>{
  'id': instance.id,
  'survey': instance.survey,
  'number': instance.number,
  'questions': instance.questions,
};
