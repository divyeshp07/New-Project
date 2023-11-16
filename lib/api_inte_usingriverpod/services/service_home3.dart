import 'package:http/http.dart' as http;
import 'package:state_managment/api_inte_usingriverpod/models/home3model.dart';
import 'package:state_managment/api_inte_usingriverpod/utils/url_home3.dart';

class Home3Services {
  static final http.Client _client = http.Client();
  static Future<List<Home3Model>?> getPost_H3() async {
    final url = Uri.parse(Home3Url.baseUrl + Home3Url.pathUrl);

    try {
      http.Response response = await _client.get(url);
      if (response.statusCode == 200) {
        return home3ModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      print('something wrangggg');
    }
    return null;
  }
}
