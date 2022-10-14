// To parse this JSON data, do
//
//     final managerList = managerListFromJson(jsonString);

import 'dart:convert';

List<ManagerList> managerListFromJson(String str) => List<ManagerList>.from(json.decode(str).map((x) => ManagerList.fromJson(x)));

// String managerListToJson(List<ManagerList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ManagerList {
    ManagerList({
        this.id,
        this.name,
        this.email,
        this.avatar,
        this.language,
        this.role,
        this.phone,
        this.address,
        this.isActive,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    String? email;
    String? avatar;
    String? language;
    String? role;
    String? phone;
    String? address;
    bool? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory ManagerList.fromJson(Map<String, dynamic> json) => ManagerList(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        language: json["language"],
        role: json["role"],
        phone: json["phone"],
        address: json["address"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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
    //     "isActive": isActive,
    //     "createdAt": createdAt.toIso8601String(),
    //     "updatedAt": updatedAt.toIso8601String(),
    // };
}

// import 'dart:convert';

// import 'package:promo_app/models/manager_model.dart';

// import 'meta_model.dart';

// ManagerList managerListFromJson(String str) => ManagerList.fromJson(json.decode(str));

// // String managerListToJson(ManagerList data) => json.encode(data.toJson());

// class ManagerList {
//     ManagerList({
//         this.items = const [],
//     });

//     List<Manager>? items;
//     Meta? meta;

//     factory ManagerList.fromJson(Map<String, dynamic> json) => ManagerList(
//         items: List<Manager>.from(json["items"].map((x) => Manager.fromJson(x))),
//         meta: Meta.fromJson(json["meta"]),
//     );

//     // Map<String, dynamic> toJson() => {
//     //     "items": List<dynamic>.from(items.map((x) => x.toJson())),
//     //     "meta": meta.toJson(),
//     // };
// }

// // // To parse this JSON data, do
// // //
// // //     final managerList = managerListFromJson(jsonString);

// // import 'dart:convert';

// // import 'package:promo_app/models/promotion_model.dart';

// // import 'manager_model.dart';
// // import 'meta_model.dart';

// // ManagerList managerListFromJson(String str) =>
// //     ManagerList.fromJson(json.decode(str));

// // // String managerListToJson(ManagerList data) => json.encode(data.toJson());

// // class ManagerList {
// //   ManagerList({
// //     this.items = const [],
// //     this.meta,
// //   });

// //   List<Manager>? items;
// //   Meta? meta;

// //   factory ManagerList.fromJson(Map<String, dynamic> json) {
// //     print(json);
// //     return ManagerList(
// //       items: json["items"] != null ? 
// //           List<Manager>.from(json["items"].map((x) => Manager.fromJson(x)))
// //           : [],
// //       meta: Meta.fromJson(json["meta"]),
// //     );
// //     // print(t.items?.length);
// //     // return t;
// //   }

// //   // Map<String, dynamic> toJson() => {
// //   //     "items": List<dynamic>.from(items.map((x) => x.toJson())),
// //   //     "meta": meta.toJson(),
// //   // };
// // }
