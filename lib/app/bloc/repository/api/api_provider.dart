part of 'api_repository.dart';

class APIProvider {
  APIProvider({required this.dio});

  final Dio dio;

  Future<Map<String, dynamic>> createPost({
    required String body,
    required PostStatus status,
    Post? repostOf,
    RepostType? repostType,
    Post? replyTo,
    int? communityNoteOfId,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Broadcast? broadcast,
    Section? section,
    List<Map> tags = const [],
    List<Map> assets = const [],
    LatLng? location,
  }) async {
    try {
      final data = {
        'status': status == PostStatus.published ? 'published' : 'draft',
        'body': body,
        'reply_to_id': replyTo?.id,
        'repost_of_id': repostOf?.id,
        'repost_type': repostType == RepostType.repost ? 'repost' : 'quote',
        'community_note_of_id': communityNoteOfId,
        'ballot_id': ballot?.id,
        'survey_id': survey?.id,
        'petition_id': petition?.id,
        'broadcast_id': broadcast?.id,
        'section_id': section?.id,
        if (location != null)
          'location': 'POINT (${location.longitude} ${location.latitude})',
      };

      /// Flatten keys for lists: Manually add tags in a format Django Rest Framework understands
      for (int i = 0; i < tags.length; i++) {
        data["tags[$i]id"] = tags[i]['id'];
        data["tags[$i]text"] = tags[i]['text'];
      }

      for (int i = 0; i < assets.length; i++) {
        data["assets[$i]name"] = assets[i]['name'];
        data["assets[$i]content_type"] = assets[i]['type'];
        data["assets[$i]file_size"] = assets[i]['size'];
      }

      Response response = await dio.post(
        'post/create/',
        data: FormData.fromMap(data),
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

  Future<List<dynamic>> generatePostUploadUrl({required int id}) async {
    try {
      final data = {'id': id};
      Response response = await dio.post(
        'post/generate-upload-urls/',
        data: data,
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

  Future<String> uploadPostAsset({
    required String name,
    required String url,
    required void Function(int, int) onSendProgress,
  }) async {
    try {
      final directory = await getTemporaryDirectory();

      String fullPath = p.join(directory.path, name);

      final file = File(fullPath);

      int fileSize = await file.length();

      // Perform the PUT request
      Response response = await Dio().put(
        url,
        data: file.openRead(), // Send as stream to save memory
        options: Options(
          headers: {
            Headers.contentLengthHeader: fileSize,
            // Ensure this matches the presigned URL configuration
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

  Future<Map> postAssetUploadComplete({
    required List<String> assetIdList,
  }) async {
    try {
      final data = {'asset_id_list': assetIdList};
      Response response = await dio.post(
        'post/asset-upload-complete/',
        data: FormData.fromMap(data),
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

  Future<Map<String, dynamic>> createMessage({
    required String uuid,
    required int chatId,
    required String text,
    Post? post,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Broadcast? broadcast,
    Section? section,
    List<Map> assets = const [],
    LatLng? location,
  }) async {
    try {
      final data = {
        'uuid': uuid,
        'chat': chatId,
        'text': text,
        'post_id': post?.id,
        'ballot_id': ballot?.id,
        'survey_id': survey?.id,
        'petition_id': petition?.id,
        'broadcast_id': broadcast?.id,
        'section_id': section?.id,
        if (location != null)
          'location': 'POINT (${location.longitude} ${location.latitude})',
      };

      for (int i = 0; i < assets.length; i++) {
        data["assets[$i]name"] = assets[i]['name'];
        data["assets[$i]content_type"] = assets[i]['type'];
        data["assets[$i]file_size"] = assets[i]['size'];
      }

      Response response = await dio.post(
        'chat/create-message/',
        data: FormData.fromMap(data),
      );
      if (response.statusCode == 201) {
        return response.data;
      } else {
        return Future.error(response.data.toString());
      }
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<List<dynamic>> generateMessageUploadUrl({
    required Message message,
  }) async {
    try {
      final data = {'message_id': message.id};
      Response response = await dio.post(
        'chat/generate-upload-urls/',
        data: data,
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

  Future<String> uploadMessageAsset({
    required String name,
    required String url,
    required void Function(int, int) onSendProgress,
  }) async {
    try {
      final directory = await getTemporaryDirectory();

      String fullPath = p.join(directory.path, name);

      final file = File(fullPath);

      int fileSize = await file.length();

      // Perform the PUT request
      Response response = await Dio().put(
        url,
        data: file.openRead(), // Send as stream to save memory
        options: Options(
          headers: {
            Headers.contentLengthHeader: fileSize,
            // Ensure this matches the presigned URL configuration
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

  Future<List<Asset>> messageAssetUploadComplete({
    required List<String> assetIdList,
  }) async {
    try {
      final data = {'asset_id_list': assetIdList};
      Response response = await dio.post(
        'chat/asset-upload-complete/',
        data: FormData.fromMap(data),
      );
      if (response.statusCode == 200) {
        List<Asset> assets = List.from(
          response.data.map((e) => Asset.fromJson(e)),
        );
        return assets;
      } else {
        return Future.error(response.data.toString());
      }
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }

  Future patchMessage({required Message message}) async {
    try {
      final data = {'text': message.text};
      Response response = await dio.patch(
        'chat/message/${message.id}/',
        data: FormData.fromMap(data),
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

  Future deleteMessage({required Message message}) async {
    try {
      Response response = await dio.delete('chat/message/${message.id}/');
      if (response.statusCode == 204) {
        return response.data;
      } else {
        return Future.error(response.data.toString());
      }
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Map<String, dynamic>> createDirectMessage({
    required List<User> users,
    required String text,
    Post? post,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Broadcast? broadcast,
    Section? section,
    List<Map> assets = const [],
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
        'broadcast_id': broadcast?.id,
        'section_id': section?.id,
        if (location != null)
          'location': 'POINT (${location.longitude} ${location.latitude})',
      };

      for (int i = 0; i < assets.length; i++) {
        data["assets[$i]name"] = assets[i]['name'];
        data["assets[$i]content_type"] = assets[i]['type'];
        data["assets[$i]file_size"] = assets[i]['size'];
      }

      Response response = await dio.post(
        'chat/direct-message/',
        data: FormData.fromMap(data),
      );
      if (response.statusCode == 201) {
        return response.data;
      } else {
        return Future.error(response.data.toString());
      }
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Petition> createPetition({
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
      Response response = await dio.post('petition/create/', data: data);
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
      Response response = await dio.patch('user/', data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return Future.error(response.data.toString());
      }
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Map> getBroadcastToken({required Broadcast broadcast}) async {
    try {
      FormData data = FormData.fromMap({'broadcast_id': broadcast.id});
      Response response = await dio.post('broadcast/token/', data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return Future.error(response.data.toString());
      }
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Map> startRecording({required Broadcast broadcast}) async {
    try {
      FormData data = FormData.fromMap({'broadcast_id': broadcast.id});
      Response response = await dio.post(
        'broadcast/start-recording/',
        data: data,
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

  Future<Map> stopRecording({required Broadcast broadcast}) async {
    try {
      FormData data = FormData.fromMap({'broadcast_id': broadcast.id});
      Response response = await dio.post(
        'broadcast/stop-recording/',
        data: data,
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
