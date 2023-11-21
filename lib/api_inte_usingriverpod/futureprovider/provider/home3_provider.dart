import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/api_inte_usingriverpod/futureprovider/services/service_home3.dart';

final home3FutureProvider = FutureProvider((ref) async {
  return Home3Services.getPost_H3();
});
