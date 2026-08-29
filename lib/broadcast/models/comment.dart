import 'package:democracy/app/models/simple_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
sealed class Comment with _$Comment {
  const factory Comment({
    required final int id,
    required SimpleUser author,
    required String text,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, Object?> json) =>
      _$CommentFromJson(json);
}
