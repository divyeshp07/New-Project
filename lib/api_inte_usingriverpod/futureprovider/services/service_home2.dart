import 'package:http/http.dart' as http;
import 'package:state_managment/api_inte_usingriverpod/futureprovider/models/home2model.dart';
import 'package:state_managment/api_inte_usingriverpod/futureprovider/utils/url_home2.dart';

class Home2Service {
  static final http.Client _client = http.Client();

  static Future<List<Home2Model>?> getMyPosts_H2() async {
    final url = Uri.parse('${AppUrl_H2().baseUrlh2}${AppUrl_H2().pathUrlh2}');

    try {
      http.Response response = await _client.get(url);

      if (response.statusCode == 200) {
        return home2ModelFromJson(response.body);
      }
      return null;
    } on Exception catch (e) {
      print('Something went wrong: $e');
    }
    return null;
  }
}
