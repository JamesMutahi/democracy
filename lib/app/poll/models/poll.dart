import 'package:democracy/app/poll/models/option.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'poll.freezed.dart';
part 'poll.g.dart';

@freezed
sealed class Poll with _$Poll {
  const factory Poll({
    required final int id,
    required String name,
    required String description,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') required DateTime endTime,
    @JsonKey(name: 'total_votes') required int totalVotes,
    @JsonKey(name: 'voted_option') required int? votedOption,
    required List<Option> options,
  }) = _Poll;

  factory Poll.fromJson(Map<String, Object?> json) => _$PollFromJson(json);
}
