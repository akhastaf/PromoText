// To parse this JSON data, do
//
//     final promotionsList = promotionsListFromJson(jsonString);

import 'dart:convert';

import 'package:promo_app/models/user.model.dart';

import 'meta_model.dart';
import 'promotion_model.dart';

PromotionsList promotionsListFromJson(String str) => PromotionsList.fromJson(json.decode(str));

// String promotionsListToJson(PromotionsList data) => json.encode(data.toJson());

class PromotionsList {
    PromotionsList({
        this.items = const <Promotion>[],
        this.meta
    });

    List<Promotion>? items;
    Meta? meta;

    factory PromotionsList.fromJson(Map<String, dynamic> json) => PromotionsList(
        items: List<Promotion>.from(json["items"].map((x) => Promotion.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "items": List<dynamic>.from(items.map((x) => x.toJson())),
    //     "meta": meta.toJson(),
    // };
}




