// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TextAnswer _$TextAnswerFromJson(Map<String, dynamic> json) => _TextAnswer(
  question: Question.fromJson(json['question'] as Map<String, dynamic>),
  answer: json['answer'] as String,
);

Map<String, dynamic> _$TextAnswerToJson(_TextAnswer instance) =>
    <String, dynamic>{'question': instance.question, 'answer': instance.answer};
