import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../error/exceptions.dart';
import 'api_consumer.dart';
import 'app_interceptor.dart';
import 'end_points.dart';
import 'status_code.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    client.options
      ..baseUrl = EndPoints.devUrl
      ..responseType = ResponseType.json
      ..followRedirects = false
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30)
      ..sendTimeout = const Duration(seconds: 30)
      ..validateStatus = (status) {
        return status != null && status >= 200 && status < 300;
      };

    client.interceptors.add(AppInterceptor());

    if (kDebugMode) {
      client.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
        ),
      );
    }
  }

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await client.get(
        path,
        queryParameters: queryParams,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future<dynamic> post(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    bool isFormData = false,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParams,
        data: isFormData && body is Map<String, dynamic>
            ? FormData.fromMap(body)
            : body,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future<dynamic> put(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    bool isFormData = false,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await client.put(
        path,
        queryParameters: queryParams,
        data: isFormData && body is Map<String, dynamic>
            ? FormData.fromMap(body)
            : body,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future<dynamic> patch(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    bool isFormData = false,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await client.patch(
        path,
        queryParameters: queryParams,
        data: isFormData && body is Map<String, dynamic>
            ? FormData.fromMap(body)
            : body,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future<dynamic> delete(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await client.delete(
        path,
        data: body,
        queryParameters: queryParams,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  dynamic _handleResponse(Response<dynamic> response) {
    if (response.data == null || response.data == '') {
      return {'statusCode': response.statusCode, 'data': null};
    }
    if (response.data is Map || response.data is List) {
      return response.data;
    }
    try {
      return jsonDecode(response.data.toString());
    } catch (_) {
      return response.data;
    }
  }

  Never _handleDioError(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode;
    String? serverMessage;

    // Try extracting backend error message
    if (response?.data != null) {
      if (response!.data is Map) {
        serverMessage = response.data['message']?.toString() ??
            response.data['error']?.toString() ??
            response.data['msg']?.toString();
      } else if (response.data is String && response.data.toString().isNotEmpty) {
        try {
          final decoded = jsonDecode(response.data.toString());
          if (decoded is Map) {
            serverMessage = decoded['message']?.toString() ??
                decoded['error']?.toString() ??
                decoded['msg']?.toString();
          }
        } catch (_) {
          serverMessage = response.data.toString();
        }
      }
    }

    serverMessage ??= error.message;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw FetchDataException(
          serverMessage ?? 'Network connection timed out. Please try again.',
          statusCode,
        );

      case DioExceptionType.cancel:
        throw CancelRequestException(
          serverMessage ?? 'Request was cancelled.',
          statusCode,
        );

      case DioExceptionType.badCertificate:
        throw BadCertificateException(
          serverMessage ?? 'Security certificate is invalid.',
          statusCode,
        );

      case DioExceptionType.connectionError:
        throw NoInternetConnectionException(
          serverMessage ?? 'No internet connection detected.',
          statusCode,
        );

      case DioExceptionType.badResponse:
        switch (statusCode) {
          case StatusCode.badRequest:
            throw BadRequestException(serverMessage, statusCode);
          case StatusCode.unauthorized:
          case StatusCode.forBidden:
            throw UnauthorizedException(serverMessage, statusCode);
          case StatusCode.notFound:
            throw NotFoundException(serverMessage, statusCode);
          case StatusCode.conflict:
            throw ConflictException(serverMessage, statusCode);
          case StatusCode.internalServerError:
          default:
            throw InternalServerErrorException(serverMessage, statusCode);
        }

      case DioExceptionType.unknown:
      default:
        throw UnknownDioErrorException(
          serverMessage ?? 'An unexpected network error occurred.',
          statusCode,
        );
    }
  }
}
