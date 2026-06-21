import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'broadcast.freezed.dart';
part 'broadcast.g.dart';

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
    @JsonKey(name: 'has_started') required bool hasStarted,
    @JsonKey(name: 'has_ended') required bool hasEnded,
    @RecordingStatusConverter()
    @JsonKey(name: 'recording_status')
    required RecordingStatus? recordingStatus,
    @JsonKey(name: 'recording_url') required String? recordingUrl,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') required DateTime? endTime,
  }) = _Broadcast;

  factory Broadcast.fromJson(Map<String, Object?> json) =>
      _$BroadcastFromJson(json);
}

enum BroadcastType { meeting, livestream }

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

enum RecordingStatus { inProgress, stopped, error }

class RecordingStatusConverter
    implements JsonConverter<RecordingStatus, String> {
  const RecordingStatusConverter();

  @override
  RecordingStatus fromJson(String data) {
    late RecordingStatus status;
    switch (data) {
      case 'in progress':
        status = RecordingStatus.inProgress;
      case 'stopped':
        status = RecordingStatus.stopped;
      case 'error':
        status = RecordingStatus.error;
    }
    return status;
  }

  @override
  String toJson(RecordingStatus object) {
    switch (object) {
      case RecordingStatus.inProgress:
        return 'in progress';
      case RecordingStatus.stopped:
        return 'stopped';
      case RecordingStatus.error:
        return 'error';
    }
  }
}
