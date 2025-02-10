

import 'package:vas_app/core/errors/error_handler.dart';
import 'package:vas_app/core/errors/failure.dart';

class ErrorHandler {
  static Failure handleException(Exception exception) {
    if (exception is ServerException) {
      return ServerFailure(exception.message);
    } else if (exception is CacheException) {
      return CacheFailure(exception.message);
    } else {
      return UnknownFailure();
    }
  }
}

class UnknownFailure extends Failure {}
