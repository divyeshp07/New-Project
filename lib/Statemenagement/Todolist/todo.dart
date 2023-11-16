import 'package:flutter/material.dart';

class TodoUi extends StatefulWidget {
  const TodoUi({super.key});

  @override
  State<TodoUi> createState() => _TodoUiState();
}

class _TodoUiState extends State<TodoUi> {
  List<String> todolist = [];
  // var value='';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ToDo"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(
                            label: Text("Type"),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                          _controller.clear();
                          todolist.add(_controller.text);
                        });
                      },
                      label: Text("Add To list"))
                ],
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: todolist.isEmpty
          ? Center(child: Text('No List found'))
          : Column(
              children: [
                ListView.builder(
                  itemCount: todolist.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      todolist[index],
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            todolist.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.delete)),
                  ),
                )
              ],
            ),
    );
  }
}
