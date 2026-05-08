import 'dart:convert';

import 'package:democracy/app/core/app_logger.dart';
import 'package:democracy/app/models/asset.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/user/models/user.dart';
import 'package:latlong2/latlong.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Message {
  @Id()
  int targetId = 0;

  int? id; // Server ID

  String text = '';

  bool isRead = false;
  bool isEdited = false;
  bool isDeleted = false;

  String syncStatus = SyncStatus.synced;
  String? syncType;
  String uuid;

  List<String> filePaths = [];

  // Explicit DateTime
  @Property(type: PropertyType.date)
  DateTime createdAt;

  @Property(type: PropertyType.date)
  DateTime updatedAt;

  // JSON storage
  String? authorJson;
  String? locationJson;
  String? postJson;
  String? ballotJson;
  String? surveyJson;
  String? petitionJson;
  String? meetingJson;
  String? sectionJson;
  String? assetsJson;
  String? uploadsJson;

  // Relationship
  final chat = ToOne<Chat>();

  // ==================== TRANSIENT GETTERS & SETTERS ====================

  @Transient()
  User get author {
    if (authorJson == null) throw Exception('Author not loaded');
    return User.fromJson(jsonDecode(authorJson!));
  }

  @Transient()
  set author(User value) {
    authorJson = jsonEncode(value.toJson());
  }

  @Transient()
  LatLng? get location =>
      locationJson != null ? LatLng.fromJson(jsonDecode(locationJson!)) : null;

  @Transient()
  set location(LatLng? value) =>
      locationJson = value != null ? jsonEncode(value.toJson()) : null;

  @Transient()
  Post? get post =>
      postJson != null ? Post.fromJson(jsonDecode(postJson!)) : null;

  @Transient()
  set post(Post? value) =>
      postJson = value != null ? jsonEncode(value.toJson()) : null;

  @Transient()
  Ballot? get ballot =>
      ballotJson != null ? Ballot.fromJson(jsonDecode(ballotJson!)) : null;

  @Transient()
  set ballot(Ballot? value) =>
      ballotJson = value != null ? jsonEncode(value.toJson()) : null;

  @Transient()
  Survey? get survey =>
      surveyJson != null ? Survey.fromJson(jsonDecode(surveyJson!)) : null;

  @Transient()
  set survey(Survey? value) =>
      surveyJson = value != null ? jsonEncode(value.toJson()) : null;

  @Transient()
  Petition? get petition => petitionJson != null
      ? Petition.fromJson(jsonDecode(petitionJson!))
      : null;

  @Transient()
  set petition(Petition? value) =>
      petitionJson = value != null ? jsonEncode(value.toJson()) : null;

  @Transient()
  Meeting? get meeting =>
      meetingJson != null ? Meeting.fromJson(jsonDecode(meetingJson!)) : null;

  @Transient()
  set meeting(Meeting? value) =>
      meetingJson = value != null ? jsonEncode(value.toJson()) : null;

  @Transient()
  Section? get section =>
      sectionJson != null ? Section.fromJson(jsonDecode(sectionJson!)) : null;

  @Transient()
  set section(Section? value) =>
      sectionJson = value != null ? jsonEncode(value.toJson()) : null;

  @Transient()
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

  @Transient()
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
      // Safe fallback
      assetsJson = jsonEncode(
        value
            .map(
              (asset) => {
                'id': asset.id,
                'name': asset.name,
                'file_key': asset.fileKey,
                'file_size': asset.fileSize,
                'content_type':
                    asset.contentType.name, // or use converter if needed
                'url': asset.url,
                'is_completed': asset.isCompleted,
                'created_at': asset.createdAt.toIso8601String(),
              },
            )
            .toList(),
      );
    }
  }

  @Transient()
  List<Map<String, String>>? get uploads => uploadsJson != null
      ? List<Map<String, String>>.from(jsonDecode(uploadsJson!))
      : null;

  @Transient()
  set uploads(List<Map<String, String>>? value) {
    uploadsJson = value != null && value.isNotEmpty ? jsonEncode(value) : null;
  }

  // ==================== CONSTRUCTORS ====================

  Message({
    this.targetId = 0,
    this.id,
    User? author,
    this.text = '',
    this.filePaths = const [],
    Post? post,
    Survey? survey,
    Ballot? ballot,
    Meeting? meeting,
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
    if (author != null) {
      this.author = author;
    }
    if (post != null) {
      this.post = post;
    }
    if (survey != null) {
      this.survey = survey;
    }
    if (ballot != null) {
      this.ballot = ballot;
    }
    if (meeting != null) {
      this.meeting = meeting;
    }
    if (petition != null) {
      this.petition = petition;
    }
    if (section != null) {
      this.section = section;
    }
    if (location != null) {
      this.location = location;
    }
  }

  // ==================== JSON SERIALIZATION ====================

  factory Message.fromJson(Map<String, dynamic> json) {
    final message = Message(
      id: json['id'],
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

class SyncStatus {
  static const String pending = 'Pending';
  static const String synced = 'Synced';
  static const String failed = 'Failed';
}

class SyncType {
  static const String post = 'Post';
  static const String assets = 'Upload assets';
  static const String patch = 'Patch';
  static const String delete = 'Delete';
}
