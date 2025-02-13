import 'package:injectable/injectable.dart';
import 'package:vas_app/feature/order_page/data/api/service/order_service_api.dart';
import 'package:vas_app/feature/order_page/domain/entities/document_entity.dart';

@LazySingleton()
class OrdersRepositoryImpl {
  final OrderServiceApi orderServiceApi;

  OrdersRepositoryImpl({required this.orderServiceApi});

  Future<List<DocumentEntity>> getDocuments({
    required int userId,
    required String token,
  }) async {
    final documentModels = await orderServiceApi.getDocuments(userId: userId, token: token);
    return documentModels.map((doc) => DocumentEntity(
      id: doc.id,
      name: doc.name,
      description: doc.description,
      minTime: doc.minTime,
    )).toList();
  }
}
