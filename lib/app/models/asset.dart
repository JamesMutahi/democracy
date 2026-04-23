import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset.freezed.dart';
part 'asset.g.dart';

enum ContentType { image, video, document }

@freezed
sealed class Asset with _$Asset {
  const factory Asset({
    required final String id,
    required final String name,
    @JsonKey(name: 'file_key') required String fileKey,
    @JsonKey(name: 'file_size') required int fileSize,
    @JsonKey(name: 'content_type')
    @AssetContentTypeConverter()
    required ContentType contentType,
    required String url,
    @JsonKey(name: 'is_completed') required bool isCompleted,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Asset;

  factory Asset.fromJson(Map<String, Object?> json) => _$AssetFromJson(json);
}

class AssetContentTypeConverter implements JsonConverter<ContentType, String> {
  const AssetContentTypeConverter();

  @override
  ContentType fromJson(String data) {
    ContentType type = ContentType.document;
    if (data.contains('image')) {
      type = ContentType.image;
    }
    if (data.contains('video')) {
      type = ContentType.video;
    }
    return type;
  }

  @override
  String toJson(ContentType object) {
    throw UnimplementedError();
  }
}
