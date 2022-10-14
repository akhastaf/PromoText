import 'dart:convert';

import 'user.model.dart';

Promotion promotionFromJson(String str) => Promotion.fromJson(json.decode(str));

class Promotion {
    Promotion({
        required this.id,
        required this.title,
        required this.description,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.user,
    });

    int id;
    String title;
    String description;
    String image;
    DateTime createdAt;
    DateTime updatedAt;
    User user;

    factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "user": user.toJson(),
    };
}