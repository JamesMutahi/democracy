part of 'theme_cubit.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = ThemeInitial;

  const factory ThemeState.loading() = ThemeLoading;

  const factory ThemeState.loaded({required ThemeMode themeMode}) = ThemeLoaded;

  const factory ThemeState.failure({required String error}) = ThemeFailure;
}
