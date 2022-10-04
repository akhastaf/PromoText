import 'dart:convert';

import 'promotion_model.dart';

// class Manager {
//     Manager({
//         this.subcribeDate,
//     });

//     DateTime? subcribeDate;

//     factory Manager.fromJson(Map<String, dynamic> json) => Manager(
//         subcribeDate: DateTime.parse(json["subcribeDate"]),
//     );
// }
class Manager {
    Manager({
        this.id,
        this.name,
        this.email,
        this.avatar,
        this.language,
        this.role,
        this.phone,
        this.address,
        this.createdAt,
        this.updatedAt,
        this.promotions,
    });

    int? id;
    String? name;
    String? email;
    String? avatar;
    String? language;
    String? role;
    dynamic? phone;
    dynamic? address;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<Promotion>? promotions;

    factory Manager.fromJson(Map<String, dynamic> json) => Manager(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        language: json["language"],
        role: json["role"],
        phone: json["phone"],
        address: json["address"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        promotions: List<Promotion>.from(json["promotions"].map((x) => Promotion.fromJson(x))),
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "name": name,
    //     "email": email,
    //     "avatar": avatar,
    //     "language": language,
    //     "role": role,
    //     "phone": phone,
    //     "address": address,
    //     "createdAt": createdAt?.toIso8601String(),
    //     "updatedAt": updatedAt?.toIso8601String(),
    //     "promotions": List<dynamic>.from(promotions.map((x) => x.toJson())),
    // };
}
