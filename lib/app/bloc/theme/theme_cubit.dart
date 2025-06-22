import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

String themeModeKey = 'themeMode';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState.initial());

  void check() async {
    try {
      emit(const ThemeState.loading());
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      int index = preferences.getInt(themeModeKey) ?? ThemeMode.system.index;
      ThemeMode themeMode = ThemeMode.values[index];
      emit(ThemeState.loaded(themeMode: themeMode));
    } catch (e) {
      emit(ThemeState.failure(error: e.toString()));
    }
  }

  void change({required ThemeMode themeMode}) async {
    try {
      emit(const ThemeState.loading());
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      await preferences.setInt(themeModeKey, themeMode.index);
      emit(ThemeState.loaded(themeMode: themeMode));
    } catch (e) {
      emit(ThemeState.failure(error: e.toString()));
    }
  }
}
