// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  email: json['email'] as String,
  image: json['image'] as String,
  status: json['status'] as String,
  isActive: json['is_active'] as bool,
  isStaff: json['is_staff'] as bool,
  dateJoined: DateTime.parse(json['date_joined'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'email': instance.email,
  'image': instance.image,
  'status': instance.status,
  'is_active': instance.isActive,
  'is_staff': instance.isStaff,
  'date_joined': instance.dateJoined.toIso8601String(),
};
