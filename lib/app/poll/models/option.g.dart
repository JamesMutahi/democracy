// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Option _$OptionFromJson(Map<String, dynamic> json) => _Option(
  id: (json['id'] as num).toInt(),
  poll: (json['poll'] as num).toInt(),
  text: json['text'] as String,
  votes: (json['votes'] as num).toInt(),
);

Map<String, dynamic> _$OptionToJson(_Option instance) => <String, dynamic>{
  'id': instance.id,
  'poll': instance.poll,
  'text': instance.text,
  'votes': instance.votes,
};
