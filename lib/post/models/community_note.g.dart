// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommunityNote _$CommunityNoteFromJson(Map<String, dynamic> json) =>
    _CommunityNote(
      id: (json['id'] as num).toInt(),
      author: User.fromJson(json['author'] as Map<String, dynamic>),
      text: json['text'] as String,
      isHelpfulVotes: (json['is_helpful_votes'] as num).toInt(),
      isNotHelpfulVotes: (json['is_not_helpful_votes'] as num).toInt(),
      helpfulScore: (json['helpful_score'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$CommunityNoteToJson(_CommunityNote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'text': instance.text,
      'is_helpful_votes': instance.isHelpfulVotes,
      'is_not_helpful_votes': instance.isNotHelpfulVotes,
      'helpful_score': instance.helpfulScore,
      'created_at': instance.createdAt.toIso8601String(),
    };
