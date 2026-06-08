import 'package:freezed_annotation/freezed_annotation.dart';

part 'autocomplete_user.freezed.dart';
part 'autocomplete_user.g.dart';

@freezed
sealed class AutocompleteUser with _$AutocompleteUser {
  const factory AutocompleteUser({
    required final int id,
    required String username,
    required String name,
    required String image,
  }) = _AutocompleteUser;

  factory AutocompleteUser.fromJson(Map<String, Object?> json) =>
      _$AutocompleteUserFromJson(json);
}
