// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Petition _$PetitionFromJson(Map<String, dynamic> json) => _Petition(
  id: (json['id'] as num).toInt(),
  author: User.fromJson(json['author'] as Map<String, dynamic>),
  title: json['title'] as String,
  description: json['description'] as String,
  image: json['image'] as String?,
  video: json['video'] as String?,
  supporters: (json['supporters'] as num).toInt(),
  recentSupporters:
      (json['recent_supporters'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
  startTime: DateTime.parse(json['start_time'] as String),
  endTime: DateTime.parse(json['end_time'] as String),
);

Map<String, dynamic> _$PetitionToJson(_Petition instance) => <String, dynamic>{
  'id': instance.id,
  'author': instance.author,
  'title': instance.title,
  'description': instance.description,
  'image': instance.image,
  'video': instance.video,
  'supporters': instance.supporters,
  'recent_supporters': instance.recentSupporters,
  'start_time': instance.startTime.toIso8601String(),
  'end_time': instance.endTime.toIso8601String(),
};
