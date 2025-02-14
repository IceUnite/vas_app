import 'package:vas_app/feature/history_page/data/models/document_model.dart';

import '../entities/history_document_entity.dart';

abstract class HistoryOrdersRepository {
  Future<DocumentListEntity?> getApplications({
    required int? userId,
    required String? token,

  });
}
