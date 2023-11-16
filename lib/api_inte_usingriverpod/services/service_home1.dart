import 'package:http/http.dart' as http;
import 'package:state_managment/api_inte_usingriverpod/models/home1model.dart';
import 'package:state_managment/api_integration/utilities/urls4.dart';

class Home1Service {
  static final http.Client _client = http.Client();

  static Future<List<Home1Model>?> getMyPosts() async {
    final url = Uri.parse(AppUrl.baseUrl4 + AppUrl.postPath4);

    try {
      http.Response response = await _client.get(url);

      if (response.statusCode == 200) {
        return home1ModelFromJson(response.body);
      }
      return null;
    } on Exception catch (e) {
      print('Something went wrong: $e');
    }
    return null;
  }
}
