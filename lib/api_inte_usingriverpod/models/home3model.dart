import 'dart:convert';

class Home3Model {
  int postId;
  int id;
  String name;
  String email;
  String body;
  Home3Model({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });
  factory Home3Model.fromMap(Map<String?, dynamic> json) => Home3Model(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body']);
}

List<Home3Model> home3ModelFromJson(String str) {
  return List<Home3Model>.from(
      json.decode(str).map((e) => Home3Model.fromMap(e)));
}
