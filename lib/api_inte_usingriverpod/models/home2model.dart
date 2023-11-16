// import 'dart:convert';

// // import 'package:flutter/material.dart';
// List<Home2Model> postModelnewFromJson(String str){
// return List<Home2Model>.from(json.decode(str)).map((element) => Home2Model.fromMap(element))
// }

// class Home2Model {
//   final int userId;
//   final String iD;
//   final String title;
//   final String body;
//   Home2Model({
//     required this.userId,
//     required this.iD,
//     required this.title,
//     required this.body,
//   });

//   factory Home2Model.fromMap(Map<String?, dynamic> json) => Home2Model(
//       userId: json['userId'],
//       iD: json['iD'],
//       title: json['title'],
//       body: json['body']);
// }

class Home2Model {
  int postId;
  int id;
  String name;
  String email;
  String body;
  Home2Model(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});
}
