import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vas_app/core/errors/error_handler.dart';
import 'package:vas_app/core/errors/exception.dart';
import 'package:vas_app/core/errors/failure.dart';
import 'package:vas_app/feature/order_page/data/repository/order_reository_impl.dart';
import 'package:vas_app/feature/order_page/domain/entities/document_entity.dart';

@lazySingleton
class OrdersUseCase {
  final OrdersRepositoryImpl ordersRepository;

  const OrdersUseCase({required this.ordersRepository});

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
}