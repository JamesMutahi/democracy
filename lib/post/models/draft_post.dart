import 'dart:convert';

import 'package:democracy/app/core/app_logger.dart';
import 'package:democracy/app/models/asset.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:latlong2/latlong.dart';

part 'draft_post.g.dart';

@HiveType(typeId: 50)
class DraftPost extends HiveObject {
  @HiveField(0)
  int? serverID;

  @HiveField(1)
  String body = '';

  @HiveField(2)
  List<String> filePaths = [];

  @HiveField(3)
  String? syncStatus;

  @HiveField(4)
  String? syncType;

  @HiveField(5)
  DateTime updatedAt = DateTime.now();

  @HiveField(6)
  DateTime createdAt = DateTime.now();

  // JSON storage fields (these are persisted)
  @HiveField(7)
  String? locationJson;

  @HiveField(8)
  String? replyToJson;

  @HiveField(9)
  String? repostOfJson;

  @HiveField(10)
  String? communityNoteOfJson;

  @HiveField(11)
  String? ballotJson;

  @HiveField(12)
  String? surveyJson;

  @HiveField(13)
  String? petitionJson;

  @HiveField(14)
  String? broadcastJson;

  @HiveField(15)
  String? sectionJson;

  @HiveField(16)
  String? tagsJson;

  @HiveField(17)
  String? assetsJson;

  // ==================== COMPUTED / TRANSIENT PROPERTIES ====================
  // These are NOT persisted (no @HiveField)

  LatLng? get location =>
      locationJson != null ? LatLng.fromJson(jsonDecode(locationJson!)) : null;

  set location(LatLng? value) =>
      locationJson = value != null ? jsonEncode(value.toJson()) : null;

  Post? get replyTo =>
      replyToJson != null ? Post.fromJson(jsonDecode(replyToJson!)) : null;

  set replyTo(Post? value) =>
      replyToJson = value != null ? jsonEncode(value.toJson()) : null;

  Post? get repostOf =>
      repostOfJson != null ? Post.fromJson(jsonDecode(repostOfJson!)) : null;

  set repostOf(Post? value) =>
      repostOfJson = value != null ? jsonEncode(value.toJson()) : null;

  Post? get communityNoteOf => communityNoteOfJson != null
      ? Post.fromJson(jsonDecode(communityNoteOfJson!))
      : null;

  set communityNoteOf(Post? value) =>
      communityNoteOfJson = value != null ? jsonEncode(value.toJson()) : null;

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

  List<Map<String, String>> get tags => tagsJson != null
      ? List<Map<String, String>>.from(jsonDecode(tagsJson!))
      : [];

  set tags(List<Map<String, String>>? value) {
    tagsJson = value != null && value.isNotEmpty ? jsonEncode(value) : null;
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

  DraftPost({
    this.serverID,
    this.body = '',
    List<String>? filePaths,
    this.syncStatus,
    this.syncType,
    Post? replyTo,
    Post? repostOf,
    Post? communityNoteOf,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Broadcast? broadcast,
    Section? section,
    LatLng? location,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.filePaths = filePaths ?? [];
    this.createdAt = createdAt ?? DateTime.now();
    this.updatedAt = updatedAt ?? DateTime.now();

    if (replyTo != null) this.replyTo = replyTo;
    if (repostOf != null) this.repostOf = repostOf;
    if (communityNoteOf != null) this.communityNoteOf = communityNoteOf;
    if (ballot != null) this.ballot = ballot;
    if (survey != null) this.survey = survey;
    if (petition != null) this.petition = petition;
    if (broadcast != null) this.broadcast = broadcast;
    if (section != null) this.section = section;
    if (location != null) this.location = location;
  }
}