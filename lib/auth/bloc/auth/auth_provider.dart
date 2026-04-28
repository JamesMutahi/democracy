part of 'auth_bloc.dart';

class AuthProvider {
  AuthProvider({required this.dio});

  final Dio dio;

  Future<Map> login({
    required String username,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        'auth/token/',
        data: {'username': username, 'password': password},
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return Future.error(response.data);
      }
    } on DioException {
      return Future.error(
        'Unable to login at this time. Please try again later',
      );
    }
  }

  Future<String> getTicket() async {
    try {
      Response response = await dio.get('ticket/');
      if (response.statusCode == 200) {
        return response.data['uuid'];
      } else {
        return Future.error(response.data);
      }
    } on DioException {
      return Future.error(
        'Unable to login at this time. Please try again later',
      );
    }
  }

  Future<void> logout({required String refreshToken}) async {
    try {
      Response response = await dio.post(
        'auth/logout/',
        data: {'refresh': refreshToken},
      );
      if (response.statusCode != 200) {
        return Future.error(response.data);
      }
    } on DioException {
      return Future.error(
        'Unable to logout at this time. Please try again later',
      );
    }
  }

  Future<User> getUserFromAPI() async {
    try {
      Response response = await dio.get('user/');
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        return Future.error(response.data);
      }
    } on DioException {
      return Future.error(
        'Unable to login at this time. \nPlease try again later',
      );
    }
  }
}
