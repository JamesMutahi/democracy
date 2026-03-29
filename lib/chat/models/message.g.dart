// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  id: (json['id'] as num).toInt(),
  chat: (json['chat'] as num).toInt(),
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  text: json['text'] as String,
  post: json['post'] == null
      ? null
      : Post.fromJson(json['post'] as Map<String, dynamic>),
  ballot: json['ballot'] == null
      ? null
      : Ballot.fromJson(json['ballot'] as Map<String, dynamic>),
  survey: json['survey'] == null
      ? null
      : Survey.fromJson(json['survey'] as Map<String, dynamic>),
  petition: json['petition'] == null
      ? null
      : Petition.fromJson(json['petition'] as Map<String, dynamic>),
  meeting: json['meeting'] == null
      ? null
      : Meeting.fromJson(json['meeting'] as Map<String, dynamic>),
  image1Url: json['image1'] as String?,
  image2Url: json['image2'] as String?,
  image3Url: json['image3'] as String?,
  image4Url: json['image4'] as String?,
  videoUrl: json['video'] as String?,
  fileUrl: json['file'] as String?,
  location: json['location'] == null
      ? null
      : LatLng.fromJson(json['location'] as Map<String, dynamic>),
  isRead: json['is_read'] as bool,
  isEdited: json['is_edited'] as bool,
  isDeleted: json['is_deleted'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'id': instance.id,
  'chat': instance.chat,
  'user': instance.user,
  'text': instance.text,
  'post': instance.post,
  'ballot': instance.ballot,
  'survey': instance.survey,
  'petition': instance.petition,
  'meeting': instance.meeting,
  'image1': instance.image1Url,
  'image2': instance.image2Url,
  'image3': instance.image3Url,
  'image4': instance.image4Url,
  'video': instance.videoUrl,
  'file': instance.fileUrl,
  'location': instance.location,
  'is_read': instance.isRead,
  'is_edited': instance.isEdited,
  'is_deleted': instance.isDeleted,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
