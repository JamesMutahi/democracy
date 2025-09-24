part of 'preferences_bloc.dart';

@freezed
class PreferencesState with _$PreferencesState {
  const factory PreferencesState.initial() = _Initial;

  const factory PreferencesState.loading() = PreferencesLoading;

  const factory PreferencesState.loaded({required Preferences preferences}) =
      PreferencesLoaded;

  const factory PreferencesState.failure({required String error}) =
      PreferencesFailure;
}
