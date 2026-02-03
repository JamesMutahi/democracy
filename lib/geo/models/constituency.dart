import 'package:freezed_annotation/freezed_annotation.dart';

part 'constituency.freezed.dart';
part 'constituency.g.dart';

@freezed
sealed class Constituency with _$Constituency {
  const factory Constituency({required final int id, required String name}) =
      _Constituency;

  factory Constituency.fromJson(Map<String, Object?> json) =>
      _$ConstituencyFromJson(json);
}
