part of 'geo_cubit.dart';

class GeoRepository {
  GeoRepository({required this.dio});

  final Dio dio;

  Future<List<County>> getCounties({required String token}) async {
    try {
      Response response = await dio.get(
        'geo/counties/',
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode == 200) {
        final List<County> counties = List.from(
          response.data.map((e) => County.fromJson(e)),
        );
        return counties;
      } else {
        return Future.error(response.data['error'][0]);
      }
    } on DioException {
      return Future.error(
        'Unable to connect at this time. Please try again later',
      );
    }
  }

  Future<List<Constituency>> getConstituencies({
    required String token,
    required County county,
  }) async {
    try {
      Response response = await dio.get(
        'geo/county/${county.id}/constituencies/',
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode == 200) {
        final List<Constituency> constituencies = List.from(
          response.data.map((e) => Constituency.fromJson(e)),
        );
        return constituencies;
      } else {
        return Future.error(response.data['error'][0]);
      }
    } on DioException {
      return Future.error(
        'Unable to connect at this time. Please try again later',
      );
    }
  }

  Future<List<Ward>> getWards({
    required String token,
    required Constituency constituency,
  }) async {
    try {
      Response response = await dio.get(
        'geo/constituency/${constituency.id}/wards/',
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode == 200) {
        final List<Ward> wards = List.from(
          response.data.map((e) => Ward.fromJson(e)),
        );
        return wards;
      } else {
        return Future.error(response.data['error'][0]);
      }
    } on DioException {
      return Future.error(
        'Unable to connect at this time. Please try again later',
      );
    }
  }
}
