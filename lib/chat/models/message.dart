import 'dart:convert';

import 'package:democracy/app/bloc/sync/sync_bloc.dart' show SyncStatus;
import 'package:democracy/app/core/app_logger.dart';
import 'package:democracy/app/models/asset.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/user/models/user.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:latlong2/latlong.dart';

part 'message.g.dart';

@HiveType(typeId: 61)
class Message extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  int chatId;

  @HiveField(2)
  String text = '';

  @HiveField(3)
  bool isRead = false;

  @HiveField(4)
  bool isEdited = false;

  @HiveField(5)
  bool isDeleted = false;

  @HiveField(6)
  String syncStatus = SyncStatus.synced;

  @HiveField(7)
  String? syncType;

  @HiveField(8)
  String uuid = '';

  @HiveField(9)
  List<String> filePaths = [];

  @HiveField(10)
  DateTime createdAt = DateTime.now();

  @HiveField(11)
  DateTime updatedAt = DateTime.now();

  // JSON storage fields
  @HiveField(12)
  String? authorJson;

  @HiveField(13)
  String? locationJson;

  @HiveField(14)
  String? postJson;

  @HiveField(15)
  String? ballotJson;

  @HiveField(16)
  String? surveyJson;

  @HiveField(17)
  String? petitionJson;

  @HiveField(18)
  String? broadcastJson;

  @HiveField(19)
  String? sectionJson;

  @HiveField(20)
  String? assetsJson;

  // ==================== TRANSIENT GETTERS & SETTERS ====================

  User get author {
    if (authorJson == null) throw Exception('Author not loaded');
    return User.fromJson(jsonDecode(authorJson!));
  }

  set author(User value) {
    authorJson = jsonEncode(value.toJson());
  }

  LatLng? get location =>
      locationJson != null ? LatLng.fromJson(jsonDecode(locationJson!)) : null;

  set location(LatLng? value) =>
      locationJson = value != null ? jsonEncode(value.toJson()) : null;

  Post? get post =>
      postJson != null ? Post.fromJson(jsonDecode(postJson!)) : null;

  set post(Post? value) =>
      postJson = value != null ? jsonEncode(value.toJson()) : null;

  Ballot? get ballot =>
      ballotJson != null ? Ballot.fromJson(jsonDecode(ballotJson!)) : null;

  set ballot(Ballot? value) =>
      ballotJson = value != null ? jsonEncode(value.toJson()) : null;

  Survey? get survey =>
      surveyJson != null ? Survey.fromJson(jsonDecode(surveyJson!)) : null;

  set survey(Survey? value) =>
      surveyJson = value != null ? jsonEncode(value.toJson()) : null;

  Petition? get petition => petitionJson != null
      ? Petition.fromJson(jsonDecode(petitionJson!))
      : null;

  set petition(Petition? value) =>
      petitionJson = value != null ? jsonEncode(value.toJson()) : null;

  Broadcast? get broadcast =>
      broadcastJson != null ? Broadcast.fromJson(jsonDecode(broadcastJson!)) : null;

  set broadcast(Broadcast? value) =>
      broadcastJson = value != null ? jsonEncode(value.toJson()) : null;

  Section? get section =>
      sectionJson != null ? Section.fromJson(jsonDecode(sectionJson!)) : null;

  set section(Section? value) =>
      sectionJson = value != null ? jsonEncode(value.toJson()) : null;

  List<Asset> get assets {
    if (assetsJson == null || assetsJson!.isEmpty) return [];
    try {
      final list = jsonDecode(assetsJson!) as List<dynamic>;
      return list
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      AppLogger.error('Error decoding assetsJson: $e');
      return [];
    }
  }

  set assets(List<Asset>? value) {
    if (value == null || value.isEmpty) {
      assetsJson = null;
      return;
    }
    try {
      final jsonList = value.map((asset) => asset.toJson()).toList();
      assetsJson = jsonEncode(jsonList);
    } catch (e) {
      AppLogger.error('Error encoding assets to JSON: $e');
      assetsJson = jsonEncode(
        value
            .map(
              (asset) => {
                'id': asset.id,
                'name': asset.name,
                'file_key': asset.fileKey,
                'file_size': asset.fileSize,
                'content_type': asset.contentType.name,
                'url': asset.url,
                'is_completed': asset.isCompleted,
                'created_at': asset.createdAt.toIso8601String(),
              },
            )
            .toList(),
      );
    }
  }

  // ==================== CONSTRUCTORS ====================

  Message({
    this.id,
    required this.chatId,
    User? author,
    this.text = '',
    this.filePaths = const [],
    Post? post,
    Survey? survey,
    Ballot? ballot,
    Broadcast? broadcast,
    Petition? petition,
    Section? section,
    LatLng? location,
    this.isRead = false,
    this.isEdited = false,
    this.isDeleted = false,
    this.syncStatus = SyncStatus.synced,
    this.syncType,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
  }) {
    if (author != null) this.author = author;
    if (post != null) this.post = post;
    if (survey != null) this.survey = survey;
    if (ballot != null) this.ballot = ballot;
    if (broadcast != null) this.broadcast = broadcast;
    if (petition != null) this.petition = petition;
    if (section != null) this.section = section;
    if (location != null) this.location = location;
  }

  // ==================== JSON SERIALIZATION ====================

  factory Message.fromJson(Map<String, dynamic> json) {
    final message = Message(
      id: json['id'],
      chatId: json['chat'],
      author: User.fromJson(json['author'] as Map<String, dynamic>),
      uuid: json['uuid'] as String,
      text: json['text'] as String,
      isRead: json['is_read'] as bool,
      isEdited: json['is_edited'] as bool,
      isDeleted: json['is_deleted'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

    if (json['post'] != null) {
      message.post = Post.fromJson(json['post'] as Map<String, dynamic>);
    }
    if (json['location'] != null) {
      message.location = LatLng.fromJson(
        json['location'] as Map<String, dynamic>,
      );
    }
    if (json['assets'] != null) {
      message.assets = (json['assets'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return message;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chat_id': chatId,
      'author': author.toJson(),
      'text': text,
      'is_read': isRead,
      'is_edited': isEdited,
      'is_deleted': isDeleted,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'post': post?.toJson(),
      'location': location?.toJson(),
      'assets': assets.map((e) => e.toJson()).toList(),
    };
  }
}
