import 'dart:convert';

class Home2Model {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Home2Model({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Home2Model.fromMap(Map<String?, dynamic> json) => Home2Model(
        postId: json['postId'],
        id: json['id'],
        name: json['name'],
        email: json['email'],
        body: json['body'],
      );
}

List<Home2Model> home2ModelFromJson(String str) {
  return List<Home2Model>.from(
    json.decode(str).map(
          (e) => Home2Model.fromMap(e),
        ),
  );
}
