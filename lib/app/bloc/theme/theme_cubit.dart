import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

String themeModeKey = 'themeMode';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  void check() async {
    try {
      emit(state.copyWith(status: ThemeStatus.loading));
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      emit(
        state.copyWith(
          status: ThemeStatus.success,
          index: preferences.getInt(themeModeKey),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: ThemeStatus.failure));
    }
  }

  void change({required int index}) async {
    try {
      emit(state.copyWith(status: ThemeStatus.loading));
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      await preferences.setInt(themeModeKey, index);
      emit(state.copyWith(status: ThemeStatus.success, index: index));
    } catch (e) {
      emit(state.copyWith(status: ThemeStatus.failure));
    }
  }
}
