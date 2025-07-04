part of 'surveys_cubit.dart';

@freezed
class SurveysState with _$SurveysState {
  const factory SurveysState.initial() = SurveysInitial;
  const factory SurveysState.loading() = SurveysLoading;
  const factory SurveysState.loaded({required List<Survey> surveys}) =
      SurveysLoaded;
  const factory SurveysState.failure({required String error}) = SurveysFailure;
}
