import 'package:vas_app/feature/order_page/domain/entities/document_entity.dart';

abstract class HistoryOrdersRepository {
  Future<DocumentListEntity?> getApplications({
    required int? userId,
    required String? token,
    String? status,
    String? description,
    String? startDate,
    String? endDate,
  });
}
