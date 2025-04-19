import 'package:vas_app/feature/order_page/domain/entities/document_entity.dart';
import 'package:vas_app/feature/order_page/domain/entities/reg_application_entity.dart';

abstract class OrdersRepository {
  /// Получение списка документов
  Future<DocumentListEntity?> getDocuments({
    required int userId,
    required String token,
  });

  /// Регистрация заявки на документ
  Future<RegApplicationEntity> registerApplication({
    required int userId,
    required String token,
    required int docId,
    String date = "48",
    String? description,
  });
}
