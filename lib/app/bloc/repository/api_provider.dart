part of 'api_repository.dart';

class APIProvider {
  APIProvider({required this.dio});

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
    List<Map> assets = const [],
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

      for (int i = 0; i < assets.length; i++) {
        data["assets[$i]name"] = assets[i]['name'];
        data["assets[$i]content_type"] = assets[i]['type'];
        data["assets[$i]file_size"] = assets[i]['size'];
      }

      Response response = await dio.post(
        'post/create/',
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
      Response response = await dio.put(
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
    List<Map> tags = const [],
    List<Map> assets = const [],
    LatLng? location,
  }) async {
    try {
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
        'post/update/$id/',
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

  Future<Map<String, dynamic>> createMessage({
    required String token,
    required Chat chat,
    required String text,
    Post? post,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Meeting? meeting,
    Section? section,
    List<Map> assets = const [],
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

      for (int i = 0; i < assets.length; i++) {
        data["assets[$i]name"] = assets[i]['name'];
        data["assets[$i]content_type"] = assets[i]['type'];
        data["assets[$i]file_size"] = assets[i]['size'];
      }

      Response response = await dio.post(
        'chat/create-message/',
        data: FormData.fromMap(data),
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
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
      Response response = await dio.put(
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
    required String token,
    required List<String> assetIdList,
  }) async {
    try {
      final data = {'asset_id_list': assetIdList};
      Response response = await dio.post(
        'chat/asset-upload-complete/',
        data: FormData.fromMap(data),
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
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

  Future<Map<String, dynamic>> createDirectMessage({
    required String token,
    required List<User> users,
    required String text,
    Post? post,
    Ballot? ballot,
    Survey? survey,
    Petition? petition,
    Meeting? meeting,
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
        'meeting_id': meeting?.id,
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
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
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
        'petition/create/',
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
