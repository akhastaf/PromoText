// To parse this JSON data, do
//
//     final promotionsList = promotionsListFromJson(jsonString);

import 'dart:convert';

import 'package:promo_app/models/user.model.dart';

import 'meta_model.dart';

PromotionsList promotionsListFromJson(String str) => PromotionsList.fromJson(json.decode(str));

String promotionsListToJson(PromotionsList data) => json.encode(data.toJson());

class PromotionsList {
    PromotionsList({
        required this.items,
        required this.meta,
    });

    List<Promotion> items;
    Meta meta;

    factory PromotionsList.fromJson(Map<String, dynamic> json) => PromotionsList(
        items: List<Promotion>.from(json["items"].map((x) => Promotion.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

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


