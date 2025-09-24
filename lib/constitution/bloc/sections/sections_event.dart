part of 'sections_bloc.dart';

@freezed
sealed class SectionsEvent with _$SectionsEvent {
  const factory SectionsEvent.get({String? searchTerm}) = _Get;
  const factory SectionsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
