import 'package:bloc/bloc.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/models/text_answer.dart';
import 'package:democracy/app/utils/bloc/transformers.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_bloc.freezed.dart';
part 'survey_event.dart';
part 'survey_provider.dart';
part 'survey_repository.dart';
part 'survey_state.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  SurveyBloc({required this.surveyRepository, required this.authRepository})
    : super(const SurveyState()) {
    on<_Initialize>((event, emit) async {
      emit(SurveyState());
      add(GetSurveys());
    });
    on<GetSurveys>(
      (event, emit) async {
        await _getSurveys(emit);
      },
      transformer: throttleDroppable(
        duration: const Duration(milliseconds: 100),
      ),
    );
    on<_Filter>((event, emit) async {
      await _onFilterSurveys(emit, event);
    });
    on<_Reload>((event, emit) async {
      if (_previousEvent != null) {
        add(_previousEvent!);
      }
    });
  }

  SurveyEvent? _previousEvent;

  @override
  void onEvent(SurveyEvent event) {
    if (event is! _Reload) {
      _previousEvent = event;
    }
    super.onEvent(event);
  }

  Future _getSurveys(Emitter<SurveyState> emit) async {
    if (state.next == null) return;
    if (state.status == SurveyStatus.failure) {
      emit(state.copyWith(status: SurveyStatus.loading));
    }
    try {
      String? token = await authRepository.getToken();
      final data = await surveyRepository.getSurveys(
        token: token!,
        next: state.next,
      );
      final List<Survey> surveys = List.from(
        data['results'].map((e) => Survey.fromJson(e)),
      );
      emit(
        state.copyWith(
          status: SurveyStatus.success,
          surveys: [...state.surveys, ...surveys],
          next: data['next'],
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: SurveyStatus.failure));
    }
  }

  Future _onFilterSurveys(Emitter<SurveyState> emit, _Filter event) async {
    emit(state.copyWith(status: SurveyStatus.loading));
    try {
      String? token = await authRepository.getToken();
      final data = await surveyRepository.getSurveys(
        token: token!,
        next: null,
        searchTerm: event.searchTerm,
        startDate: event.startDate,
        endDate: event.endDate,
      );
      final List<Survey> surveys = List.from(
        data['results'].map((e) => Survey.fromJson(e)),
      );
      emit(
        state.copyWith(
          status: SurveyStatus.success,
          surveys: surveys,
          next: data['next'],
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: SurveyStatus.failure));
    }
  }

  final SurveyRepository surveyRepository;
  final AuthRepository authRepository;
}
