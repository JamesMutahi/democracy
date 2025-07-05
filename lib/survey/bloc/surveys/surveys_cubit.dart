import 'package:bloc/bloc.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'surveys_state.dart';
part 'surveys_cubit.freezed.dart';

class SurveysCubit extends Cubit<SurveysState> {
  SurveysCubit() : super(const SurveysState.initial());

  void websocketFailure({required String error}) {
    if (state is SurveysInitial || state is SurveysLoading) {
      emit(SurveysFailure(error: error));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(SurveysLoading());
    if (payload['response_status'] == 200) {
      final List<Survey> surveys = List.from(
        payload['data'].map((e) => Survey.fromJson(e)),
      );
      emit(SurveysLoaded(surveys: surveys));
    } else {
      emit(SurveysFailure(error: payload['errors'].toString()));
    }
  }
}
