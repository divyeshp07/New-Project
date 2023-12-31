import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/api_inte_usingriverpod/futureprovider/models/home2model.dart';
import 'package:state_managment/api_inte_usingriverpod/futureprovider/services/service_home2.dart';

final home2FutureProvider =
    FutureProvider<List<Home2Model>?>((ref) => Home2Service.getMyPosts_H2());
