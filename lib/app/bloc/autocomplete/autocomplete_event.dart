part of 'autocomplete_bloc.dart';

@freezed
class AutocompleteEvent with _$AutocompleteEvent {
  const factory AutocompleteEvent.search({required String searchTerm}) =
      _Search;
  const factory AutocompleteEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
