import 'dart:convert';

import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:isar_community/isar.dart';
import 'package:latlong2/latlong.dart';

part 'draft_post.g.dart';

@collection
class DraftPost {
  Id id = Isar.autoIncrement;
  String body = '';
  List<String> filePaths = [];
  late DateTime updatedAt;
  late DateTime createdAt;

  // STORAGE FIELDS
  @Name("location")
  String? locationJson;
  @Name("replyTo")
  String? replyToJson;
  @Name("repostOf")
  String? repostOfJson;
  @Name("communityNoteOf")
  String? communityNoteOfJson;
  @Name("ballot")
  String? ballotJson;
  @Name("survey")
  String? surveyJson;
  @Name("petition")
  String? petitionJson;
  @Name("meeting")
  String? meetingJson;
  @Name("section")
  String? sectionJson;
  @Name("tags")
  String? tagsJson;

  // GETTERS & SETTERS (Logic layer)

  DraftPost() {
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
  }

  @ignore
  LatLng? get location =>
      locationJson != null ? LatLng.fromJson(jsonDecode(locationJson!)) : null;
  set location(LatLng? value) =>
      locationJson = value != null ? jsonEncode(value.toJson()) : null;

  @ignore
  Post? get replyTo =>
      replyToJson != null ? Post.fromJson(jsonDecode(replyToJson!)) : null;
  set replyTo(Post? value) =>
      replyToJson = value != null ? jsonEncode(value.toJson()) : null;

  @ignore
  Post? get repostOf =>
      repostOfJson != null ? Post.fromJson(jsonDecode(repostOfJson!)) : null;
  set repostOf(Post? value) =>
      repostOfJson = value != null ? jsonEncode(value.toJson()) : null;

  @ignore
  Post? get communityNoteOf => communityNoteOfJson != null
      ? Post.fromJson(jsonDecode(communityNoteOfJson!))
      : null;
  set communityNoteOf(Post? value) =>
      communityNoteOfJson = value != null ? jsonEncode(value.toJson()) : null;

  @ignore
  Ballot? get ballot =>
      ballotJson != null ? Ballot.fromJson(jsonDecode(ballotJson!)) : null;
  set ballot(Ballot? value) =>
      ballotJson = value != null ? jsonEncode(value.toJson()) : null;

  @ignore
  Survey? get survey =>
      surveyJson != null ? Survey.fromJson(jsonDecode(surveyJson!)) : null;
  set survey(Survey? value) =>
      surveyJson = value != null ? jsonEncode(value.toJson()) : null;

  @ignore
  Petition? get petition => petitionJson != null
      ? Petition.fromJson(jsonDecode(petitionJson!))
      : null;
  set petition(Petition? value) =>
      petitionJson = value != null ? jsonEncode(value.toJson()) : null;

  @ignore
  Meeting? get meeting =>
      meetingJson != null ? Meeting.fromJson(jsonDecode(meetingJson!)) : null;
  set meeting(Meeting? value) =>
      meetingJson = value != null ? jsonEncode(value.toJson()) : null;

  @ignore
  Section? get section =>
      sectionJson != null ? Section.fromJson(jsonDecode(sectionJson!)) : null;
  set section(Section? value) =>
      sectionJson = value != null ? jsonEncode(value.toJson()) : null;

  @ignore
  List<Map<String, String>>? get tags => tagsJson != null
      ? List<Map<String, String>>.from(jsonDecode(tagsJson!))
      : null;
  set tags(List<Map<String, String>>? value) =>
      tagsJson = value != null ? jsonEncode(value) : null;
}
