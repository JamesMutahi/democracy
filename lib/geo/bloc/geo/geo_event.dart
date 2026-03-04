part of 'geo_bloc.dart';

@freezed
class GeoEvent with _$GeoEvent {
  const factory GeoEvent.started() = _Started;
  const factory GeoEvent.getCounties() = _GetCounties;
  const factory GeoEvent.getConstituencies({required County county}) =
      _GetConstituencies;
  const factory GeoEvent.getWards({required Constituency constituency}) =
      _GetWards;
  const factory GeoEvent.receivedCounties({
    required Map<String, dynamic> payload,
  }) = _ReceivedCounties;
  const factory GeoEvent.receivedConstituencies({
    required Map<String, dynamic> payload,
  }) = _ReceivedConstituencies;
  const factory GeoEvent.receivedWards({
    required Map<String, dynamic> payload,
  }) = _ReceivedWards;
}
