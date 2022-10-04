// To parse this JSON data, do
//
//     final promotionsList = promotionsListFromJson(jsonString);

import 'dart:convert';

import 'package:promo_app/models/user.model.dart';

import 'meta_model.dart';
import 'promotion_model.dart';

PromotionList promotionsListFromJson(String str) => PromotionList.fromJson(json.decode(str));

// String promotionsListToJson(PromotionsList data) => json.encode(data.toJson());

class PromotionList {
    PromotionList({
        this.items = const <Promotion>[],
        this.meta
    });

    List<Promotion>? items;
    Meta? meta;

    factory PromotionList.fromJson(Map<String, dynamic> json) => PromotionList(
        items: List<Promotion>.from(json["items"].map((x) => Promotion.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "items": List<dynamic>.from(items.map((x) => x.toJson())),
    //     "meta": meta.toJson(),
    // };
}




