// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker_invite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpeakerInvite _$SpeakerInviteFromJson(Map<String, dynamic> json) =>
    _SpeakerInvite(
      id: (json['id'] as num).toInt(),
      broadcastId: (json['broadcast'] as num).toInt(),
      userId: (json['user'] as num).toInt(),
      role: const SpeakerRoleConverter().fromJson(json['role'] as String),
      isAccepted: json['is_accepted'] as bool?,
    );

Map<String, dynamic> _$SpeakerInviteToJson(_SpeakerInvite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'broadcast': instance.broadcastId,
      'user': instance.userId,
      'role': const SpeakerRoleConverter().toJson(instance.role),
      'is_accepted': instance.isAccepted,
    };
