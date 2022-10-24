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
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    // required this.salesman,
  });

  int id;
  String name;
  String email;
  String avatar;
  String language;
  String role;
  String phone;
  String address;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  // SalesMan? salesman;

  factory User.fromJson(Map<String, dynamic> json) {
    // print('before ${json["salesman"]}');
    // SalesMan? s =
    //     json["salesman"] == null ? null : salesManFromJson(json["salesman"]);
    // if (json["salesman"] == null)
    //   print("null");
    // else
    //   print("not null");
    // print('after $s');
    return User(
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
      // salesman:
      //     json["salesman"] == null ? null : SalesMan.fromJson(json["salesman"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "avatar": avatar,
        "language": language,
        "role": role,
        "phone": phone,
        "address": address,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        // "salesman": salesman == null ? null : salesman?.toJson(),
      };
}

SalesMan salesManFromJson(String str) => SalesMan.fromJson(json.decode(str));

String salesManToJson(SalesMan data) => json.encode(data.toJson());

class SalesMan {
  SalesMan({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.language,
    required this.role,
    required this.phone,
    required this.address,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String avatar;
  String language;
  String role;
  String phone;
  String address;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory SalesMan.fromJson(Map<String, dynamic> json) => SalesMan(
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "avatar": avatar,
        "language": language,
        "role": role,
        "phone": phone,
        "address": address,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

// import 'dart:convert';

// User userFromJson(String str) => User.fromJson(json.decode(str));

// String userToJson(User data) => json.encode(data.toJson());

// class User {
//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.avatar,
//     required this.language,
//     required this.role,
//     required this.phone,
//     required this.address,
//     required this.salesman,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   int id;
//   String name;
//   String email;
//   String avatar;
//   String language;
//   String role;
//   String phone;
//   String address;
//   User? salesman;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//         avatar: json["avatar"],
//         language: json["language"],
//         role: json["role"],
//         phone: json["phone"],
//         address: json["address"],
//         salesman:json["salesman"] != null ? userFromJson(json["salesman"]) : null,
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "email": email,
//         "avatar": avatar,
//         "language": language,
//         "role": role,
//         "phone": phone,
//         "address": address,
//         // "salesman": salesman,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//       };
// }
