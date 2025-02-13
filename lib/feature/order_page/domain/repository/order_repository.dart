import 'package:vas_app/feature/order_page/domain/entities/document_entity.dart';

abstract class OrdersRepository {
  Future<DocumentListEntity?> getDocuments({
    required int userId,
    required String token,
  });
}