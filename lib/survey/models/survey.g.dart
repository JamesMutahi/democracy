// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Survey _$SurveyFromJson(Map<String, dynamic> json) => _Survey(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  startTime: DateTime.parse(json['start_time'] as String),
  endTime: DateTime.parse(json['end_time'] as String),
  isActive: json['is_active'] as bool,
  questions:
      (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
  response:
      json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
  totalResponses: (json['total_responses'] as num).toInt(),
);

Map<String, dynamic> _$SurveyToJson(_Survey instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'start_time': instance.startTime.toIso8601String(),
  'end_time': instance.endTime.toIso8601String(),
  'is_active': instance.isActive,
  'questions': instance.questions,
  'response': instance.response,
  'total_responses': instance.totalResponses,
};
