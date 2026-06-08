// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AutocompleteUser _$AutocompleteUserFromJson(Map<String, dynamic> json) =>
    _AutocompleteUser(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$AutocompleteUserToJson(_AutocompleteUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'image': instance.image,
    };
