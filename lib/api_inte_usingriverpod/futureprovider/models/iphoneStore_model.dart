// To parse this JSON data, do
//
//     final iphonestore = iphonestoreFromJson(jsonString);

import 'dart:convert';

IphonestoreModel iphonestoreFromJson(String str) =>
    IphonestoreModel.fromJson(json.decode(str));

class IphonestoreModel {
  List<Product> products;
  int total;
  int skip;
  int limit;

  IphonestoreModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory IphonestoreModel.fromJson(Map<String, dynamic> json) =>
      IphonestoreModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );
}

class Product {
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
      );
}
