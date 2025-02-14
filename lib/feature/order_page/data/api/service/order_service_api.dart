import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vas_app/feature/order_page/data/models/reg_application_model.dart';

import '../../models/document_model.dart';

@lazySingleton
class OrderServiceApi {
  final Dio dio;

  OrderServiceApi(this.dio);
  /// Получение списка документов, доступных для заказа
  Future<List<DocumentModel>> getDocuments({
    required int userId,
    required String token,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '/get_documents',
        queryParameters: {
          "id_user": userId,
          "token": token,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data!['data'] as List<dynamic>;
        return data.map((json) => DocumentModel.fromJson(json)).toList();
      } else {
        throw Exception('Ошибка получения документов');
      }
    } catch (e) {
      throw Exception('Ошибка при выполнении запроса: $e');
    }
  }

  /// Регистрация новой заявки на документ
  Future<RegApplicationModel> regApplication({
    required int userId,
    required String token,
    required int docId,
    String date = "48",
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '/reg_application',
        queryParameters: {
          "id_user": userId,
          "token": token,
          "id_doc": docId,
          "date": date,
        },
      );

      if (response.statusCode == 201 && response.data != null) {
        return RegApplicationModel.fromJson(response.data!);
      } else {
        throw Exception('Ошибка регистрации заявки');
      }
    } catch (e) {
      throw Exception('Ошибка при выполнении запроса: $e');
    }
  }

}
