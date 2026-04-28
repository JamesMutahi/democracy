part of 'auth_bloc.dart';

class AuthRepository {
  AuthRepository({required this.authProvider});

  final AuthProvider authProvider;

  Future<Map> login({
    required String username,
    required String password,
  }) async {
    return await authProvider.login(username: username, password: password);
  }

  Future<String> getTicket() async {
    return await authProvider.getTicket();
  }

  Future<void> logout({required String refreshToken}) async {
    await authProvider.logout(refreshToken: refreshToken);
    await TokenStorage().clearTokens();
  }

  Future<User> getUserFromAPI() async {
    return await authProvider.getUserFromAPI();
  }
}
