import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:state_managment/revie_api_q1/movie_model.dart';
import 'package:state_managment/revie_api_q1/movie_url.dart';

class TrendingnowServices {
  static final http.Client _client = http.Client();

  static Future<TrendingNow?> fetchPost() async {
    final url = Uri.parse(MovieUrl.baseurl);

    try {
      final response = await _client.get(url);

      if (response.statusCode == 200) {
        return trendingNowFromJson(response.body);
      }
      return null;
    } on Exception catch (_) {
      log(7);
    }
    return null;
  }
}
