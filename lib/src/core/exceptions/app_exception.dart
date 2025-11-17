abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException(
    this.message, {
    this.statusCode,
  });

  @override
  String toString() {
    return '[${super.runtimeType}] $message';
  }
}

class NetworkException extends AppException {
  const NetworkException(super.message, {super.statusCode});
}

class UnknownException extends AppException {
  const UnknownException(super.message, {super.statusCode});
}

class TimeoutException extends AppException {
  const TimeoutException(super.message, {super.statusCode});
}
