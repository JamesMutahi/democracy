import 'dart:io';

import 'package:democracy/app/models/asset.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/chat/models/chat.dart';
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

part 'api_provider.dart';

class APIRepository {
  APIRepository({required this.apiProvider});

  final APIProvider apiProvider;

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
    List<Map> assets = await getAssets(filePaths);
    return await apiProvider.createPost(
      token: token,
      body: body,
      status: status,
      repostOf: repostOf,
      replyTo: replyTo,
      communityNoteOf: communityNoteOf,
      ballot: ballot,
      survey: survey,
      petition: petition,
      meeting: meeting,
      section: section,
      tags: tags,
      assets: assets,
      location: location,
    );
  }

  Future<String> uploadPostAsset({
    required String name,
    required String url,
    required void Function(int, int) onSendProgress,
  }) async {
    return await apiProvider.uploadPostAsset(
      name: name,
      url: url,
      onSendProgress: onSendProgress,
    );
  }

  Future<Map> postAssetUploadComplete({
    required String token,
    required List<String> assetIdList,
  }) async {
    return await apiProvider.postAssetUploadComplete(
      token: token,
      assetIdList: assetIdList,
    );
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
    List<String> filePaths = const [],
    LatLng? location,
  }) async {
    List<Map> assets = await getAssets(filePaths);

    return await apiProvider.createMessage(
      token: token,
      chat: chat,
      text: text,
      post: post,
      ballot: ballot,
      survey: survey,
      petition: petition,
      meeting: meeting,
      section: section,
      assets: assets,
      location: location,
    );
  }

  Future<String> uploadMessageAsset({
    required String name,
    required String url,
    required void Function(int, int) onSendProgress,
  }) async {
    return await apiProvider.uploadMessageAsset(
      name: name,
      url: url,
      onSendProgress: onSendProgress,
    );
  }

  Future<List<Asset>> messageAssetUploadComplete({
    required String token,
    required List<String> assetIdList,
  }) async {
    return await apiProvider.messageAssetUploadComplete(
      token: token,
      assetIdList: assetIdList,
    );
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
    List<String> filePaths = const [],
    LatLng? location,
  }) async {
    List<Map> assets = await getAssets(filePaths);

    return await apiProvider.createDirectMessage(
      token: token,
      users: users,
      text: text,
      post: post,
      ballot: ballot,
      survey: survey,
      petition: petition,
      meeting: meeting,
      section: section,
      assets: assets,
      location: location,
    );
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
    return await apiProvider.createPetition(
      token: token,
      title: title,
      description: description,
      imagePath: imagePath,
      county: county,
      constituency: constituency,
      ward: ward,
    );
  }

  Future<Map> patchUser({
    required User user,
    required String token,
    required String name,
    required String bio,
    required String? imagePath,
    required String? coverPhotoPath,
  }) async {
    return await apiProvider.patchUser(
      user: user,
      token: token,
      name: name,
      bio: bio,
      imagePath: imagePath,
      coverPhotoPath: coverPhotoPath,
    );
  }

  Future<List<Map>> getAssets(List<String> filePaths) async {
    List<Map> assets = [];
    for (var filePath in filePaths) {
      File file = File(filePath);
      int bytes = await file.length();
      assets.add({
        "name": filePath.split('/').last,
        "type": lookupMimeType(filePath),
        "size": bytes,
      });
    }
    return assets;
  }
}
