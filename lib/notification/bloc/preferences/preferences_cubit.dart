import 'package:bloc/bloc.dart';
import 'package:democracy/notification/models/preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences_state.dart';
part 'preferences_cubit.freezed.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  PreferencesCubit() : super(const PreferencesState.initial());

  void loaded({required Map<String, dynamic> payload}) {
    emit(PreferencesLoading());
    if (payload['response_status'] == 200) {
      Preferences preferences = Preferences.fromJson(payload['data']);
      emit(PreferencesLoaded(preferences: preferences));
    } else {
      emit(PreferencesFailure(error: payload['errors'][0]));
    }
  }
}
