import 'dart:io';
import 'dart:typed_data';

import 'package:democracy/app/models/asset.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
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

  Future<void> registerFcmDevice({
    required String token,
    required String type,
  }) async {
    await apiProvider.registerFcmDevice(token: token, type: type);
  }

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
    List<String> filePaths = const [],
    LatLng? location,
  }) async {
    List<Map> assets = await getAssets(filePaths);
    return await apiProvider.createPost(
      body: body,
      status: status,
      repostOf: repostOf,
      repostType: repostType,
      replyTo: replyTo,
      communityNoteOfId: communityNoteOfId,
      ballot: ballot,
      survey: survey,
      petition: petition,
      broadcast: broadcast,
      section: section,
      assets: assets,
      location: location,
    );
  }

  Future<List<dynamic>> generatePostUploadUrl({required int id}) async {
    return await apiProvider.generatePostUploadUrl(id: id);
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
    required List<String> assetIdList,
  }) async {
    return await apiProvider.postAssetUploadComplete(assetIdList: assetIdList);
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
    List<String> filePaths = const [],
    LatLng? location,
  }) async {
    List<Map> assets = await getAssets(filePaths);

    return await apiProvider.createMessage(
      uuid: uuid,
      chatId: chatId,
      text: text,
      post: post,
      ballot: ballot,
      survey: survey,
      petition: petition,
      broadcast: broadcast,
      section: section,
      assets: assets,
      location: location,
    );
  }

  Future<List<dynamic>> generateMessageUploadUrl({
    required Message message,
  }) async {
    return await apiProvider.generateMessageUploadUrl(message: message);
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
    required List<String> assetIdList,
  }) async {
    return await apiProvider.messageAssetUploadComplete(
      assetIdList: assetIdList,
    );
  }

  Future patchMessage({required Message message}) async {
    return await apiProvider.patchMessage(message: message);
  }

  Future deleteChat({required Chat chat}) async {
    return await apiProvider.deleteChat(chat: chat);
  }


  Future deleteMessage({required Message message}) async {
    return await apiProvider.deleteMessage(message: message);
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
    List<String> filePaths = const [],
    LatLng? location,
  }) async {
    List<Map> assets = await getAssets(filePaths);

    return await apiProvider.createDirectMessage(
      users: users,
      text: text,
      post: post,
      ballot: ballot,
      survey: survey,
      petition: petition,
      broadcast: broadcast,
      section: section,
      assets: assets,
      location: location,
    );
  }

  Future<Petition> createPetition({
    required String title,
    required String? imagePath,
    required Uint8List? imageBytes,
    required String description,
    County? county,
    Constituency? constituency,
    Ward? ward,
  }) async {
    return await apiProvider.createPetition(
      title: title,
      description: description,
      imagePath: imagePath,
      imageBytes: imageBytes,
      county: county,
      constituency: constituency,
      ward: ward,
    );
  }

  Future<Map> patchUser({
    required User user,
    required String name,
    required String bio,
    required String? imagePath,
    required String? coverPhotoPath,
    required Uint8List? imageBytes, // For Web
    required Uint8List? coverPhotoBytes, // For Web
  }) async {
    return await apiProvider.patchUser(
      user: user,
      name: name,
      bio: bio,
      imagePath: imagePath,
      coverPhotoPath: coverPhotoPath,
      imageBytes: imageBytes, // For Web
      coverPhotoBytes: coverPhotoBytes, // For Web
    );
  }

  Future<Map> getBroadcastToken({required Broadcast broadcast}) async {
    return await apiProvider.getBroadcastToken(broadcast: broadcast);
  }

  Future<Map> startRecording({required Broadcast broadcast}) async {
    return await apiProvider.startRecording(broadcast: broadcast);
  }

  Future<Map> stopRecording({required Broadcast broadcast}) async {
    return await apiProvider.stopRecording(broadcast: broadcast);
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
