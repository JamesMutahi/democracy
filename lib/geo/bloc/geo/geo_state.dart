part of 'geo_cubit.dart';

enum GeoStatus { initial, loading, success, failure }

final class GeoState extends Equatable {
  const GeoState({
    this.status = GeoStatus.initial,
    this.counties = const [],
    this.constituencies = const [],
    this.wards = const [],
  });

  final GeoStatus status;
  final List<County> counties;
  final List<Constituency> constituencies;
  final List<Ward> wards;

  GeoState copyWith({
    GeoStatus? status,
    List<County>? counties,
    List<Constituency>? constituencies,
    List<Ward>? wards,
  }) {
    return GeoState(
      status: status ?? this.status,
      counties: counties ?? this.counties,
      constituencies: constituencies ?? this.constituencies,
      wards: wards ?? this.wards,
    );
  }

  @override
  String toString() {
    return '''GeoState { status: $status, counties: ${counties.length}, constituencies: ${constituencies.length}, wards: ${wards.length}''';
  }

  @override
  List<Object> get props => [status, counties];
}
