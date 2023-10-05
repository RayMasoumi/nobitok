import 'dart:convert';

import 'package:nobitok/data/models/document.dart';
import 'package:nobitok/data/services/get_all_documents_service.dart';

import '../../constants/strings.dart';

class DocumentRepository {
  final GetAllDocumentsService getAllDocumentsService;

  DocumentRepository(this.getAllDocumentsService);

  Future<List<Document>> fetchAllDocuments() async {
    final response = await getAllDocumentsService.getAllDocuments();
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> dataList = jsonResponse['dataList'];
      List<Document> documents = dataList.map((data) {
        return Document.fromJson(data);
      }).toList();
      return documents;
    } else {
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      throw Exception('$kGetAllDocumentsException:${response.body}');
    }
  }
}
