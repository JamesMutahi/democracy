// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Asset _$AssetFromJson(Map<String, dynamic> json) => _Asset(
  id: json['id'] as String,
  name: json['name'] as String,
  fileKey: json['file_key'] as String,
  fileSize: (json['file_size'] as num).toInt(),
  contentType: const AssetContentTypeConverter().fromJson(
    json['content_type'] as String,
  ),
  url: json['url'] as String,
  isCompleted: json['is_completed'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$AssetToJson(_Asset instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'file_key': instance.fileKey,
  'file_size': instance.fileSize,
  'content_type': const AssetContentTypeConverter().toJson(
    instance.contentType,
  ),
  'url': instance.url,
  'is_completed': instance.isCompleted,
  'created_at': instance.createdAt.toIso8601String(),
};
