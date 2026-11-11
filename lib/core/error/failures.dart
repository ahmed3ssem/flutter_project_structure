import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  final String msg;
  final int? statusCode;

  const Failures({required this.msg, this.statusCode});

  @override
  List<Object?> get props => [msg, statusCode];

  @override
  String toString() => msg;
}

class ServerFailure extends Failures {
  const ServerFailure({required super.msg, super.statusCode});
}

class CacheFailure extends Failures {
  const CacheFailure({required super.msg, super.statusCode});
}

class NetworkFailure extends Failures {
  const NetworkFailure({
    super.msg = "No internet connection. Please check your network.",
    super.statusCode,
  });
}

class UnauthorizedFailure extends Failures {
  const UnauthorizedFailure({
    super.msg = "Unauthorized. Please sign in again.",
    super.statusCode = 401,
  });
}

// Backwards compatibility alias for typo
typedef CashFailure = CacheFailure;
