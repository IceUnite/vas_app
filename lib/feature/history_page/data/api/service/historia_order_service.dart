import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vas_app/feature/history_page/data/models/history_data_model.dart'; // Убедитесь, что импортируется правильная модель
import 'package:vas_app/feature/history_page/data/models/history_document_model.dart';

@lazySingleton
class HistoryOrderServiceApi {
  final Dio dio;

  HistoryOrderServiceApi(this.dio);

  Future<HistoryDocumentModel> getApplications({
    required int? userId,
    required String? token,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '/applications/get_applications',
        queryParameters: {
          "id_user": userId,
          "token": token,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final code = response.data?['code'] as int?;
        final data = response.data?['data'] as List<dynamic>?;

        // Теперь создаем список с объектами HistoryDataModel
        final dataModels = data?.map((json) => HistoryDataModel.fromJson(json)).toList() ?? [];

        return HistoryDocumentModel(
          code: code ?? 0,
          data: dataModels,
        );
      } else {
        throw Exception('Ошибка получения заявок');
      }
    } catch (e) {
      throw Exception('Ошибка при выполнении запроса: $e');
    }
  }
}
