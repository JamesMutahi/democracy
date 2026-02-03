// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Survey _$SurveyFromJson(Map<String, dynamic> json) => _Survey(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  county: json['county'] == null
      ? null
      : County.fromJson(json['county'] as Map<String, dynamic>),
  constituency: json['constituency'] == null
      ? null
      : Constituency.fromJson(json['constituency'] as Map<String, dynamic>),
  ward: json['ward'] == null
      ? null
      : Ward.fromJson(json['ward'] as Map<String, dynamic>),
  startTime: DateTime.parse(json['start_time'] as String),
  endTime: DateTime.parse(json['end_time'] as String),
  isActive: json['is_active'] as bool,
  pages: (json['pages'] as List<dynamic>)
      .map((e) => Page.fromJson(e as Map<String, dynamic>))
      .toList(),
  response: json['response'] == null
      ? null
      : Response.fromJson(json['response'] as Map<String, dynamic>),
  totalResponses: (json['total_responses'] as num).toInt(),
);

Map<String, dynamic> _$SurveyToJson(_Survey instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'county': instance.county,
  'constituency': instance.constituency,
  'ward': instance.ward,
  'start_time': instance.startTime.toIso8601String(),
  'end_time': instance.endTime.toIso8601String(),
  'is_active': instance.isActive,
  'pages': instance.pages,
  'response': instance.response,
  'total_responses': instance.totalResponses,
};
