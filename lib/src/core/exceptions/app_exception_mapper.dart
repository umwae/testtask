import 'dart:io';

import 'package:http/http.dart';
import 'package:testtask/src/core/exceptions/app_exception.dart';

extension AppExceptionX on Object {
  AppException toAppException() => _mapToAppException(this);

  AppException _mapToAppException(Object exc) {
    if (exc is SocketException || exc is ClientException || exc is HttpException) {
      return const NetworkException('Проблема с сетью');
    }
    if (exc is TimeoutException) {
      return const TimeoutException('Истекло время ожидания');
    }
    return UnknownException(exc.toString());
  }
}
