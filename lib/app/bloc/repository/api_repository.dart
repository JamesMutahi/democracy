import 'dart:convert';
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
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class APIRepository {
  APIRepository({required this.dio});

  final Dio dio;

  Future<Map<String, dynamic>> createPost({
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
    List<Map> tags = const [],
    List<String> filePaths = const [],
    LatLng? location,
  }) async {
    try {
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
        if (location != null)
          'location': 'POINT (${location.longitude} ${location.latitude})',
      };

      /// Flatten keys for lists: Manually add tags in a format Django Rest Framework understands
      for (int i = 0; i < tags.length; i++) {
        data["tags[$i]id"] = tags[i]['id'];
        data["tags[$i]text"] = tags[i]['text'];
      }

      List assets = [];
      for (var filePath in filePaths) {
        File file = File(filePath);
        int bytes = await file.length();
        assets.add({
          "name": filePath.split('/').last,
          "type": lookupMimeType(filePath),
          "size": bytes,
        });
      }

      for (int i = 0; i < assets.length; i++) {
        data["assets[$i]name"] = assets[i]['name'];
        data["assets[$i]content_type"] = assets[i]['type'];
        data["assets[$i]file_size"] = assets[i]['size'];
      }

      Response response = await dio.post(
        '/post/create/',
        data: FormData.fromMap(data),
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );

      if (response.statusCode == 201) {
        return response.data;
      } else {
        return Future.error('Failed to create post: ${response.data}');
      }
    } on DioException catch (e) {
      return Future.error(e.response?.data ?? e.message ?? 'Unknown error');
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<String> uploadAsset({
    required String name,
    required String url,
    required void Function(int, int) onSendProgress,
  }) async {
    try {
      final directory = await getApplicationDocumentsDirectory();

      String fullPath = p.join(directory.path, name);

      final file = File(fullPath);

      int fileSize = await file.length();

      // Perform the PUT request
      Response response = await dio.put(
        url,
        data: file.openRead(), // Send as stream to save memory
        options: Options(
          headers: {
            Headers.contentLengthHeader: fileSize,
            // Ensure this matches your presigned URL configuration
            'Content-Type': lookupMimeType(file.path),
          },
        ),
        // Track progress
        onSendProgress: onSendProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return Future.error(response.data.toString());
      }
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Map> assetUploadComplete({
    required String token,
    required List<String> assetIdList,
  }) async {
    try {
      Response response = await dio.post(
        'post/asset-upload-complete/',
        data: jsonEncode({'asset_id_list': assetIdList}),
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return Future.error(response.data.toString());
      }
    } on DioException catch (e) {
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
    List<Map<String, dynamic>> tags = const [],
    List<String> filePaths = const [],
    LatLng? location,
  }) async {
    try {
      List assets = [];
      for (var filePath in filePaths) {
        File file = File(filePath);
        int bytes = await file.length();
        assets.add({
          "name": filePath.split('/').last,
          "type": p.extension(filePath),
          "size": bytes,
        });
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
        'assets': assets,
        if (location != null)
          'location': 'POINT (${location.longitude} ${location.latitude})',
      };

      // Flatten keys: Manually add tags in a format Django Rest Framework understands
      for (int i = 0; i < tags.length; i++) {
        data["tags[$i]id"] = tags[i]['id'];
        data["tags[$i]text"] = tags[i]['text'];
      }

      Response response = await dio.patch(
        '/post/update/$id/',
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
    List<String> filePaths = const [],
    LatLng? location,
  }) async {
    try {
      final data = {
        'chat': chat.id,
        'text': text,
        'post_id': post?.id,
        'ballot_id': ballot?.id,
        'survey_id': survey?.id,
        'petition_id': petition?.id,
        'meeting_id': meeting?.id,
        'section_id': section?.id,
        if (location != null)
          'location': 'POINT (${location.longitude} ${location.latitude})',
      };

      List assets = [];
      for (var filePath in filePaths) {
        File file = File(filePath);
        int bytes = await file.length();
        assets.add({
          "name": filePath.split('/').last,
          "type": lookupMimeType(filePath),
          "size": bytes,
        });
      }

      for (int i = 0; i < assets.length; i++) {
        data["assets[$i]name"] = assets[i]['name'];
        data["assets[$i]content_type"] = assets[i]['type'];
        data["assets[$i]file_size"] = assets[i]['size'];
      }

      Response response = await dio.post(
        '/chat/create-message/',
        data: FormData.fromMap(data),
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
    List<String> filePaths = const [],
    LatLng? location,
  }) async {
    try {
      List<int> userIds = users.map((user) => user.id).toList();
      final data = {
        'user_ids': userIds,
        'text': text,
        'post_id': post?.id,
        'ballot_id': ballot?.id,
        'survey_id': survey?.id,
        'petition_id': petition?.id,
        'meeting_id': meeting?.id,
        'section_id': section?.id,
        if (location != null)
          'location': 'POINT (${location.longitude} ${location.latitude})',
      };

      List assets = [];
      for (var filePath in filePaths) {
        File file = File(filePath);
        int bytes = await file.length();
        assets.add({
          "name": filePath.split('/').last,
          "type": lookupMimeType(filePath),
          "size": bytes,
        });
      }

      for (int i = 0; i < assets.length; i++) {
        data["assets[$i]name"] = assets[i]['name'];
        data["assets[$i]content_type"] = assets[i]['type'];
        data["assets[$i]file_size"] = assets[i]['size'];
      }

      Response response = await dio.post(
        '/chat/direct-message/',
        data: FormData.fromMap(data),
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

  Future<Map> patchUser({
    required User user,
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
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return Future.error(response.data.toString());
      }
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }
}
