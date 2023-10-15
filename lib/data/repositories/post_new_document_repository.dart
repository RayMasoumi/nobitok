import 'package:nobitok/data/models/document.dart';
import 'package:nobitok/data/services/post_new_document_service.dart';

import '../../constants/strings.dart';

class PostNewDocumentRepository {
  final PostNewDocumentService postNewDocumentService;

  PostNewDocumentRepository(this.postNewDocumentService);

  Future<bool> sendNewDocument(int customerId, Document newDocument) async {
    final response =
        await postNewDocumentService.postNewDocument(customerId, newDocument);

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Send New Document Status Code: ${response.statusCode}');
      print('Send New Document Body: ${response.body}');
      throw Exception('$kSendNewDocumentException:${response.body}');
    }
  }
}
