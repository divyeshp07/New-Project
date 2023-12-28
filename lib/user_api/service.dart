import 'package:http/http.dart ' as http;
import 'package:state_managment/user_api/model.dart';
import 'package:state_managment/user_api/url.dart';

class UserDetailsService {
  static final http.Client _client = http.Client();

  static Future<List<UserDetailsss>?> fetchpostUser() async {
    final urluser = Uri.parse(UserDetailsUrl.url);

    try {
      final response = await _client.get(urluser);
      if (response.statusCode == 200) {
        return userDetailsFromJson(response.body);
      }
      return null;
    } catch (e) {
      print('Error fetching user details: $e');
    }
    return null;
  }
}
