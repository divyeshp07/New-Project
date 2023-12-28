import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/user_api/model.dart';
import 'package:state_managment/user_api/service.dart';

final userdetailsProvider = FutureProvider<List<UserDetailsss>?>((ref) async {
  return UserDetailsService.fetchpostUser();
});
