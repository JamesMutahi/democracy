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
  county: json['county'] == null
      ? null
      : County.fromJson(json['county'] as Map<String, dynamic>),
  constituency: json['constituency'] == null
      ? null
      : Constituency.fromJson(json['constituency'] as Map<String, dynamic>),
  ward: json['ward'] == null
      ? null
      : Ward.fromJson(json['ward'] as Map<String, dynamic>),
  image: json['image'] as String,
  video: json['video'] as String?,
  supporters: (json['supporters'] as num).toInt(),
  recentSupporters: (json['recent_supporters'] as List<dynamic>)
      .map((e) => User.fromJson(e as Map<String, dynamic>))
      .toList(),
  isSupported: json['is_supported'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  isActive: json['is_active'] as bool,
);

Map<String, dynamic> _$PetitionToJson(_Petition instance) => <String, dynamic>{
  'id': instance.id,
  'author': instance.author,
  'title': instance.title,
  'description': instance.description,
  'county': instance.county,
  'constituency': instance.constituency,
  'ward': instance.ward,
  'image': instance.image,
  'video': instance.video,
  'supporters': instance.supporters,
  'recent_supporters': instance.recentSupporters,
  'is_supported': instance.isSupported,
  'created_at': instance.createdAt.toIso8601String(),
  'is_active': instance.isActive,
};
