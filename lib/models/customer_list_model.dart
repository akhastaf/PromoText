import 'dart:convert';

import 'package:promo_app/models/user.model.dart';

import 'customer_model.dart';
import 'meta_model.dart';

CustomerList customerListFromJson(String str) => CustomerList.fromJson(json.decode(str));

// String customerListToJson(CustomerList data) => json.encode(data.toJson());

class CustomerList {
    CustomerList({
        this.items = const [],
        this.meta,
    });

    List<Customer>? items;
    Meta? meta;

    factory CustomerList.fromJson(Map<String, dynamic> json) => CustomerList(
        items: List<Customer>.from(json["items"].map((x) => Customer.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "customers": List<dynamic>.from(customers.map((x) => x.toJson())),
    //     "meta": meta?.toJson(),
    // };
}