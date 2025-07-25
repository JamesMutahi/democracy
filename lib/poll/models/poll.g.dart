// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Poll _$PollFromJson(Map<String, dynamic> json) => _Poll(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  startTime: DateTime.parse(json['start_time'] as String),
  endTime: DateTime.parse(json['end_time'] as String),
  totalVotes: (json['total_votes'] as num).toInt(),
  votedOption: (json['voted_option'] as num?)?.toInt(),
  options:
      (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
  reason:
      json['reason'] == null
          ? null
          : Reason.fromJson(json['reason'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PollToJson(_Poll instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'start_time': instance.startTime.toIso8601String(),
  'end_time': instance.endTime.toIso8601String(),
  'total_votes': instance.totalVotes,
  'voted_option': instance.votedOption,
  'options': instance.options,
  'reason': instance.reason,
};
