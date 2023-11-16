// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Apiui extends StatefulWidget {
//   const Apiui({super.key});

//   @override
//   State<Apiui> createState() => _ApiuiState();
// }

// class _ApiuiState extends State<Apiui> {
//   Future Apicall() async {
//     http.Response response;
//     response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
//     if (response.statusCode == 200) {
//       setState(() {
//         var stringResponce = response.body;
//       });
//     }
//   }

//   @override
//   void initState() {
//     Apicall();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Api 1"),
//       ),
//       body: Center(
//         child: Container(
//           width: 300,
//           height: 250,
//           color: Colors.amber,
//           child: Column(
//             children: [
//               Text(stringResponce.toString()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Apiui extends StatefulWidget {
  const Apiui({super.key});

  @override
  State<Apiui> createState() => _ApiuiState();
}

class _ApiuiState extends State<Apiui> {
  late String stringResponse;
  late Map mapResponse;
  @override
  void initState() {
    super.initState();
    Apicall();
  }

  Future<void> Apicall() async {
    http.Response response;
    response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = jsonDecode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Api 1"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 250,
          color: Colors.amber,
          child: Column(
            children: [
              Text(mapResponse['data'].toString()),
            ],
          ),
        ),
      ),
    );
  }
}


// not completed 
