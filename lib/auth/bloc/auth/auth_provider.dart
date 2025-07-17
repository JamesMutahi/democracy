part of 'auth_bloc.dart';

class AuthProvider {
  AuthProvider({required this.dio});

  final Dio dio;

  Future<String> login({required String email, required String password}) async {
    try {
    Response response = await dio.post(
      'auth/login/',
      data: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      return response.data['token'];
    } else {
      return Future.error(response.data['error'][0]);
    }
    } on DioException {
      return Future.error(
        'Unable to login at this time. Please try again later',
      );
    }
  }

  Future<void> logout({required String token}) async {
    try {
      Response response = await dio.delete(
        'auth/logout/',
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode != 200) {
        return Future.error(response.data['error'][0]);
      }
    } on DioException {
      return Future.error(
        'Unable to logout at this time. Please try again later',
      );
    }
  }

  Future<User> getUserFromAPI({required String token}) async {
    try {
      Response response = await dio.get(
        'auth/user/',
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        return Future.error(response.data['error'][0]);
      }
    } on DioException {
      return Future.error(
        'Unable to login at this time. Please try again later',
      );
    }
  }
}
