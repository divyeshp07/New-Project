import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/api_inte_usingriverpod/view/api_home4.dart';
// import 'package:state_managment/api_integration/view/api_integration3.dart';
// import 'package:state_managment/view/api_integration1.dart';
// import 'package:state_managment/view/pan_screen.dart';
// import 'package:state_managment/view/contact_list.dart';
// import 'package:state_managment/view/todo_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'home',
      theme: ThemeData.dark(),
      home: const Home4(),
    );
  }
}
