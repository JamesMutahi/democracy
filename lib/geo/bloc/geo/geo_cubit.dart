import 'package:bloc/bloc.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'geo_state.dart';
part 'geo_repository.dart';

class GeoCubit extends Cubit<GeoState> {
  GeoCubit({required this.authRepository, required this.geoRepository})
    : super(const GeoState());

  void start() {
    emit(GeoState());
  }

  void getCounties() async {
    emit(state.copyWith(status: GeoStatus.loading));
    try {
      String? token = await authRepository.getToken();
      List<County> counties = await geoRepository.getCounties(token: token!);
      emit(GeoState(status: GeoStatus.success, counties: counties));
    } catch (e) {
      emit(state.copyWith(status: GeoStatus.failure));
    }
  }

  void getConstituencies({required County county}) async {
    emit(state.copyWith(status: GeoStatus.loading));
    try {
      String? token = await authRepository.getToken();
      List<Constituency> constituencies = await geoRepository.getConstituencies(
        token: token!,
        county: county,
      );
      emit(
        state.copyWith(
          status: GeoStatus.success,
          constituencies: constituencies,
          wards: [],
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: GeoStatus.failure));
    }
  }

  void getWards({required Constituency constituency}) async {
    emit(state.copyWith(status: GeoStatus.loading));
    try {
      String? token = await authRepository.getToken();
      List<Ward> wards = await geoRepository.getWards(
        token: token!,
        constituency: constituency,
      );
      emit(state.copyWith(status: GeoStatus.success, wards: wards));
    } catch (e) {
      emit(state.copyWith(status: GeoStatus.failure));
    }
  }

  final AuthRepository authRepository;
  final GeoRepository geoRepository;
}
