// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.id,
        required this.name,
        required this.email,
        required this.avatar,
        required this.language,
        required this.role,
        required this.phone,
        required this.address,
        // required this.createdAt,
        // required this.updatedAt,
    });

    int id;
    String name;
    String email;
    String avatar;
    String language;
    String role;
    dynamic phone;
    dynamic address;
    // DateTime createdAt;
    // DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        language: json["language"],
        role: json["role"],
        phone: json["phone"],
        address: json["address"],
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "avatar": avatar,
        "language": language,
        "role": role,
        "phone": phone,
        "address": address,
        // "createdAt": createdAt.toIso8601String(),
        // "updatedAt": updatedAt.toIso8601String(),
    };
}




// import 'dart:convert';

// User userFromJson(String str) => User.fromJson(json.decode(str));

// String userToJson(User data) => json.encode(data.toJson());

// class User {
//   User({
//       this.id,
//       this.name,
//       this.email,
//       this.avatar,
//       this.language,
//       this.role,
//       this.phone,
//       this.address,
//       this.createdAt,
//       this.updatedAt,
//       this.subscribeDate,
//   });

//   int? id;
//   String? name;
//   String? email;
//   String? avatar;
//   String? language;
//   String? role;
//   String? phone;
//   String? address;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   DateTime? subscribeDate;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//       id: json["id"],
//       name: json["name"],
//       email: json["email"],
//       avatar: json["avatar"],
//       language: json["language"],
//       role: json["role"],
//       phone: json["phone"],
//       address: json["address"],
//       createdAt: DateTime.parse(json["createdAt"]),
//       updatedAt: DateTime.parse(json["updatedAt"]),
//       subscribeDate: json.containsKey('managers') ? DateTime.parse(json["managers"][0]["subscribeDate"]) : DateTime.now(),
//   );

//   Map<String, dynamic> toJson() => {
//       "id": id,
//       "name": name,
//       "email": email,
//       "avatar": avatar,
//       "language": language,
//       "role": role,
//       "phone": phone,
//       "address": address,
//       "createdAt": createdAt?.toIso8601String(),
//       "updatedAt": updatedAt?.toIso8601String(),
//       "subscribeDate": subscribeDate?.toIso8601String(),
      
//   };

//   static String serialize(User model) => json.encode(User.toMap(model));

//   static User deserialize(String json) => User.fromJson(json);
// }
