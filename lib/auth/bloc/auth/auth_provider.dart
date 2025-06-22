part of 'auth_bloc.dart';

class AuthProvider {
  AuthProvider({required this.dio});

  final Dio dio;
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Future<String?> saveToken({required String token}) async {
    await _storage.write(key: 'token', value: token);
    return token;
  }

  Future<String?> getToken() async {
    try {
      String? token = await _storage.read(key: 'token');
      return token;
    } catch (e) {
      await deleteUser();
      await _storage.deleteAll();
      return null;
    }
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'token');
  }

  Future<void> saveUserToSharedPreferences({required User user}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt("id", user.id);
    await preferences.setString("firstName", user.firstName);
    await preferences.setString("lastName", user.lastName);
    await preferences.setString("email", user.email);
    await preferences.setString("image", user.image);
    await preferences.setString("status", user.status);
    await preferences.setInt("following", user.following);
    await preferences.setInt("followers", user.followers);
    await preferences.setBool("isActive", user.isActive);
    await preferences.setBool("isStaff", user.isStaff);
    await preferences.setString("dateJoined", user.dateJoined.toString());
  }

  Future<User> getUserFromSharedPreferences() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    int id = preferences.getInt("id")!;
    String firstName = preferences.getString("firstName")!;
    String lastName = preferences.getString("lastName")!;
    String email = preferences.getString("email")!;
    String image = preferences.getString("image")!;
    String status = preferences.getString("status")!;
    int following = preferences.getInt("following")!;
    int followers = preferences.getInt("followers")!;
    bool isActive = preferences.getBool("isActive")!;
    bool isStaff = preferences.getBool("isStaff")!;
    DateTime dateJoined =
        DateTime.tryParse(preferences.getString("dateJoined")!)!;
    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      image: image,
      status: status,
      following: following,
      followers: followers,
      isActive: isActive,
      isStaff: isStaff,
      dateJoined: dateJoined,
    );
  }

  Future<void> deleteUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("id");
    await preferences.remove("firstName");
    await preferences.remove("lastName");
    await preferences.remove("email");
    await preferences.remove("image");
    await preferences.remove("status");
    await preferences.remove("following");
    await preferences.remove("followers");
    await preferences.remove("isActive");
    await preferences.remove("isStaff");
  }

  Future<User> login({required String email, required String password}) async {
    try {
    Response response = await dio.post(
      '/auth/login/',
      data: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      await saveToken(token: response.data['token']);
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

  Future<void> logout({required String token}) async {
    try {
      Response response = await dio.delete(
        '/auth/logout/',
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

  Future<User> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      Response response = await dio.post(
        '/auth/register/',
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
          'password2': confirmPassword,
        },
      );
      if (response.statusCode == 201) {
        await saveToken(token: response.data['token']);
        return User.fromJson(response.data);
      } else {
        return Future.error(response.data['error'][0]);
      }
    } on DioException {
      return Future.error(
        'Unable to register at this time. Please try again later',
      );
    }
  }

  Future<void> resendRegistrationOTP({required String token}) async {
    try {
      Response response = await dio.post(
        '/auth/register/resend-otp/',
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode != 200) {
        return Future.error(response.data);
      }
    } on DioException {
      return Future.error(
        'Unable to resend at this time. Please try again later',
      );
    }
  }

  Future<User> verifyRegistrationOTP({
    required String token,
    required String code,
  }) async {
    try {
      Response response = await dio.post(
        '/auth/register/verify/',
        data: {'code': code},
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
        'Unable to verify at this time. Please try again later',
      );
    }
  }

  Future<void> changePassword({
    required String token,
    required String oldPassword,
    required String newPassword1,
    required String newPassword2,
  }) async {
    try {
      Response response = await dio.post(
        '/auth/password-change/',
        data: {
          'old_password': oldPassword,
          'new_password1': newPassword1,
          'new_password2': newPassword2,
        },
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode != 200) {
        return Future.error(response.data['error'][0]);
      }
    } on DioException {
      return Future.error(
        'Unable to change password at this time. Please try again later',
      );
    }
  }

  Future<User> getUserFromAPI({required String token}) async {
    try {
      Response response = await dio.post(
        '/auth/user/',
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

  Future<void> verifyEmail({required String email}) async {
    try {
      Response response = await dio.post(
        '/auth/password-reset/verify-email/',
        data: {'email': email},
      );
      if (response.statusCode != 200) {
        return Future.error(response.data['error'][0]);
      }
    } on DioException {
      return Future.error(
        'Unable to change password at this time. Please try again later',
      );
    }
  }

  Future<User> verifyPasswordResetOTP({
    required String email,
    required String code,
  }) async {
    try {
      Response response = await dio.post(
        '/auth/password-reset/verify-code/',
        data: {'email': email, 'code': code},
      );
      if (response.statusCode == 200) {
        await saveToken(token: response.data['token']);
        return User.fromJson(response.data);
      } else {
        return Future.error(response.data['error'][0]);
      }
    } on DioException {
      return Future.error(
        'Unable to change password at this time. Please try again later',
      );
    }
  }

  Future<void> resetPassword({
    required String token,
    required String password1,
    required String password2,
  }) async {
    try {
      Response response = await dio.post(
        '/auth/password-reset/',
        data: {'new_password1': password1, 'new_password2': password2},
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode != 200) {
        return Future.error(response.data['error'][0]);
      }
    } on DioException {
      return Future.error(
        'Unable to change password at this time. Please try again later',
      );
    }
  }

  Future<List<User>> getMutedAccounts({required String token}) async {
    try {
      Response response = await dio.get(
        '/api/muted-accounts/',
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode == 200) {
        return List.from(response.data.map((e) => User.fromJson(e)));
      } else {
        return Future.error('Unable to get data at this time');
      }
    } on DioException {
      return Future.error('Unable to get data at this time');
    }
  }

  Future<List<User>> getBlockedAccounts({required String token}) async {
    try {
      Response response = await dio.get(
        '/api/blocked-accounts/',
        options: Options(
          headers: <String, String>{'Authorization': 'Token $token'},
        ),
      );
      if (response.statusCode == 200) {
        return List.from(response.data.map((e) => User.fromJson(e)));
      } else {
        return Future.error('Unable to get data at this time');
      }
    } on DioException {
      return Future.error('Unable to get data at this time');
    }
  }
}
