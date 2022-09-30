import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    Login({
        required this.username,
        required this.password,
        this.token,
    });

    String username;
    String password;
    String? token;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        username: json["username"],
        password: json["password"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "token": token,
    };
}
