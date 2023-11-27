// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:state_managment/revie_api_q1/movie.service.dart';
// import 'package:state_managment/revie_api_q1/movie_model.dart';

// final trendingnowProvider = FutureProvider<TrendingNow?>((ref) async {
//   return TrendingnowServices.fetchPost();
// });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/revie_api_q1/movie.service.dart';
import 'package:state_managment/revie_api_q1/movie_model.dart';

final trendingnowProvider = FutureProvider<TrendingNow?>(
    (ref) async => TrendingnowServices.fetchPost());
