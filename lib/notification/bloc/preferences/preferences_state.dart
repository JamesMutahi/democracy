part of 'preferences_bloc.dart';

enum PreferencesStatus { initial, loading, success, failure }

final class PreferencesState extends Equatable {
  const PreferencesState({
    this.status = PreferencesStatus.initial,
    this.preferences,
  });

  final PreferencesStatus status;
  final Preferences? preferences;

  PreferencesState copyWith({
    PreferencesStatus? status,
    Preferences? preferences,
  }) {
    return PreferencesState(
      status: status ?? this.status,
      preferences: preferences ?? this.preferences,
    );
  }

  @override
  String toString() {
    return '''PreferencesState { status: $status, preferences: $preferences }''';
  }

  @override
  List<Object> get props => [status, ?preferences];
}
