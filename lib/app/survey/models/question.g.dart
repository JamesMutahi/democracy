// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Question _$QuestionFromJson(Map<String, dynamic> json) => _Question(
  id: (json['id'] as num).toInt(),
  survey: (json['survey'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  number: (json['number'] as num).toInt(),
  type: const QuestionTypeConverter().fromJson(json['type'] as String),
  text: json['text'] as String,
  hint: json['hint'] as String?,
  dependency:
      json['dependency'] == null
          ? null
          : Choice.fromJson(json['dependency'] as Map<String, dynamic>),
  choices:
      (json['choices'] as List<dynamic>)
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$QuestionToJson(_Question instance) => <String, dynamic>{
  'id': instance.id,
  'survey': instance.survey,
  'page': instance.page,
  'number': instance.number,
  'type': const QuestionTypeConverter().toJson(instance.type),
  'text': instance.text,
  'hint': instance.hint,
  'dependency': instance.dependency,
  'choices': instance.choices,
};
