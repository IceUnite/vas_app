import 'package:injectable/injectable.dart';
import 'package:vas_app/feature/history_page/data/api/service/historia_order_service.dart';
import 'package:vas_app/feature/order_page/domain/entities/document_entity.dart';

@LazySingleton()
class HistoryOrdersRepositoryImpl {
  final HistoryOrderServiceApi historyOrderServiceApi;

  HistoryOrdersRepositoryImpl({required this.historyOrderServiceApi});

  Future<List<DocumentEntity>> getApplications({
    required int? userId,
    required String? token,
    String? status,
    String? description,
    String? startDate,
    String? endDate,
  }) async {
    final documentModels = await historyOrderServiceApi.getApplications(
      userId: userId,
      token: token,
      status: status,
      description: description,
      startDate: startDate,
      endDate: endDate,
    );

    return documentModels.map((doc) => DocumentEntity(
      id: doc.id,
      name: doc.name,
      description: doc.description,
      minTime: doc.minTime,
    )).toList();
  }
}
