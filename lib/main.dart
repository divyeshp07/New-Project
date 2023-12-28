import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/netflix_api_q1/view/logopage.dart';
import 'package:state_managment/state_management_without_external_package(changenotifier,inheritedwidget,valuenotifier)/cartservice.dart';
import 'package:state_managment/state_management_without_external_package(changenotifier,inheritedwidget,valuenotifier)/inheritedwidget.dart';
import 'package:state_managment/state_management_without_external_package(changenotifier,inheritedwidget,valuenotifier)/screen.dart';
import 'package:state_managment/state_management_without_external_package(changenotifier,inheritedwidget,valuenotifier)/services.dart';
import 'package:state_managment/user_api/fav.dart';
import 'package:state_managment/user_api/view.dart';
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
    return ProductContainer(
        productServices: ProductServices(),
        child: CartContainer(
            cartService: Cartservice(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'home',
              theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: Colors.grey[900],
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.grey[900],
                ),
              ),
              // home: const LogoNetflix(),
              // home: const UserDetails(),
              home: ProductListScreen(),
            )));
    //  MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'home',
    //   theme: ThemeData.dark().copyWith(
    //     scaffoldBackgroundColor: Colors.grey[900],
    //     appBarTheme: AppBarTheme(
    //       backgroundColor: Colors.grey[900],
    //     ),
    //   ),
    //   // home: const LogoNetflix(),
    //   // home: const UserDetails(),
    //   home: ProductContainer(
    //     productServices: ProductServices(),
    //     child: CartContainer(
    //         cartService: Cartservice(), child: ProductListScreen()),
    //   ),
    // );
  }
}
