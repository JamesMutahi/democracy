import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'speaker_request.freezed.dart';
part 'speaker_request.g.dart';

@freezed
sealed class SpeakerRequest with _$SpeakerRequest {
  const factory SpeakerRequest({
    required final int id,
    required int meeting,
    required User user,
    @JsonKey(name: 'is_approved') required bool? isApproved
  }) = _SpeakerRequest;

  factory SpeakerRequest.fromJson(Map<String, Object?> json) =>
      _$SpeakerRequestFromJson(json);
}
