import 'dart:async';

import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'token_storage.dart';

class TokenInterceptor extends QueuedInterceptor {
  final Dio dio;
  final TokenStorage tokenStorage;
  final Dio refreshDio;

  final StreamController<void> _tokenExpiredController =
      StreamController.broadcast();

  Stream<void> get onTokenExpired => _tokenExpiredController.stream;

  bool _isRefreshing = false;

  TokenInterceptor({required this.dio, required this.tokenStorage})
    : refreshDio = Dio(BaseOptions(baseUrl: dio.options.baseUrl));

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_shouldSkipAuth(options.path)) {
      return handler.next(options);
    }

    String? accessToken = await tokenStorage.getAccessToken();

    // Proactive refresh: if token is expiring soon, refresh it first
    if (accessToken != null && _isTokenExpiringSoon(accessToken)) {
      try {
        accessToken = await _refreshToken();
      } catch (e) {
        // If proactive refresh fails, continue (onError will catch 401 later)
      }
    }

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  bool _shouldSkipAuth(String path) {
    final normalized = path.toLowerCase();
    return normalized.contains('/login') ||
        normalized.contains('/auth/token/') ||
        normalized.endsWith('/refresh/') ||
        normalized.endsWith('/refresh');
  }

  bool _isTokenExpiringSoon(String token) {
    try {
      if (JwtDecoder.isExpired(token)) return true;
      return JwtDecoder.getRemainingTime(token).inSeconds < 120; // 2 minutes
    } catch (_) {
      return true;
    }
  }

  // This is where QueuedInterceptor shines — it queues requests automatically
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final options = err.requestOptions;

      if (_isRefreshing) {
        // QueuedInterceptor will automatically queue this request
        return handler.reject(err); // Let the queue handle it
      }

      _isRefreshing = true;

      try {
        final newAccessToken = await _refreshToken();

        // Update header and retry the current failed request
        options.headers['Authorization'] = 'Bearer $newAccessToken';
        final response = await dio.fetch(options);

        return handler.resolve(response);
      } catch (e) {
        await tokenStorage.clearTokens();
        _tokenExpiredController.add(null);
        return handler.reject(err);
      } finally {
        _isRefreshing = false;
      }
    }

    // Pass other errors through
    handler.next(err);
  }

  Future<String> _refreshToken() async {
    final refreshToken = await tokenStorage.getRefreshToken();
    if (refreshToken == null) {
      throw Exception('No refresh token available');
    }

    final response = await refreshDio.post(
      '/auth/token/refresh/',
      data: {'refresh': refreshToken},
    );

    final newAccessToken = response.data['access'] as String;
    final newRefreshToken = response.data['refresh'] as String?;

    await tokenStorage.saveTokens(
      accessToken: newAccessToken,
      refreshToken: newRefreshToken ?? refreshToken,
    );

    // Update default header
    dio.options.headers['Authorization'] = 'Bearer $newAccessToken';

    return newAccessToken;
  }

  void dispose() {
    _tokenExpiredController.close();
  }
}
