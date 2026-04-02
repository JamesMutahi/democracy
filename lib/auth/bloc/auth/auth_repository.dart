part of 'auth_bloc.dart';

class AuthRepository {
  AuthRepository({required this.authProvider, required this.storage});

  final FlutterSecureStorage storage;
  final AuthProvider authProvider;

  Future<String> login({
    required String email,
    required String password,
  }) async {
    return await authProvider.login(email: email, password: password);
  }

  Future<String?> saveToken({required String token}) async {
    await storage.write(key: 'token', value: token);
    return token;
  }

  Future<String?> getToken() async {
    try {
      String? token = await storage.read(key: 'token');
      return token;
    } catch (e) {
      await storage.deleteAll();
      return null;
    }
  }

  Future<void> logout({required String token}) async {
    await authProvider.logout(token: token);
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'token');
  }

  Future<User> getUserFromAPI({required String token}) async {
    return await authProvider.getUserFromAPI(token: token);
  }
}
