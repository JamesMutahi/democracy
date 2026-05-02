import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting.freezed.dart';
part 'meeting.g.dart';

@freezed
sealed class Meeting with _$Meeting {
  const factory Meeting({
    required final int id,
    required User host,
    required String title,
    required String description,
    required County? county,
    required Constituency? constituency,
    required Ward? ward,
    required List<User> speakers,
    required List<User> listeners,
    @JsonKey(name: 'listener_count') required int listenerCount,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') required DateTime endTime,
  }) = _Meeting;

  factory Meeting.fromJson(Map<String, Object?> json) =>
      _$MeetingFromJson(json);
}
