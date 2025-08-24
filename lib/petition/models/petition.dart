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
    required String image,
    required String? video,
    required int supporters,
    @JsonKey(name: 'recent_supporters') required List<User> recentSupporters,
    @JsonKey(name: 'is_supported') required bool isSupported,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') required DateTime endTime,
  }) = _Petition;

  factory Petition.fromJson(Map<String, Object?> json) =>
      _$PetitionFromJson(json);
}
