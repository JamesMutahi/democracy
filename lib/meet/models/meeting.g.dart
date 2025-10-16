// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Meeting _$MeetingFromJson(Map<String, dynamic> json) => _Meeting(
  id: (json['id'] as num).toInt(),
  host: User.fromJson(json['host'] as Map<String, dynamic>),
  title: json['title'] as String,
  description: json['description'] as String,
  recentListeners: (json['recent_listeners'] as List<dynamic>)
      .map((e) => User.fromJson(e as Map<String, dynamic>))
      .toList(),
  listeners: (json['listeners'] as num).toInt(),
  isActive: json['is_active'] as bool,
  startTime: DateTime.parse(json['start_time'] as String),
  endTime: DateTime.parse(json['end_time'] as String),
);

Map<String, dynamic> _$MeetingToJson(_Meeting instance) => <String, dynamic>{
  'id': instance.id,
  'host': instance.host,
  'title': instance.title,
  'description': instance.description,
  'recent_listeners': instance.recentListeners,
  'listeners': instance.listeners,
  'is_active': instance.isActive,
  'start_time': instance.startTime.toIso8601String(),
  'end_time': instance.endTime.toIso8601String(),
};
