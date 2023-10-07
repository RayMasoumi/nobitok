import 'dart:convert';

import '../../constants/strings.dart';
import '../../data/models/service.dart';
import '../services/get_all_services.dart';

class ServiceRepository {
  final GetAllServicesService getAllServicesService;

  ServiceRepository(this.getAllServicesService);

  Future<List<Service>> fetchAllServices() async {
    final response = await getAllServicesService.fetchAllServices();
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> dataList = jsonResponse['dataList'];
      List<Service> services = dataList.map((data) {
        return Service.fromJson(data);
      }).toList();
      return services;
    } else {
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      throw Exception('$kGetAllCustomersException:${response.body}');
    }
  }
}
