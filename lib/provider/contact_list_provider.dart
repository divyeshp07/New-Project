import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/model/contact_model.dart';
import 'package:state_managment/notifiers/contact_notifier.dart';

final contactNotifierProvider =
    StateNotifierProvider<ContactNotifier, List<ContactModel>>((ref) {
  return ContactNotifier();
});
