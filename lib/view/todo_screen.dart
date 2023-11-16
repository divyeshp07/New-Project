// import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/model/todo_model.dart';
import 'package:state_managment/provider/todo_screen_provider.dart';

class TodoScreen extends ConsumerWidget {
  TodoScreen({super.key});
  final TextEditingController todocontroller = TextEditingController();
  final bool isChecked = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("todolist"),
      ),
      body: ListView.builder(
        itemCount: ref.watch(todoNotifierProvider).length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            ref.watch(todoNotifierProvider)[index].mask,
            style: TextStyle(color: Colors.white),
          ),
          leading: Checkbox(
              value: ref.read(todoNotifierProvider)[index].isChanged,
              activeColor: Colors.orangeAccent,
              onChanged: (value) {
                ref.read(todoNotifierProvider.notifier).updatetodo(
                    index,
                    TodoModel(
                        mask: ref.watch(todoNotifierProvider)[index].mask,
                        isChanged: value!));
              }),
          trailing: IconButton(
              onPressed: () {
                ref.read(todoNotifierProvider.notifier).delete(index);
              },
              icon: Icon(Icons.delete)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('add to list'),
              content: TextField(
                controller: todocontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type here',
                ),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      ref.read(todoNotifierProvider.notifier).addTodo(TodoModel(
                          mask: todocontroller.text, isChanged: false));
                      // log(ref.watch(todoNotifierProvider).toString());
                      Navigator.pop(context);
                      todocontroller.clear();
                    },
                    child: Text("Add"))
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
