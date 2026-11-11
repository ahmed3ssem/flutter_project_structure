import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  Future<dynamic> post(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    bool isFormData = false,
    CancelToken? cancelToken,
  });

  Future<dynamic> put(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    bool isFormData = false,
    CancelToken? cancelToken,
  });

  Future<dynamic> patch(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    bool isFormData = false,
    CancelToken? cancelToken,
  });

  Future<dynamic> delete(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });
}
