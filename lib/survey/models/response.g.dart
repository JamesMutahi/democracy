// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Response _$ResponseFromJson(Map<String, dynamic> json) => _Response(
  id: (json['id'] as num).toInt(),
  startTime: DateTime.parse(json['start_time'] as String),
  endTime: DateTime.parse(json['end_time'] as String),
  choiceAnswers: (json['choice_answers'] as List<dynamic>)
      .map((e) => ChoiceAnswer.fromJson(e as Map<String, dynamic>))
      .toList(),
  textAnswers: (json['text_answers'] as List<dynamic>)
      .map((e) => TextAnswer.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ResponseToJson(_Response instance) => <String, dynamic>{
  'id': instance.id,
  'start_time': instance.startTime.toIso8601String(),
  'end_time': instance.endTime.toIso8601String(),
  'choice_answers': instance.choiceAnswers,
  'text_answers': instance.textAnswers,
};
