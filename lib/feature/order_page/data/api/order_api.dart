import 'package:vas_app/feature/order_page/data/models/document_model.dart';

abstract class OrderServiceApi {

  /// Получение списка доступных для заказа документов
  Future<List<DocumentModel>> getDocuments({
    required String userId,
    required String token,
  });
}
