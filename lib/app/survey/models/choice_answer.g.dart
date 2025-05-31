// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChoiceAnswer _$ChoiceAnswerFromJson(Map<String, dynamic> json) =>
    _ChoiceAnswer(
      question: Question.fromJson(json['question'] as Map<String, dynamic>),
      choice: Choice.fromJson(json['choice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChoiceAnswerToJson(_ChoiceAnswer instance) =>
    <String, dynamic>{'question': instance.question, 'choice': instance.choice};
