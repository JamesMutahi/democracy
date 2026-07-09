// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SimpleUser _$SimpleUserFromJson(Map<String, dynamic> json) => _SimpleUser(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$SimpleUserToJson(_SimpleUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'image': instance.image,
    };
