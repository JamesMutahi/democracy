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
    @JsonKey(name: 'recent_listeners') required List<User> recentListeners,
    required int listeners,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') required DateTime endTime,
  }) = _Meeting;

  factory Meeting.fromJson(Map<String, Object?> json) =>
      _$MeetingFromJson(json);
}
