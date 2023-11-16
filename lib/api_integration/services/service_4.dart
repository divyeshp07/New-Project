import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:state_managment/api_integration/models/api_model4.dart';
import 'package:state_managment/api_integration/utilities/urls4.dart';

class Apiservice4 {
  static final http.Client _client = http.Client();
  static Future<List<Api4Model>?> getPosts() async {
    final url = Uri.parse(AppUrl.baseUrl4 + AppUrl.postPath4);
    try {
      http.Response response = await _client.get(url);
      if (response.statusCode == 200) {
        return Api4ModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      log('something wrangg${e.toString()}');
    }
    return null;
  }
}
