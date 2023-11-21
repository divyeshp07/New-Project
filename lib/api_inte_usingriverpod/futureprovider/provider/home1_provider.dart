import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/api_inte_usingriverpod/futureprovider/models/home1model.dart';
import 'package:state_managment/api_inte_usingriverpod/futureprovider/services/service_home1.dart';

final home1FutureProvider =
    FutureProvider<List<Home1Model>?>((ref) => Home1Service.getMyPosts());
