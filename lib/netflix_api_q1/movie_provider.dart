// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:state_managment/revie_api_q1/movie.service.dart';
// import 'package:state_managment/revie_api_q1/movie_model.dart';

// final trendingnowProvider = FutureProvider<TrendingNow?>((ref) async {
//   return TrendingnowServices.fetchPost();
// });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/netflix_api_q1/movie.service.dart';
import 'package:state_managment/netflix_api_q1/movie_model.dart';

// trending
final trendingnowProvider = FutureProvider<TrendingNow?>(
    (ref) async => TrendingnowServices.fetchPostTranding());

// popular
final PopularProvider = FutureProvider<Popular?>((ref) async {
  return PopularServices.getPostPopular();
});

// upcoming
final upcomingProvider = FutureProvider<Upcoming?>((ref) async {
  return UpcommingServices.getPostUpcoming();
});
