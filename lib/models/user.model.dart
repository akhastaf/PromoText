import 'dart:convert';

import 'package:flutter/material.dart';

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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
