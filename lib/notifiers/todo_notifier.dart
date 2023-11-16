import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/model/todo_model.dart';

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]);

  void addTodo(TodoModel mask) {
    state = [...state, mask];
  }

  void delete(int index) {
    state = [
      for (TodoModel mask in state)
        if (mask != state[index]) mask
    ];
  }

  void updatetodo(int index, TodoModel updatedmask) {
    state = [
      for (TodoModel mask in state)
        if (mask != state[index]) mask else updatedmask
    ];
  }

  void editTodo(int index, TodoModel editedTodo) {
    state[index] = editedTodo;
    state = List.from(state);
  }
}
