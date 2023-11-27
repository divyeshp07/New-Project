import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/api_inte_usingriverpod/futureprovider/models/iphoneStore_model.dart';
import 'package:state_managment/api_inte_usingriverpod/futureprovider/services/service_iphonestore.dart';

final iphonestoreProvider = FutureProvider<IphonestoreModel?>((ref) async {
  return IphonestoreService.getpost_ipstore();
});
