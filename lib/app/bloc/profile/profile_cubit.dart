import 'package:bloc/bloc.dart';
import 'package:democracy/app/models/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.initial());

  void websocketFailure({required String error}) {
    if (state is ProfileInitial || state is ProfileLoading) {
      emit(ProfileFailure());
    }
  }

  void retryButtonPressed() {
    emit(ProfileInitial());
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(ProfileLoading());
    if (payload['response_status'] == 200) {
      final Profile profile = Profile.fromJson(payload['data']);
      emit(ProfileLoaded(profile: profile));
    } else {
      emit(ProfileFailure());
    }
  }
}
