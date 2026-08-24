import 'package:freezed_annotation/freezed_annotation.dart';

part 'speaker_invite.freezed.dart';
part 'speaker_invite.g.dart';

@freezed
sealed class SpeakerInvite with _$SpeakerInvite {
  const factory SpeakerInvite({
    required final int id,
    @JsonKey(name: 'broadcast') required int broadcastId,
    @JsonKey(name: 'user') required int userId,
    @SpeakerRoleConverter() required SpeakerRole role,
    @JsonKey(name: 'is_accepted') required bool? isAccepted,
  }) = _SpeakerInvite;

  factory SpeakerInvite.fromJson(Map<String, Object?> json) =>
      _$SpeakerInviteFromJson(json);
}

enum SpeakerRole { speaker, coHost }

class SpeakerRoleConverter implements JsonConverter<SpeakerRole, String> {
  const SpeakerRoleConverter();

  @override
  SpeakerRole fromJson(String data) {
    SpeakerRole role = SpeakerRole.speaker;
    if (data == 'co-host') {
      role = SpeakerRole.coHost;
    }
    return role;
  }

  @override
  String toJson(SpeakerRole object) {
    switch (object) {
      case SpeakerRole.speaker:
        return 'speaker';
      case SpeakerRole.coHost:
        return 'coHost';
    }
  }
}
