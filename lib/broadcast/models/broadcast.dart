import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'broadcast.freezed.dart';
part 'broadcast.g.dart';

enum BroadcastType { meeting, livestream }

@freezed
sealed class Broadcast with _$Broadcast {
  const factory Broadcast({
    required final int id,
    required User host,
    @BroadcastTypeConverter() required BroadcastType type,
    @JsonKey(name: 'co_hosts') required List<User> coHosts,
    required String title,
    required String description,
    required County? county,
    required Constituency? constituency,
    required Ward? ward,
    required List<User> speakers,
    required List<User> participants,
    @JsonKey(name: 'participants_count') required int participantsCount,
    @JsonKey(name: 'muted') required List<int> muted,
    @JsonKey(name: 'is_recorded') required bool isRecorded,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') required DateTime? endTime,
  }) = _Broadcast;

  factory Broadcast.fromJson(Map<String, Object?> json) =>
      _$BroadcastFromJson(json);
}

class BroadcastTypeConverter implements JsonConverter<BroadcastType, String> {
  const BroadcastTypeConverter();

  @override
  BroadcastType fromJson(String data) {
    late BroadcastType type;
    switch (data) {
      case 'meeting':
        type = BroadcastType.meeting;
      case 'livestream':
        type = BroadcastType.livestream;
    }
    return type;
  }

  @override
  String toJson(BroadcastType object) {
    switch (object) {
      case BroadcastType.meeting:
        return 'meeting';
      case BroadcastType.livestream:
        return 'livestream';
    }
  }
}
