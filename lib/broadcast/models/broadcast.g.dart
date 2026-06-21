// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broadcast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Broadcast _$BroadcastFromJson(Map<String, dynamic> json) => _Broadcast(
  id: (json['id'] as num).toInt(),
  host: User.fromJson(json['host'] as Map<String, dynamic>),
  type: const BroadcastTypeConverter().fromJson(json['type'] as String),
  coHosts: (json['co_hosts'] as List<dynamic>)
      .map((e) => User.fromJson(e as Map<String, dynamic>))
      .toList(),
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
  speakers: (json['speakers'] as List<dynamic>)
      .map((e) => User.fromJson(e as Map<String, dynamic>))
      .toList(),
  participants: (json['participants'] as List<dynamic>)
      .map((e) => User.fromJson(e as Map<String, dynamic>))
      .toList(),
  participantsCount: (json['participants_count'] as num).toInt(),
  muted: (json['muted'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  hasStarted: json['has_started'] as bool,
  hasEnded: json['has_ended'] as bool,
  recordingStatus: _$JsonConverterFromJson<String, RecordingStatus>(
    json['recording_status'],
    const RecordingStatusConverter().fromJson,
  ),
  recordingUrl: json['recording_url'] as String?,
  isActive: json['is_active'] as bool,
  startTime: DateTime.parse(json['start_time'] as String),
  endTime: json['end_time'] == null
      ? null
      : DateTime.parse(json['end_time'] as String),
);

Map<String, dynamic> _$BroadcastToJson(_Broadcast instance) =>
    <String, dynamic>{
      'id': instance.id,
      'host': instance.host,
      'type': const BroadcastTypeConverter().toJson(instance.type),
      'co_hosts': instance.coHosts,
      'title': instance.title,
      'description': instance.description,
      'county': instance.county,
      'constituency': instance.constituency,
      'ward': instance.ward,
      'speakers': instance.speakers,
      'participants': instance.participants,
      'participants_count': instance.participantsCount,
      'muted': instance.muted,
      'has_started': instance.hasStarted,
      'has_ended': instance.hasEnded,
      'recording_status': _$JsonConverterToJson<String, RecordingStatus>(
        instance.recordingStatus,
        const RecordingStatusConverter().toJson,
      ),
      'recording_url': instance.recordingUrl,
      'is_active': instance.isActive,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
