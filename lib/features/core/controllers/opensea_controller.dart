import 'dart:convert';

import 'package:get/get.dart';
import 'package:login_app/features/core/models/opensea_model.dart';
import 'package:http/http.dart' as http;

class OpenseaController extends GetxController {
  OpenseaModel? openseaModel;

  final apiKey = '1a8a655fb56141b2a81e88595945e115';

  Future<OpenseaModel> fetchOpenseaData() async {
    try {
      final response = await http.get(
          Uri.tryParse('https://api.opensea.io/api/v1/assets')!,
          headers: {'X-API-KEY': apiKey});
      try {
        final result = jsonDecode(response.body);
        openseaModel = OpenseaModel.fromJson(result);
        return openseaModel!;
      } catch (e) {
        throw 'Error fetching data';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
