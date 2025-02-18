import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vas_app/core/errors/error_handler.dart';
import 'package:vas_app/core/errors/exception.dart';
import 'package:vas_app/core/errors/failure.dart';
import 'package:vas_app/feature/order_page/data/repository/order_reository_impl.dart';
import 'package:vas_app/feature/order_page/domain/entities/document_entity.dart';
import 'package:vas_app/feature/order_page/domain/entities/reg_application_entity.dart';

@lazySingleton
class OrdersUseCase {
  final OrdersRepositoryImpl ordersRepository;

  const OrdersUseCase({required this.ordersRepository});

  /// Получение списка документов
  Future<List<DocumentEntity?>?>? getDocuments({
    required int userId,
    required String token,
  }) async {
    try {
      final documents = await ordersRepository.getDocuments(userId: userId, token: token);
      return documents;
    } on DioException catch (e) {
      Exception exception = ServerException(e.message.toString());
      Failure failure = ErrorHandler.handleException(exception);
      throw failure;
    }
  }

  /// Регистрация заявки на документ
  Future<RegApplicationEntity?>? registerApplication({
    required int userId,
    required String token,
    required int docId,
    String date = "48",
  }) async {
    try {
      final response = await ordersRepository.registerApplication(
        userId: userId,
        token: token,
        docId: docId,
        date: date,
      );
      return response;
    } on DioException catch (e) {
      Exception exception = ServerException(e.message.toString());
      Failure failure = ErrorHandler.handleException(exception);
      throw failure;
    }
  }
}
