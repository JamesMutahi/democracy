// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpeakerRequest _$SpeakerRequestFromJson(Map<String, dynamic> json) =>
    _SpeakerRequest(
      id: (json['id'] as num).toInt(),
      meeting: (json['meeting'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      isApproved: json['is_approved'] as bool?,
    );

Map<String, dynamic> _$SpeakerRequestToJson(_SpeakerRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meeting': instance.meeting,
      'user': instance.user,
      'is_approved': instance.isApproved,
    };
