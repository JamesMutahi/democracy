import 'dart:io';

import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/user/models/user.dart';
import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';

class APIRepository {
  APIRepository({required this.dio});

  final Dio dio;

  Future<Post> createPost({
    required String token,
    required String body,
    required PostStatus status,
    Post? repostOf,
    Post? replyTo,
    Post? communityNoteOf,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Meeting? meeting,
    Section? section,
    required List<Map> tags,
    String? imagePath1,
    String? imagePath2,
    String? imagePath3,
    String? imagePath4,
    String? videoPath,
    String? filePath,
    LatLng? location,
  }) async {
    try {
      String? fileName;
      if (filePath != null) {
        File file = File(filePath);
        fileName = file.path.split('/').last;
      }

      final data = {
        'status': status == PostStatus.published ? 'published' : 'draft',
        'body': body,
        'reply_to_id': replyTo?.id,
        'repost_of_id': repostOf?.id,
        'community_note_of_id': communityNoteOf?.id,
        'ballot_id': ballot?.id,
        'survey_id': survey?.id,
        'petition_id': petition?.id,
        'meeting_id': meeting?.id,
        'section_id': section?.id,
        if (imagePath1 != null)
          'image1': await MultipartFile.fromFile(imagePath1),
        if (imagePath2 != null)
          'image2': await MultipartFile.fromFile(imagePath2),
        if (imagePath3 != null)
          'image3': await MultipartFile.fromFile(imagePath3),
        if (imagePath4 != null)
          'image4': await MultipartFile.fromFile(imagePath4),
        if (videoPath != null) 'video': await MultipartFile.fromFile(videoPath),
        if (filePath != null) 'file': await MultipartFile.fromFile(filePath),
        'file_name': fileName,
        if (location != null)
          'location': 'POINT (${location.longitude} ${location.latitude})',
      };

      // Flatten keys: Manually add tags in a format Django Rest Framework understands
      for (int i = 0; i < tags.length; i++) {
        data["tags[$i]id"] = tags[i]['id'];
        data["tags[$i]text"] = tags[i]['text'];
      }

      Response response = await dio.post(
        '/post/create/',
        data: FormData.fromMap(data),
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );

      if (response.statusCode == 201) {
        final Post post = Post.fromJson(response.data);
        return post;
      } else {
        return Future.error('Failed to create post: ${response.data}');
      }
    } on DioException catch (e) {
      return Future.error(e.response?.data ?? e.message ?? 'Unknown error');
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Post> patchPost({
    required String token,
    required int id,
    String? body,
    required PostStatus status,
    Post? repostOf,
    Post? replyTo,
    Post? communityNoteOf,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Meeting? meeting,
    Section? section,
    required List<Map<String, dynamic>> tags,
    String? imagePath1,
    String? imagePath2,
    String? imagePath3,
    String? imagePath4,
    String? videoPath,
    String? filePath,
    LatLng? location,
  }) async {
    try {
      String? fileName;
      if (filePath != null) {
        File file = File(filePath);
        fileName = file.path.split('/').last;
      }

      final data = {
        'status': status == PostStatus.published ? 'published' : 'draft',
        'body': ?body,
        'reply_to_id': ?replyTo?.id,
        'repost_of_id': ?repostOf?.id,
        'community_note_of_id': ?communityNoteOf?.id,
        'ballot_id': ?ballot?.id,
        'survey_id': ?survey?.id,
        'petition_id': ?petition?.id,
        'meeting_id': ?meeting?.id,
        'section_id': ?section?.id,
        if (imagePath1 != null)
          'image1': await MultipartFile.fromFile(imagePath1),
        if (imagePath2 != null)
          'image2': await MultipartFile.fromFile(imagePath2),
        if (imagePath3 != null)
          'image3': await MultipartFile.fromFile(imagePath3),
        if (imagePath4 != null)
          'image4': await MultipartFile.fromFile(imagePath4),
        if (videoPath != null) 'video': await MultipartFile.fromFile(videoPath),
        if (filePath != null) 'file': await MultipartFile.fromFile(filePath),
        'file_name': ?fileName,
        if (location != null)
          'location': 'POINT (${location.longitude} ${location.latitude})',
      };

      // Flatten keys: Manually add tags in a format Django Rest Framework understands
      for (int i = 0; i < tags.length; i++) {
        data["tags[$i]id"] = tags[i]['id'];
        data["tags[$i]text"] = tags[i]['text'];
      }

      Response response = await dio.patch(
        '/post/$id/update/',
        data: FormData.fromMap(data),
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode == 200) {
        final Post post = Post.fromJson(response.data);
        return post;
      } else {
        return Future.error(response.data.toString());
      }
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Message> createMessage({
    required String token,
    required Chat chat,
    required String text,
    Post? post,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Meeting? meeting,
    Section? section,
    String? imagePath1,
    String? imagePath2,
    String? imagePath3,
    String? imagePath4,
    String? videoPath,
    String? filePath,
    LatLng? location,
  }) async {
    try {
      String? fileName;
      if (filePath != null) {
        File file = File(filePath);
        fileName = file.path.split('/').last;
      }
      FormData data = FormData.fromMap({
        'chat': chat.id,
        'text': text,
        'post_id': post?.id,
        'ballot_id': ballot?.id,
        'survey_id': survey?.id,
        'petition_id': petition?.id,
        'meeting_id': meeting?.id,
        'section_id': section?.id,
        if (imagePath1 != null)
          'image1': await MultipartFile.fromFile(imagePath1),
        if (imagePath2 != null)
          'image2': await MultipartFile.fromFile(imagePath2),
        if (imagePath3 != null)
          'image3': await MultipartFile.fromFile(imagePath3),
        if (imagePath4 != null)
          'image4': await MultipartFile.fromFile(imagePath4),
        if (videoPath != null) 'video': await MultipartFile.fromFile(videoPath),
        if (filePath != null) 'file': await MultipartFile.fromFile(filePath),
        'file_name': ?fileName,
        if (location != null)
          'location': 'POINT (${location.longitude} ${location.latitude})',
      });
      Response response = await dio.post(
        '/chat/create-message/',
        data: data,
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode == 201) {
        final Message message = Message.fromJson(response.data);
        return message;
      } else {
        return Future.error(response.data.toString());
      }
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<List<Chat>> createDirectMessage({
    required String token,
    required List<User> users,
    required String text,
    Post? post,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Meeting? meeting,
    Section? section,
    String? imagePath1,
    String? imagePath2,
    String? imagePath3,
    String? imagePath4,
    String? videoPath,
    String? filePath,
    LatLng? location,
  }) async {
    try {
      String? fileName;
      if (filePath != null) {
        File file = File(filePath);
        fileName = file.path.split('/').last;
      }
      List<int> userIds = users.map((user) => user.id).toList();
      FormData data = FormData.fromMap({
        'user_ids': userIds,
        'text': text,
        'post_id': post?.id,
        'ballot_id': ballot?.id,
        'survey_id': survey?.id,
        'petition_id': petition?.id,
        'meeting_id': meeting?.id,
        'section_id': section?.id,
        if (imagePath1 != null)
          'image1': await MultipartFile.fromFile(imagePath1),
        if (imagePath2 != null)
          'image2': await MultipartFile.fromFile(imagePath2),
        if (imagePath3 != null)
          'image3': await MultipartFile.fromFile(imagePath3),
        if (imagePath4 != null)
          'image4': await MultipartFile.fromFile(imagePath4),
        if (videoPath != null) 'video': await MultipartFile.fromFile(videoPath),
        if (filePath != null) 'file': await MultipartFile.fromFile(filePath),
        'file_name': ?fileName,
        if (location != null)
          'location': 'POINT (${location.longitude} ${location.latitude})',
      });
      Response response = await dio.post(
        '/chat/direct-message/',
        data: data,
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode == 201) {
        final List<Chat> chats = List.from(
          response.data.map((e) => Chat.fromJson(e)),
        );
        return chats;
      } else {
        return Future.error(response.data.toString());
      }
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Petition> createPetition({
    required String token,
    required String title,
    required String imagePath,
    required String description,
    County? county,
    Constituency? constituency,
    Ward? ward,
  }) async {
    try {
      FormData data = FormData.fromMap({
        'title': title,
        'image': await MultipartFile.fromFile(imagePath),
        'description': description,
        'county_id': county?.id,
        'constituency_id': constituency?.id,
        'ward_id': ward?.id,
      });
      Response response = await dio.post(
        '/petition/create/',
        data: data,
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode == 201) {
        final Petition petition = Petition.fromJson(response.data);
        return petition;
      } else {
        return Future.error(response.data.toString());
      }
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }

  Future patchUser({
    required String token,
    required String name,
    required String bio,
    required String? imagePath,
    required String? coverPhotoPath,
  }) async {
    try {
      FormData data = FormData.fromMap({
        'name': name,
        'bio': bio,
        if (imagePath != null) 'image': await MultipartFile.fromFile(imagePath),
        if (coverPhotoPath != null)
          'cover_photo': await MultipartFile.fromFile(coverPhotoPath),
      });
      Response response = await dio.patch(
        'auth/user/',
        data: data,
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode != 200) {
        return Future.error(response.data.toString());
      }
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }
}
