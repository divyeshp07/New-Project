import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/api_inte_usingriverpod/futureprovider/services/service_home4.dart';

final home4futureprovider = FutureProvider((ref) async {
  return Home4Services.getPost_H4();
});
