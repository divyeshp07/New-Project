import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:state_managment/api_integration/models/api_model2.dart';
import 'package:state_managment/api_integration/utilities/utility_2.dart';

class ApiServices {
  static final http.Client _client = http.Client();
  static Future<List<PostModel>?> getPosts() async {
    final url = Uri.parse(AppUrls.baseUrl + AppUrls.postsPath);
    try {
      http.Response response = await _client.get(url);

      if (response.statusCode == 200) {
        return postModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      log("error from getPosts ${e.toString()}");
    }
    return null;
  }
}
