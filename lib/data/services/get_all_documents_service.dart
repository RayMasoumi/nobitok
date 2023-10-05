import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../../constants/urls.dart';

class GetAllDocumentsService {
  Future<http.Response> getAllDocuments() async {
// * Implement API request to fetch information using the token here
    final url = Uri.parse('$kBaseUrl$kGetAllDocumentsUrl');

    try {
      final response = await http.get(
        url,
      );
      return response;
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }
}
