import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'petition.freezed.dart';
part 'petition.g.dart';

@freezed
sealed class Petition with _$Petition {
  const factory Petition({
    required final int id,
    required final User author,
    required String title,
    required String description,
    required County? county,
    required Constituency? constituency,
    required Ward? ward,
    required String image,
    required String? video,
    required int supporters,
    @JsonKey(name: 'recent_supporters') required List<User> recentSupporters,
    @JsonKey(name: 'is_supported') required bool isSupported,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _Petition;

  factory Petition.fromJson(Map<String, Object?> json) =>
      _$PetitionFromJson(json);
}
