import 'package:http/http.dart' as http;
import 'package:state_managment/api_inte_usingriverpod/futureprovider/models/iphoneStore_model.dart';
import 'package:state_managment/api_inte_usingriverpod/futureprovider/utils/url_IphoneStore.dart';

class IphonestoreService {
  static final http.Client _client = http.Client();
  static Future<IphonestoreModel?> getpost_ipstore() async {
    final UrliphoneStore = Uri.parse(iphoneStoreUrl.istoreUrl);
    try {
      http.Response response = await _client.get(UrliphoneStore);
      if (response.statusCode == 200) {
        return iphonestoreFromJson(response.body);
      }
      return null;
    } on Exception catch (e) {
      print('error $e');
    }
    return null;
  }
}
