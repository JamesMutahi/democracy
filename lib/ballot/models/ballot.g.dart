// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ballot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ballot _$BallotFromJson(Map<String, dynamic> json) => _Ballot(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
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

Map<String, dynamic> _$BallotToJson(_Ballot instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'start_time': instance.startTime.toIso8601String(),
  'end_time': instance.endTime.toIso8601String(),
  'total_votes': instance.totalVotes,
  'voted_option': instance.votedOption,
  'options': instance.options,
  'reason': instance.reason,
};
