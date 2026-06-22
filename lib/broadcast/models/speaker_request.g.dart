// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpeakerRequest _$SpeakerRequestFromJson(Map<String, dynamic> json) =>
    _SpeakerRequest(
      id: (json['id'] as num).toInt(),
      broadcast: (json['broadcast'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      isApproved: json['is_approved'] as bool?,
      decidedBy: json['decided_by'] as String?,
    );

Map<String, dynamic> _$SpeakerRequestToJson(_SpeakerRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'broadcast': instance.broadcast,
      'user': instance.user,
      'is_approved': instance.isApproved,
      'decided_by': instance.decidedBy,
    };
