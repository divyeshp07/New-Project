import 'package:http/http.dart' as http;
import 'package:state_managment/api_inte_usingriverpod/models/home4model.dart';
import 'package:state_managment/api_inte_usingriverpod/utils/url_home4.dart';

class Home4Services {
  static final http.Client _client = http.Client();
  static Future<WetherAppModel?> getPost_H4() async {
    final url = Uri.parse(Home4Url.baseUrl);
    try {
      http.Response response = await _client.get(url);
      if (response.statusCode == 200) {
        return wetherAppFromJson(response.body);
      }
      return null;
    } catch (e) {
      print('something wraaanggg');
    }
    return null;
  }
}
