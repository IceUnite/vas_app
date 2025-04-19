import 'package:vas_app/feature/order_page/data/models/document_model.dart';
import 'package:vas_app/feature/order_page/data/models/reg_application_model.dart';

abstract class OrderServiceApi {
  /// Получение списка доступных для заказа документов
  Future<List<DocumentModel>> getDocuments({
    required String userId,
    required String token,
  });

  /// Регистрация заявки на документ
  Future<RegApplicationModel> regApplication({
    required int userId,
    required String token,
    required int docId,
    String date = "48",
    String? description,
  });
}
