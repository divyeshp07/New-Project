import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/model/pan_model.dart';

class PanNotifier extends StateNotifier<List<PanModel>> {
  PanNotifier() : super([]);

  void panNumAdd(PanModel pannum) {
    state = [...state, pannum];
  }
  // void
}
