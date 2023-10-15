import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../../constants/urls.dart';
import '../models/document.dart';

class PostNewDocumentService {
  Future<http.Response> postNewDocument(
      int customerId, Document newDocument) async {
// * Implement API request to send information using the token here
    final url = Uri.parse('$kBaseUrl$kPostNewDocumentUrl');
    final headers = {
      'Authorization': 'Bearer ${GetStorage().read(kTokenBox)}',
      'Content-Type': 'application/json',
    };

    final body = {
      "drugConsume": newDocument.drugConsume,
      "thyroidDisease": newDocument.thyroidDisease,
      "bloodPressure": newDocument.bloodPressure,
      "smokingOrAlcoholConsumption": newDocument.smokingOrAlcoholConsumption,
      "acutanConsumption": newDocument.acutanConsumption,
      "cardiovascularDisease": newDocument.cardiovascularDisease,
      "pregnancy": newDocument.pregnancy,
      "diabetes": newDocument.diabetes,
      "breastFeeding": newDocument.breastFeeding,
      "deformedWounds": newDocument.deformedWounds,
      "herpes": newDocument.herpes,
      "radioTherapy": newDocument.radioTherapy,
      "medicalAllergy": newDocument.medicalAllergy,
      "neuropsychiatricDiseases": newDocument.neuropsychiatricDiseases,
      "hiv": newDocument.hiv,
      "hepatitis": newDocument.hepatitis,
      "shockDuringInjection": newDocument.shockDuringInjection,
      "presenceOfMetalPlates": newDocument.presenceOfMetalPlates,
      "roaccutane": newDocument.roaccutane,
      "daccutane": newDocument.daccutane,
      "tatto": newDocument.tattoo,
      "customerId": customerId,
    };
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );
      return response;
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }
}
