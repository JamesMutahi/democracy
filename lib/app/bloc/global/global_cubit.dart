import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'global_state.dart';

String themeModeKey = 'themeMode';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(const GlobalState());

  void checkTheme() async {
    try {
      emit(state.copyWith(status: GlobalStatus.loading));
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      emit(
        state.copyWith(
          status: GlobalStatus.success,
          index: preferences.getInt(themeModeKey),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: GlobalStatus.failure));
    }
  }

  void changeTheme({required int index}) async {
    try {
      emit(state.copyWith(status: GlobalStatus.loading));
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      await preferences.setInt(themeModeKey, index);
      emit(state.copyWith(status: GlobalStatus.success, index: index));
    } catch (e) {
      emit(state.copyWith(status: GlobalStatus.failure));
    }
  }

  void holdChatId({required int? chatId}) {
    emit(state.copyWith(openChatId: chatId));
  }

  void addViewedPost({required Map<String, int> viewedPost}) {
    emit(state.copyWith(viewedPosts: {...state.viewedPosts, viewedPost}));
  }

  void getCameras() async {
    try {
      List<CameraDescription> cameras = await availableCameras();
      emit(state.copyWith(cameras: cameras));
    } on CameraException catch (e) {
      String code = e.code;
      String? message = e.description;
      // TODO: Log error
      print(
        'Error: $code${message == null ? '' : '\nError Message: $message'}',
      );
    }
  }
}
