import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

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
}
