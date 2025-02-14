import 'package:vas_app/feature/order_page/data/models/document_model.dart';

abstract class HistoryOrderServiceApi {
  Future<List<DocumentModel>> getApplications({
    required int? userId,
    required String? token,
    String? status,
    String? description,
    String? startDate,
    String? endDate,
  });
}
