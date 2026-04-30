import 'dart:convert';

import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:latlong2/latlong.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class DraftPost {
  @Id()
  int id = 0;

  String body = '';
  List<String> filePaths = [];
  late DateTime updatedAt;
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
  Post? get communityNoteOf =>
      communityNoteOfJson != null
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
  Petition? get petition =>
      petitionJson != null ? Petition.fromJson(jsonDecode(petitionJson!)) : null;

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
  List<Map<String, String>>? get tags =>
      tagsJson != null
          ? List<Map<String, String>>.from(jsonDecode(tagsJson!))
          : null;

  @Transient()
  set tags(List<Map<String, String>>? value) {
    tagsJson = value != null && value.isNotEmpty
        ? jsonEncode(value)
        : null;
  }

  DraftPost({
    this.id = 0,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.createdAt = createdAt ?? DateTime.now();
    this.updatedAt = updatedAt ?? DateTime.now();
  }
}