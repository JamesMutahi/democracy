// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Choice _$ChoiceFromJson(Map<String, dynamic> json) => _Choice(
  id: (json['id'] as num).toInt(),
  question: (json['question'] as num).toInt(),
  text: json['text'] as String,
);

Map<String, dynamic> _$ChoiceToJson(_Choice instance) => <String, dynamic>{
  'id': instance.id,
  'question': instance.question,
  'text': instance.text,
};
