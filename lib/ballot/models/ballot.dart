import 'package:democracy/ballot/models/option.dart';
import 'package:democracy/ballot/models/reason.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ballot.freezed.dart';
part 'ballot.g.dart';

@freezed
sealed class Ballot with _$Ballot {
  const factory Ballot({
    required final int id,
    required String title,
    required String description,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') required DateTime endTime,
    @JsonKey(name: 'total_votes') required int totalVotes,
    @JsonKey(name: 'voted_option') required int? votedOption,
    required List<Option> options,
    required Reason? reason,
  }) = _Ballot;

  factory Ballot.fromJson(Map<String, Object?> json) => _$BallotFromJson(json);
}
