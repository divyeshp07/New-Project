import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/model/todo_model.dart';
import 'package:state_managment/notifiers/todo_notifier.dart';

final todoNotifierProvider =
    StateNotifierProvider<TodoNotifier, List<TodoModel>>((ref) {
  return TodoNotifier();
});
