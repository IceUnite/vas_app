import 'package:injectable/injectable.dart';
import 'package:vas_app/feature/history_page/data/api/service/historia_order_service.dart';
import 'package:vas_app/feature/history_page/domain/entities/history_document_entity.dart';

@LazySingleton()
class HistoryOrdersRepositoryImpl {
  final HistoryOrderServiceApi historyOrderServiceApi;

  HistoryOrdersRepositoryImpl({required this.historyOrderServiceApi});

  Future<List<HistoryDocumentEntity>> getApplications({
    required int? userId,
    required String? token,
  }) async {
    final historyDocumentModel = await historyOrderServiceApi.getApplications(
      userId: userId,
      token: token,
    );

    // Преобразуем List<HistoryDataModel> в List<HistoryDocumentEntity>
    return historyDocumentModel.data?.map((doc) {
          // Преобразуем documentData из DocumentModel в DocumentEntity
          DocumentEntity? documentEntity = DocumentEntity.fromDocumentModel(doc.document);

          return HistoryDocumentEntity(
            id: doc.id,
            idUser: doc.idUser,
            status: doc.status ?? 'Неизвестно',
            // Проставляем статус по умолчанию
            description: doc.description ?? 'Описание отсутствует',
            // Описание по умолчанию
            date: doc.date ?? '',
            // Если дата отсутствует, передаем пустую строку
            createdAt: doc.createdAt ?? '',
            // Если дата создания отсутствует, передаем пустую строку
            updatedAt: doc.updatedAt ?? '',
            // Если дата обновления отсутствует, передаем пустую строку
            document: documentEntity, // Теперь передаем DocumentEntity
          );
        }).toList() ??
        [];
  }
}
