import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:state_managment/revie_api_q1/view/movie_screen.dart';

class LogoNetflix extends StatelessWidget {
  const LogoNetflix({super.key});

  @override
  Widget build(BuildContext context) {
    // for automatically next page
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MovieApp()));
    });
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/lottie/Animation - 1700819530556.json',
            fit: BoxFit.cover),
      ),
    );
  }
}
