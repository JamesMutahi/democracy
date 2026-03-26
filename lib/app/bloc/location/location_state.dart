part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = LocationInitial;
  const factory LocationState.loading() = LocationLoading;
  const factory LocationState.success({required LatLng point}) =
      LocationSuccess;
  const factory LocationState.failure({required String error}) =
      LocationFailure;
}
