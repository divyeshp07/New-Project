import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:state_managment/api_integration/models/api_model2.dart';
import 'package:state_managment/api_integration/utilities/utility_2.dart';

class ApiServices {
  static final http.Client _client = http.Client();
  static Future<List<PostModel>?> getAllPosts() async {
    final url = Uri.parse(AppUrls.baseUrl + AppUrls.postsPath);
    List<PostModel>? result;
    try {
      http.Response response = await _client.get(url);
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        log(response.body);
        result = postModelFromJson(response.body);
      }
    } catch (e) {
      log("An Error Occured while executing getPosts $e");
      return result;
    }
    return result;
  }
}
