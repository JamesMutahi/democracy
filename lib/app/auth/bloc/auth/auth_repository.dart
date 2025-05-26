part of 'auth_bloc.dart';

class AuthRepository {
  AuthRepository({required this.authProvider});

  final AuthProvider authProvider;

  Future<User> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    return await authProvider.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }

  Future<void> resendRegistrationOTP({required String token}) async {
    await authProvider.resendRegistrationOTP(token: token);
  }

  Future<User> verifyRegistrationOTP({
    required String token,
    required String code,
  }) async {
    return await authProvider.verifyRegistrationOTP(token: token, code: code);
  }

  Future<User> login({required String email, required String password}) async {
    return await authProvider.login(email: email, password: password);
  }

  Future<void> logout({required String token}) async {
    await authProvider.logout(token: token);
  }

  Future<void> deleteToken() async {
    await authProvider.deleteToken();
  }

  Future<void> deleteUser() async {
    await authProvider.deleteUser();
  }

  Future<String?> getToken() async {
    return await authProvider.getToken();
  }

  Future<void> changePassword({
    required String token,
    required String oldPassword,
    required String newPassword1,
    required String newPassword2,
  }) async {
    await authProvider.changePassword(
      token: token,
      oldPassword: oldPassword,
      newPassword1: newPassword1,
      newPassword2: newPassword2,
    );
  }

  Future<void> verifyEmail({required String email}) async {
    await authProvider.verifyEmail(email: email);
  }

  Future<void> holdEmail({required String email}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("email", email);
  }

  Future<String> getEmail() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String email = preferences.getString("email")!;
    return email;
  }

  Future<User> verifyPasswordResetOTP({
    required String email,
    required String code,
  }) async {
    return await authProvider.verifyPasswordResetOTP(email: email, code: code);
  }

  Future<void> resetPassword({
    required String token,
    required String password1,
    required String password2,
  }) async {
    await authProvider.resetPassword(
      token: token,
      password1: password1,
      password2: password2,
    );
  }

  Future<User> getUserFromAPI({required String token}) async {
    return await authProvider.getUserFromAPI(token: token);
  }

  Future<User> getUserFromSharedPreferences() async {
    return await authProvider.getUserFromSharedPreferences();
  }

  Future<void> saveUserToSharedPreferences({required User user}) async {
    await authProvider.saveUserToSharedPreferences(user: user);
  }

  Future<List<User>> getMutedAccounts({required String token}) async {
    List<User> muted = await authProvider.getMutedAccounts(token: token);
    return muted;
  }

  Future<List<User>> getBlockedAccounts({required String token}) async {
    List<User> blocked = await authProvider.getBlockedAccounts(token: token);
    return blocked;
  }
}
