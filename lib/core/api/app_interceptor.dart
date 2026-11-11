import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../preferences/flutter_secure_storage.dart';
import '../../config/PrefHelper/prefs.dart';
import '../utils/app_strings.dart';

class AppInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (kDebugMode) {
      debugPrint('➡️ REQUEST[${options.method}] => PATH: ${options.path}');
    }

    final headers = await _getHeaders();
    options.headers.addAll(headers);

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
        '⬅️ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
    }
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (kDebugMode) {
      debugPrint(
        '❌ ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path} | MESSAGE: ${err.message}',
      );
    }

    // Global session expiration hook (HTTP 401)
    if (err.response?.statusCode == 401) {
      // Can dispatch logout event or clear token if appropriate
    }

    super.onError(err, handler);
  }

  Future<Map<String, dynamic>> _getHeaders() async {
    final Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': AppStrings.appLocal,
    };

    // Try reading token from secure storage first, fallback to Prefs for compatibility
    String token = await MySecureStorage.getToken();
    if (token.isEmpty && Prefs.isContain(AppStrings.token)) {
      token = Prefs.getString(AppStrings.token);
    }

    if (token.isNotEmpty && token != 'null') {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }
}
