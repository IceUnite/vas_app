
import '../entities/history_document_entity.dart';

abstract class HistoryOrdersRepository {
  Future<DocumentListEntity?> getApplications({
    required int? userId,
    required String? token,

  });
}
