import 'dart:convert';

// import 'package:flutter/material.dart';

List<Api4Model> Api4ModelFromJson(String str) {
  return List<Api4Model>.from(
    json.decode(str).map(
          (element) => Api4Model.fromMap(element),
        ),
  );
}

class Api4Model {
  final int userId;
  final String iD;
  final String title;
  final String body;
  Api4Model({
    required this.userId,
    required this.iD,
    required this.title,
    required this.body,
  });

  factory Api4Model.fromMap(Map<String, dynamic> div) => Api4Model(
      userId: div['userId'],
      iD: div['iD'],
      title: div['title'],
      body: div['body']);
}
