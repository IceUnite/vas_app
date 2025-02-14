import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vas_app/feature/order_page/data/models/document_model.dart';

@lazySingleton
class HistoryOrderServiceApi {
  final Dio dio;

  HistoryOrderServiceApi(this.dio);

  Future<List<DocumentModel>> getApplications({
    required int? userId,
    required String? token,
    String? status,
    String? description,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '/get_applications',
        queryParameters: {
          "token": token,  // Оставляем только token
          "id_user": userId, // Убираем id_user, так как это автоматически вычисляется
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data!["data"] as List<dynamic>;
        return data.map((json) => DocumentModel.fromJson(json)).toList();
      } else {
        throw Exception('Ошибка получения заявок');
      }
    } catch (e) {
      throw Exception('Ошибка при выполнении запроса: $e');
    }
  }
}
