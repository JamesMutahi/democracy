import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_note.freezed.dart';
part 'community_note.g.dart';

@freezed
sealed class CommunityNote with _$CommunityNote {
  const factory CommunityNote({
    required final int id,
    required final User author,
    required String text,
    @JsonKey(name: 'is_helpful_votes') required int isHelpfulVotes,
    @JsonKey(name: 'is_not_helpful_votes') required int isNotHelpfulVotes,
    @JsonKey(name: 'helpful_score') required int helpfulScore,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _CommunityNote;

  factory CommunityNote.fromJson(Map<String, Object?> json) =>
      _$CommunityNoteFromJson(json);
}
