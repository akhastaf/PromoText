import 'dart:convert';

import 'package:promo_app/models/user.model.dart';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    Login({
        this.user,
        this.accessToken,
    });

    User? user;
    String? accessToken;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        user: User.fromJson(json["user"]),
        accessToken: json["access_token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "access_token": accessToken,
    };
}