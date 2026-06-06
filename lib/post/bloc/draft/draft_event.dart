part of 'draft_bloc.dart';

@freezed
class DraftEvent with _$DraftEvent {
  const factory DraftEvent.load({required int draftId}) = _Load;
  const factory DraftEvent.loaded({required Map<String, dynamic> payload}) =
      _Loaded;
  const factory DraftEvent.updated({required DraftPost draft}) = _Updated;
}
