import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String? id;
  String title;
  String subtitle;
  String image;
  DateTime createdAt;
  bool stock;

  ProductModel({
    this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.createdAt,
    required this.stock,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        title: json["title"],
        subtitle: json["subtitle"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        stock: (json["stock"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "image": image,
        "created_at": createdAt,
        "stock": stock,
      };
}
