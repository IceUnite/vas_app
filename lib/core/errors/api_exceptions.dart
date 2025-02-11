import 'package:dio/dio.dart';

abstract class ApiException extends DioException {
  ApiException({
    this.title,
    String? message,
    Object? error,
    required RequestOptions requestOptions,
  }) : super(
      requestOptions: requestOptions,
      message: message,
      error: error
  );

  final String? title;

  @override
  String toString() => '$runtimeType(title: $title, message: $message)';
}

class UnknownException extends ApiException {
  UnknownException({
    required RequestOptions requestOptions,
    Object? error,
  }) : super(
      title: 'Ошибка',
      message: 'Неизвестная ошибка',
      requestOptions: requestOptions,
      error: error
  );
}

class UnauthorizedRequestException extends ApiException {
  UnauthorizedRequestException({
    required RequestOptions requestOptions,
    Object? error,
  }) : super(
      title: 'Ошибка',
      message: 'Доступ запрещен. Неверный токен запроса',
      requestOptions: requestOptions,
      error: error
  );
}

class ForbiddenRequestException extends ApiException {
  ForbiddenRequestException({
    required RequestOptions requestOptions,
    Object? error,
  }) : super(
      title: 'Ошибка',
      message: 'У вас недостаточно прав для доступа к этой странице',
      requestOptions: requestOptions,
      error: error
  );
}

class NotFoundException extends ApiException {
  NotFoundException({
    required RequestOptions requestOptions,
    Object? error,
  }) : super(
      title: 'Ошибка',
      message: 'Не найдено',
      requestOptions: requestOptions,
      error: error
  );
}

class FailedRequestException extends ApiException {
  FailedRequestException({
    String? title,
    String? message,
    this.code,
    this.showHelpPhone,
    this.confirmButtonText,
    this.closeButtonText,
    required RequestOptions requestOptions,
    Object? error,
  }) : super(
      title: title,
      message: message,
      requestOptions: requestOptions,
      error: error
  );

  final int? code;
  final bool? showHelpPhone;
  final String? confirmButtonText;
  final String? closeButtonText;

}

class ServerError extends ApiException {
  ServerError({
    required RequestOptions requestOptions,
    Object? error,
  }) : super(
      title: 'Ошибка',
      message: 'Произошла ошибка, просьба обратиться в техподдержку',
      requestOptions: requestOptions,
      error: error
  );
}
