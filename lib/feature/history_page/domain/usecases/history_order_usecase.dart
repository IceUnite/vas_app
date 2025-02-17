import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vas_app/core/errors/error_handler.dart';
import 'package:vas_app/core/errors/exception.dart';
import 'package:vas_app/core/errors/failure.dart';
import 'package:vas_app/feature/history_page/data/repository/historia_order_repository_impl.dart';
import 'package:vas_app/feature/history_page/domain/entities/history_document_entity.dart';

@lazySingleton
class HistoryOrdersUseCase {
  final HistoryOrdersRepositoryImpl historyOrdersRepository;

  const HistoryOrdersUseCase({required this.historyOrdersRepository});

  Future<List<HistoryDocumentEntity>> getApplications({
    required int? userId,
    required String? token,
  }) async {
    try {
      final applications = await historyOrdersRepository.getApplications(
        userId: userId,
        token: token,
      );
      return applications ?? [];
    } on DioException catch (e) {
      Exception exception = ServerException(e.message.toString());
      Failure failure = ErrorHandler.handleException(exception);
      throw failure;
    }
  }
}
