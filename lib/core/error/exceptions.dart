import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String? message;
  final int? statusCode;

  const ServerException([this.message, this.statusCode]);

  @override
  List<Object?> get props => [message, statusCode];

  @override
  String toString() => message ?? 'ServerException';
}

class FetchDataException extends ServerException {
  const FetchDataException([String? message, int? statusCode])
      : super(message ?? "Error during communication with server", statusCode);
}

class BadRequestException extends ServerException {
  const BadRequestException([String? message, int? statusCode])
      : super(message ?? "Bad request", statusCode);
}

class BadResponseException extends ServerException {
  const BadResponseException([String? message, int? statusCode])
      : super(message ?? "Bad response", statusCode);
}

class BadCertificateException extends ServerException {
  const BadCertificateException([String? message, int? statusCode])
      : super(message ?? "Bad SSL certificate", statusCode);
}

class ConnectionErrorException extends ServerException {
  const ConnectionErrorException([String? message, int? statusCode])
      : super(message ?? "Connection error", statusCode);
}

class UnknownDioErrorException extends ServerException {
  const UnknownDioErrorException([String? message, int? statusCode])
      : super(message ?? "Unknown network error", statusCode);
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([String? message, int? statusCode])
      : super(message ?? "Unauthorized access", statusCode);
}

class NotFoundException extends ServerException {
  const NotFoundException([String? message, int? statusCode])
      : super(message ?? "Requested resource not found", statusCode);
}

class ConflictException extends ServerException {
  const ConflictException([String? message, int? statusCode])
      : super(message ?? "Conflict occurred", statusCode);
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([String? message, int? statusCode])
      : super(message ?? "Internal server error", statusCode);
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([String? message, int? statusCode])
      : super(message ?? "No internet connection", statusCode);
}

class CancelRequestException extends ServerException {
  const CancelRequestException([String? message, int? statusCode])
      : super(message ?? "Request cancelled", statusCode);
}

class CacheException extends Equatable implements Exception {
  final String? message;

  const CacheException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() => message ?? 'CacheException';
}
