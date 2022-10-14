import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

class Customer {
    Customer({
        this.id,
        this.fullName,
        this.phone,
        this.isActive,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? fullName;
    String? phone;
    bool? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        fullName: json["full_name"],
        phone: json["phone"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );
}