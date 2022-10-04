// To parse this JSON data, do
//
//     final managerList = managerListFromJson(jsonString);

import 'dart:convert';

import 'package:promo_app/models/promotion_model.dart';

import 'manager_model.dart';
import 'meta_model.dart';

ManagerList managerListFromJson(String str) => ManagerList.fromJson(json.decode(str));

// String managerListToJson(ManagerList data) => json.encode(data.toJson());

class ManagerList {
    ManagerList({
        this.items = const <Manager>[],
        this.meta,
    });

    List<Manager>? items;
    Meta? meta;

    factory ManagerList.fromJson(Map<String, dynamic> json) => ManagerList(
        items: List<Manager>.from(json["items"].map((x) => Manager.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "items": List<dynamic>.from(items.map((x) => x.toJson())),
    //     "meta": meta.toJson(),
    // };
}

