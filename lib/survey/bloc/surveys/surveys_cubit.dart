import 'package:bloc/bloc.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:equatable/equatable.dart';

part 'surveys_state.dart';

class SurveysCubit extends Cubit<SurveysState> {
  SurveysCubit() : super(const SurveysState());

  void websocketFailure({required String error}) {
    if (state.status == SurveysStatus.initial ||
        state.status == SurveysStatus.loading) {
      emit(state.copyWith(status: SurveysStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: SurveysStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Survey> surveys = List.from(
        payload['data']['results'].map((e) => Survey.fromJson(e)),
      );
      int currentPage = payload['data']['current_page'];
      emit(
        state.copyWith(
          status: SurveysStatus.success,
          surveys: currentPage == 1 ? surveys : [...state.surveys, ...surveys],
          currentPage: currentPage,
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: SurveysStatus.failure));
    }
  }
}
