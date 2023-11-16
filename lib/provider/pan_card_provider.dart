import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/model/pan_model.dart';
// import 'package:state_managment/model/pan_model.dart';
import 'package:state_managment/notifiers/pan_notifier.dart';

final panProvider = StateNotifierProvider<PanNotifier, List<PanModel>>((ref) {
  return PanNotifier();
});
