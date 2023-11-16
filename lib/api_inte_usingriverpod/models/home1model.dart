import 'dart:convert';

class Home1Model {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Home1Model({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Home1Model.fromMap(Map<String?, dynamic> map) => Home1Model(
        userId: map['userId'],
        id: map['id'],
        title: map['title'],
        body: map['body'],
      );
}

List<Home1Model> home1ModelFromJson(String str) {
  return List<Home1Model>.from(
    json.decode(str).map(
          (element) => Home1Model.fromMap(element),
        ),
  );
}
