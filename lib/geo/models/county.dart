import 'package:freezed_annotation/freezed_annotation.dart';

part 'county.freezed.dart';
part 'county.g.dart';

@freezed
sealed class County with _$County {
  const factory County({required final int id, required String name}) = _County;

  factory County.fromJson(Map<String, Object?> json) => _$CountyFromJson(json);
}
