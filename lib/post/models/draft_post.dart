import 'dart:convert';

import 'package:democracy/app/core/app_logger.dart';
import 'package:democracy/app/models/asset.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:latlong2/latlong.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class DraftPost {
  @Id()
  int id = 0;
  int? serverID;
  String body = '';
  List<String> filePaths = [];

  String? syncStatus;
  String? syncType;

  @Property(type: PropertyType.date)
  late DateTime updatedAt;

  @Property(type: PropertyType.date)
  late DateTime createdAt;

  // JSON storage fields
  String? locationJson;
  String? replyToJson;
  String? repostOfJson;
  String? communityNoteOfJson;
  String? ballotJson;
  String? surveyJson;
  String? petitionJson;
  String? meetingJson;
  String? sectionJson;
  String? tagsJson;
  String? assetsJson;

  // ==================== TRANSIENT GETTERS & SETTERS ====================

  @Transient()
  LatLng? get location =>
      locationJson != null ? LatLng.fromJson(jsonDecode(locationJson!)) : null;

  @Transient()
  set location(LatLng? value) =>
      locationJson = value != null ? jsonEncode(value.toJson()) : null;

  @Transient()
  Post? get replyTo =>
      replyToJson != null ? Post.fromJson(jsonDecode(replyToJson!)) : null;

  @Transient()
  set replyTo(Post? value) =>
      replyToJson = value != null ? jsonEncode(value.toJson()) : null;

  @Transient()
  Post? get repostOf =>
      repostOfJson != null ? Post.fromJson(jsonDecode(repostOfJson!)) : null;

  @Transient()
  set repostOf(Post? value) =>
      repostOfJson = value != null ? jsonEncode(value.toJson()) : null;

  @Transient()
  Post? get communityNoteOf => communityNoteOfJson != null
      ? Post.fromJson(jsonDecode(communityNoteOfJson!))
      : null;

  @Transient()
  set communityNoteOf(Post? value) =>
      communityNoteOfJson = value != null ? jsonEncode(value.toJson()) : null;

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
  List<Map<String, String>> get tags => tagsJson != null
      ? List<Map<String, String>>.from(jsonDecode(tagsJson!))
      : [];

  @Transient()
  set tags(List<Map<String, String>>? value) {
    tagsJson = value != null && value.isNotEmpty ? jsonEncode(value) : null;
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

  DraftPost({
    this.id = 0,
    Post? replyTo,
    Post? repostOf,
    Post? communityNoteOf,
    Survey? survey,
    Ballot? ballot,
    Meeting? meeting,
    Petition? petition,
    Section? section,
    LatLng? location,
    this.syncStatus,
    this.syncType,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    if (replyTo != null) {
      this.replyTo = replyTo;
    }
    if (repostOf != null) {
      this.repostOf = repostOf;
    }
    if (communityNoteOf != null) {
      this.communityNoteOf = communityNoteOf;
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
    this.createdAt = createdAt ?? DateTime.now();
    this.updatedAt = updatedAt ?? DateTime.now();
  }
}
